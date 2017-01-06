#ifndef TRANS_H
#define TRANS_H

#include <QObject>
#include <QTranslator>

class Trans : public QObject
{
    Q_OBJECT
    // that's the "magic" string for the trick
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

public:
    Trans();

    QString getEmptyString();

    Q_INVOKABLE void selectLanguage(QString language);

signals:
    void languageChanged();

private:
    QTranslator *translator;
};

#endif // TRANS_H
