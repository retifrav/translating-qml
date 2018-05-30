#ifndef TRANS_H
#define TRANS_H

#include <QObject>
#include <QTranslator>
#include <QDebug>
#include <QGuiApplication>
#include <QDir>
#include <QQmlEngine>

class Trans : public QObject
{
    Q_OBJECT
    // that's the "magic" string for the trick (not needed anymore since Qt 5.10)
    //Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

public:
    Trans(QQmlEngine *engine);

    //QString getEmptyString();

    Q_INVOKABLE void selectLanguage(QString language);

signals:
    void languageChanged();

private:
    QTranslator *_translator;
    QQmlEngine *_engine;
};

#endif // TRANS_H
