// Copyright (C) 2019 ~ 2020 Uniontech Software Technology Co.,Ltd.
// SPDX-FileCopyrightText: 2022 UnionTech Software Technology Co., Ltd.
//
// SPDX-License-Identifier: GPL-3.0-or-later

#include "imagepreviewutils.h"

#include <gtest/gtest.h>

TEST(UT_ImagePreviewUtils, isSupportedImagePath)
{
    EXPECT_TRUE(ImagePreviewUtils::isSupportedImagePath("a.jpg"));
    EXPECT_TRUE(ImagePreviewUtils::isSupportedImagePath("dir/PIC.JPEG"));
    EXPECT_TRUE(ImagePreviewUtils::isSupportedImagePath("dir/x.webp"));
    EXPECT_TRUE(ImagePreviewUtils::isSupportedImagePath("a.heic"));
    EXPECT_FALSE(ImagePreviewUtils::isSupportedImagePath("dir.jpg/a.txt"));
    EXPECT_FALSE(ImagePreviewUtils::isSupportedImagePath("a.txt"));
    EXPECT_FALSE(ImagePreviewUtils::isSupportedImagePath(""));
}

TEST(UT_ImagePreviewUtils, parentDirectory)
{
    EXPECT_EQ(ImagePreviewUtils::parentDirectory("dir/a.jpg"), QString("dir"));
    EXPECT_EQ(ImagePreviewUtils::parentDirectory("dir/sub/a.jpg"), QString("dir/sub"));
    EXPECT_EQ(ImagePreviewUtils::parentDirectory("a.jpg"), QString());
}

TEST(UT_ImagePreviewUtils, siblingImages)
{
    QMap<QString, FileEntry> entries;

    auto addEntry = [&entries](const QString &path, bool isDirectory = false) {
        FileEntry entry;
        entry.strFullPath = path;
        entry.strFileName = path.section('/', -1);
        entry.isDirectory = isDirectory;
        entries.insert(path, entry);
    };

    addEntry("pics/", true);
    addEntry("pics/a.jpg");
    addEntry("pics/b.PNG");
    addEntry("pics/note.txt");
    addEntry("pics/sub/deep.jpg");
    addEntry("root.jpg");

    const QList<FileEntry> siblings =
            ImagePreviewUtils::siblingImages(entries, entries.value("pics/a.jpg"));

    QStringList paths;
    for (const FileEntry &entry : siblings) {
        paths << entry.strFullPath;
    }

    EXPECT_EQ(paths, QStringList({"pics/a.jpg", "pics/b.PNG"}));

    // 根目录下的条目按根目录匹配，不会混入子目录图片
    const QList<FileEntry> rootSiblings =
            ImagePreviewUtils::siblingImages(entries, entries.value("root.jpg"));
    EXPECT_EQ(rootSiblings.size(), 1);
    EXPECT_EQ(rootSiblings.first().strFullPath, QString("root.jpg"));

    // 非图片不参与连续看图
    EXPECT_TRUE(ImagePreviewUtils::siblingImages(entries, entries.value("pics/note.txt")).isEmpty());

    // 点击项不在列表中时也要保证被解压
    FileEntry clicked;
    clicked.strFullPath = "pics/missing.png";
    clicked.strFileName = "missing.png";
    const QList<FileEntry> withMissing =
            ImagePreviewUtils::siblingImages(entries, clicked);
    ASSERT_FALSE(withMissing.isEmpty());
    EXPECT_EQ(withMissing.first().strFullPath, QString("pics/missing.png"));
}
