#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFont>
#include <QtQml>
#include "trans.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // that's just "global" setting for the font
    app.setFont(QFont("Titillium Web"));

    // object of our class with "magic" property for translation
    Trans trans;

    QQmlApplicationEngine engine;
    // make this object available from QML side
    engine.rootContext()->setContextProperty("trans", &trans);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
