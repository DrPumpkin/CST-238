#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "pixmapprovider.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Generate the C++ object - note QQuickImageProviders are reparented - so the engine deletes them
    PixmapProvider*       pmapp(new PixmapProvider());

    // Define the extension the image provider will map too and hand off image provider
    engine.addImageProvider("backgrounds",pmapp);

    // Load QML engine after the image provider is added (otherwise fetching the first image will fail)
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
