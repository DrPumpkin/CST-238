#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "loginmanager.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    LoginManager         user_login;
    engine.rootContext()->setContextProperty("Login",&user_login);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
