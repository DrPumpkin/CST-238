#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "sortmanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    SortManager    manager;
    // adding the C++ object to Qml Context
    engine.rootContext()->setContextProperty("SortManager", &manager);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
