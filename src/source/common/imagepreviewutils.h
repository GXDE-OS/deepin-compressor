// Copyright (C) 2019 ~ 2020 Uniontech Software Technology Co.,Ltd.
// SPDX-FileCopyrightText: 2022 UnionTech Software Technology Co., Ltd.
//
// SPDX-License-Identifier: GPL-3.0-or-later

#ifndef IMAGEPREVIEWUTILS_H
#define IMAGEPREVIEWUTILS_H

#include "commonstruct.h"

#include <QList>
#include <QMap>
#include <QString>

// 压缩包内图片连续预览的辅助函数
// Helpers for continuous image preview inside archives.
namespace ImagePreviewUtils {

/**
 * @brief isSupportedImagePath   是否为连续看图支持的图片后缀
 * @param path                   归档内条目路径
 * @return                       是图片时返回 true（后缀匹配不区分大小写）
 *
 * 后缀列表与 QArchiver 的连续看图保持一致。
 * The suffix list matches QArchiver's continuous preview.
 */
bool isSupportedImagePath(const QString &path);

/**
 * @brief parentDirectory   归档内条目路径的目录部分
 * @param entryPath         归档内条目路径
 * @return                  目录部分；根目录下的条目返回空字符串
 */
QString parentDirectory(const QString &entryPath);

/**
 * @brief siblingImages 获取与点击项同目录的图片条目
 * @param entries       压缩包内所有条目（key 为 strFullPath）
 * @param clicked       当前点击的图片条目
 * @return              同目录的直接图片条目，包含点击项本身；
 *                      不进入子目录，跳过目录项
 *
 * 连续看图时这些图片会被一起解压到同一个临时目录，
 * 系统看图器即可在同一目录内上一张/下一张切换。
 * The clicked image and its same-directory siblings are extracted together
 * so a system image viewer that browses the containing folder can switch
 * between them.
 */
QList<FileEntry> siblingImages(const QMap<QString, FileEntry> &entries,
                               const FileEntry &clicked);

} // namespace ImagePreviewUtils

#endif // IMAGEPREVIEWUTILS_H
