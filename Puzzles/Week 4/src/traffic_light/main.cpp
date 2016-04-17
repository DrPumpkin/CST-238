#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "traffic_light.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QCoreApplication::setApplicationName("TrafficLight");
    QCoreApplication::setOrganizationName("Chessgames");
    QCoreApplication::setOrganizationDomain(".com");

    Traffic_Light traffic_light;

    engine.rootContext()->setContextProperty("TrafficLight", &traffic_light);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
