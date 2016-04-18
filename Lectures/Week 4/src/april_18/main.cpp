#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QCoreApplication::setApplicationName("April18");
    QCoreApplication::setOrganizationName("Chessgames");
    QCoreApplication::setOrganizationDomain(".com");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
