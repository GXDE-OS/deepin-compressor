######################################################################
# Automatically generated by qmake (3.0) ?? 12? 20 11:40:37 2017
######################################################################

QT += core gui dtkwidget svg dbus x11extras concurrent xml KCodecs dtkgui
#private
QT += gui-private

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TEMPLATE = app
TARGET = deepin-compressor

CONFIG += c++11 link_pkgconfig
PKGCONFIG +=  gsettings-qt libsecret-1 gio-unix-2.0  disomaster  dtkwidget dtkgui udisks2-qt5 disomaster

DEFINES += QT_MESSAGELOGCONTEXT
#DEFINES += __aarch64__

INCLUDEPATH +=  $$PWD/source/inc/ \
                $$PWD/interface/
#                $$PWD/../plugin/libLogPlugin
#LIBS += -L/data/home/gaoxiang/GX/dvp/project/compressor/jared-compress/build-compressor-unknown-Debug/plugin/libLogPlugin -llibLogPlugin

# Input
HEADERS +=  \
    source/inc/compressorapplication.h \
    source/inc/homepage.h \
    source/inc/logviewheaderview.h \
    source/inc/mainwindow.h \
    source/inc/utils.h \
    source/inc/fileViewer.h \
    source/inc/compresspage.h \
    source/inc/uncompresspage.h \
    source/inc/compresssetting.h \
    source/inc/lib_edit_button.h \
    source/inc/progress.h \
    source/inc/compressor_success.h \
    source/inc/compressor_fail.h \
    source/inc/myfilesystemmodel.h \
    source/inc/archivemodel.h \
    interface/analysepsdtool.h \
    interface/archiveinterface.h \
    interface/cliinterface.h \
    interface/archiveentry.h \
    interface/archive_manager.h \
    interface/options.h \
    interface/jobs.h \
    interface/queries.h \
    interface/archivejob_p.h \
    interface/archivejob.h \
    interface/mimetypes.h \
    interface/pluginmanager.h \
    interface/plugin.h \
    interface/kpluginfactory_p.h \
    interface/kpluginmetadata.h \
    interface/kpluginfactory.h \
    interface/kpluginloader.h \
    interface/kexportplugin.h \
    interface/desktopfileparser_p.h \
    interface/cliproperties.h \
    interface/archiveformat.h \
    interface/kcoreaddons_export.h \
    interface/kprocess.h \
    interface/kprocess_p.h \
    interface/customdatainfo.h \
    source/inc/encryptionpage.h \
    source/inc/progressdialog.h \
    source/inc/extractpausedialog.h \
    source/inc/settingdialog.h \
    source/inc/myfileitem.h \
    source/inc/encodingpage.h \
    source/inc/mimetypedisplaymanager.h \
    source/inc/archivesortfiltermodel.h \
    source/inc/batchextract.h \
    interface/batchjobs.h \
    source/inc/batchcompress.h \
    source/inc/openwithdialog/basedialog.h \
    source/inc/openwithdialog/desktopfile.h \
    source/inc/openwithdialog/dfmstandardpaths.h \
    source/inc/openwithdialog/dmimedatabase.h \
    source/inc/openwithdialog/durl.h \
    source/inc/openwithdialog/mimesappsmanager.h \
    source/inc/openwithdialog/openwithdialog.h \
    source/inc/openwithdialog/properties.h \
    source/inc/openwithdialog/singleton.h \
    interface/filewatcher.h\
    source/inc/monitorAdaptor.h \
    source/inc/monitorInterface.h \
    interface/TSMutex.h \
    interface/TSSingleton.h \
    interface/globalarchivemanager.h \
    interface/tsconstval.h \
    interface/tscommontypes.h \
    interface/tstypes.h \
    interface/globalarchivemanager_p.h \
    interface/archiverunnable.h \
    interface/structs.h \
    source/inc/openloadingpage.h





