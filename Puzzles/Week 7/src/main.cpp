#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "pizzaprovider.cpp"
#include <QQmlContext>
#include "pizzabuilder.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    PizzaProvider * pizza_provider = new PizzaProvider; // provides the pixel buffer
    PizzaBuilder    builder(pizza_provider,&app);       // provides C++ interface to data
    engine.addImageProvider("live", pizza_provider);

	/********************** NOTE FROM GARY ******************************
	* Corporate shut me down. I was so close to realizing the pizza 
	* builder. I hope this PizzaProvider and PizzaBuilder object help
	* you build what corporate is looking for. If not start packing.
	*********************************************************************/
	
    // uncomment this line to connect the PizzaBuilder
    engine.rootContext()->setContextProperty("PizzaBuilder", &builder);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
