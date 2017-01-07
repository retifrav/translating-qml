QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
    trans.cpp

RESOURCES += qml.qrc \
    fonts.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    trans.h

# list of source files containing strings for translation
lupdate_only { # that way those files will be skipped by C++ compiler
    SOURCES = *.qml # \
              # pages/*.qml
}

# list of language files that will store translated strings for every language we want
# create i18n directory first, if you don't have it
TRANSLATIONS = i18n/translating-qml_de.ts \
               i18n/translating-qml_no.ts \
               i18n/translating-qml_ru.ts