SOURCES +=  \
    source/src/homepage.cpp \
    main.cpp \
    source/src/mainwindow.cpp \
    source/src/utils.cpp \
    source/src/fileViewer.cpp \
    source/src/compresspage.cpp \
    source/src/uncompresspage.cpp \
    source/src/compresssetting.cpp \
    source/src/lib_edit_button.cpp \
    source/src/progress.cpp \
    source/src/compressor_success.cpp \
    source/src/compressor_fail.cpp \
    source/src/myfilesystemmodel.cpp \
    source/src/archivemodel.cpp \
    source/src/encryptionpage.cpp \
    interface/analysepsdtool.cpp \
    interface/archiveinterface.cpp \
    interface/cliinterface.cpp \
    interface/archiveentry.cpp \
    interface/archive_manager.cpp \
    interface/options.cpp \
    interface/jobs.cpp \
    interface/queries.cpp \
    interface/archivejob.cpp \
    interface/mimetypes.cpp \
    interface/pluginmanager.cpp \
    interface/plugin.cpp \
    interface/kpluginfactory.cpp \
    interface/kpluginloader.cpp \
    interface/kpluginmetadata.cpp \
    interface/desktopfileparser.cpp \
    interface/cliproperties.cpp \
    interface/archiveformat.cpp \
    interface/kprocess.cpp \
    source/src/progressdialog.cpp \
    source/src/extractpausedialog.cpp \
    source/src/settingdialog.cpp \
    source/src/myfileitem.cpp \
    source/src/encodingpage.cpp \
    source/src/mimetypedisplaymanager.cpp \
    source/src/archivesortfiltermodel.cpp \
    source/src/batchextract.cpp \
    interface/batchjobs.cpp \
    source/src/settings_translation.cpp \
    source/src/logviewheaderview.cpp \
    source/src/batchcompress.cpp \
    source/src/openwithdialog/basedialog.cpp \
    source/src/openwithdialog/desktopfile.cpp \
    source/src/openwithdialog/dfmstandardpaths.cpp \
    source/src/openwithdialog/dmimedatabase.cpp \
    source/src/openwithdialog/durl.cpp \
    source/src/openwithdialog/mimesappsmanager.cpp \
    source/src/openwithdialog/openwithdialog.cpp \
    source/src/openwithdialog/properties.cpp \
    interface/filewatcher.cpp\
    source/src/monitorAdaptor.cpp \
    source/src/monitorInterface.cpp \
    interface/TSMutex.cpp \
    interface/globalarchivemanager.cpp \
    interface/archiverunnable.cpp \
    interface/structs.cpp \
    source/src/openloadingpage.cpp


RESOURCES += deepin-compressor.qrc
RESOURCES += config.qrc
TRANSLATIONS += ../translations/*.ts

isEmpty(BINDIR):BINDIR=/usr/bin
isEmpty(APPDIR):APPDIR=/usr/share/applications
isEmpty(DSRDIR):DSRDIR=/usr/share/deepin-compressor
isEmpty(DESKTOPDIR):DESKTOPDIR=/usr/share/deepin/dde-file-manager/oem-menuextensions

target.path = $$INSTROOT$$BINDIR

desktop.path = $$INSTROOT$$APPDIR
desktop.files =  deepin-compressor.desktop

desktopcontext.path = $$INSTROOT$$DESKTOPDIR
desktopcontext.files +=  deepin-compress.desktop deepin-decompress.desktop deepin-decompresshere.desktop deepin-compress-multi.desktop deepin-decompress-split.desktop deepin-decompresshere-split.desktop deepin-decompress-multi.desktop deepin-decompresshere-multi.desktop deepin-compress-to_zip.desktop deepin-compress-to_7z.desktop
desktopcontext.files +=  deepin-decompress-split_multi.desktop deepin-decompresshere-split_multi.desktop

manual.path = /usr/share/dman/
manual.files = $$PWD/dman/*

## Automating generation .qm files from .ts files
#!system($$PWD/translate_generation.sh): error("Failed to generate translation")

#translations.path = /usr/share/deepin-compressor/translations
#translations.files = $$PWD/translations/*.qm

CONFIG(release, debug|release) {
    TRANSLATIONS = $$files($$PWD/../translations/*.ts)
    #遍历目录中的ts文件，调用lrelease将其生成为qm文件
    for(tsfile, TRANSLATIONS) {
        qmfile = $$replace(tsfile, .ts$, .qm)
        system(lrelease $$tsfile -qm $$qmfile) | error("Failed to lrelease")
    }
    #将qm文件添加到安装包
    dtk_translations.path = /usr/share/$$TARGET/translations
    dtk_translations.files = $$PWD/../translations/*.qm
    INSTALLS += dtk_translations
}

icon_files.path = /usr/share/icons/hicolor/scalable/apps
icon_files.files = $$PWD/assets/icons/deepin/builtin/icons/deepin-compressor.svg

mime_file.path = /usr/share/mime/packages
mime_file.files = $$PWD/assets/mimetype/*.xml

INSTALLS += target desktop icon_files desktopcontext mime_file

DISTFILES += \
    ../README.md \
    ../debian/control \
    ../debian/rules \
    ../translations/*.ts
