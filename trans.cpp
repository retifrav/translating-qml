#include "trans.h"
#include <QDebug>
#include <QGuiApplication>
#include <QDir>

Trans::Trans()
{
    translator = new QTranslator(this);
}

QString Trans::getEmptyString()
{
    return QString();
}

void Trans::selectLanguage(QString language)
{
    // working folder
    QDir dir = QDir(qApp->applicationDirPath()).absolutePath();
//    #ifdef Q_OS_MACOS // crutch for Mac OS
//    dir.cdUp();
//    dir.cdUp();
//    dir.cdUp();
//    #endif
    qDebug() << dir.path();

    if (!translator->load(
                // for example, in case of "ru" language the file would be
                // translating-qml_ru.qm
                // extension is set automatically
                QString("translating-qml_%1").arg(language),
                // look for the file in the "i18n" near the application
                QString("%1/i18n").arg(dir.path())
                )
            )
    {
        qDebug() << "Failed to load translation file, falling back to English";
    }
    // it's a global thing, we can use it anywhere (after #including <QGuiApplication>)
    qApp->installTranslator(translator);

    emit languageChanged();
}
