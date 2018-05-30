#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QFont>
#include <QtQml>
#include "trans.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
//    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    // set the custom font from resources
    int id = QFontDatabase::addApplicationFont(":/fonts/TitilliumWeb-Regular.ttf");
    app.setFont(QFont(QFontDatabase::applicationFontFamilies(id).at(0)));
    // you can just comment this, really

    QQmlApplicationEngine engine;
    // object of our class with "magic" property for translation
    Trans trans(&engine);
    // make this object available from QML side
    engine.rootContext()->setContextProperty("trans", &trans);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
