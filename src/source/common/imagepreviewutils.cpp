// Copyright (C) 2019 ~ 2020 Uniontech Software Technology Co.,Ltd.
// SPDX-FileCopyrightText: 2022 UnionTech Software Technology Co., Ltd.
//
// SPDX-License-Identifier: GPL-3.0-or-later

#include "imagepreviewutils.h"

#include <QSet>

namespace {

// 连续看图支持的图片后缀（与 QArchiver 一致）
// Image suffixes supported by continuous preview (same as QArchiver).
const QStringList &supportedImageSuffixes()
{
    static const QStringList suffixes = {
        QStringLiteral(".jpg"),
        QStringLiteral(".jpeg"),
        QStringLiteral(".jfif"),
        QStringLiteral(".png"),
        QStringLiteral(".svg"),
        QStringLiteral(".webp"),
        QStringLiteral(".gif"),
        QStringLiteral(".bmp"),
        QStringLiteral(".ico"),
        QStringLiteral(".tif"),
        QStringLiteral(".tiff"),
        QStringLiteral(".heic"),
        QStringLiteral(".avif"),
        QStringLiteral(".jxl")
    };
    return suffixes;
}

} // namespace

bool ImagePreviewUtils::isSupportedImagePath(const QString &path)
{
    const QString lowerPath = path.toLower();
    const QStringList &suffixes = supportedImageSuffixes();
    for (const QString &suffix : suffixes) {
        if (lowerPath.endsWith(suffix)) {
            return true;
        }
    }

    return false;
}

QString ImagePreviewUtils::parentDirectory(const QString &entryPath)
{
    QString normalized = entryPath;
    normalized.replace(QLatin1Char('\\'), QLatin1Char('/'));

    const int slash = normalized.lastIndexOf(QLatin1Char('/'));
    return slash < 0 ? QString() : normalized.left(slash);
}

QList<FileEntry> ImagePreviewUtils::siblingImages(const QMap<QString, FileEntry> &entries,
                                                  const FileEntry &clicked)
{
    QList<FileEntry> images;
    if (clicked.strFullPath.isEmpty() || !isSupportedImagePath(clicked.strFullPath)) {
        return images;
    }

    const QString targetDirectory = parentDirectory(clicked.strFullPath);
    QSet<QString> seen;

    for (auto iter = entries.constBegin(); iter != entries.constEnd(); ++iter) {
        const FileEntry &entry = iter.value();
        if (entry.isDirectory || entry.strFullPath.isEmpty()) {
            continue;
        }

        if (parentDirectory(entry.strFullPath) != targetDirectory
            || !isSupportedImagePath(entry.strFullPath)
            || seen.contains(entry.strFullPath)) {
            continue;
        }

        seen.insert(entry.strFullPath);
        images << entry;
    }

    // 即使归档列表漏掉点击项，也保证点击项会被解压
    // Keep the clicked image even if a backend's listing omitted it.
    if (!seen.contains(clicked.strFullPath)) {
        images.prepend(clicked);
    }

    return images;
}
