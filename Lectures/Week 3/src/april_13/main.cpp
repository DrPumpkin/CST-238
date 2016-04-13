//QQC
//Root C

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "person.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    person my_favorite_person;

    engine.rootContext()->setContextProperty("MyTeacher", &my_favorite_person);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
