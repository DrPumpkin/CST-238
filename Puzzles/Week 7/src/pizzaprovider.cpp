#include "pizzaprovider.h"
#include <QPainter>
PizzaProvider::PizzaProvider(QObject *parent) : QObject(parent)
{
    // load pizza
    QImage *  image_to_load = new QImage(523,528, QImage::Format_RGB32);
    image_to_load->load(":/images/Pizza.png");
    m_loadedImages.insert("pizza",image_to_load);

    // load pepperonis
    image_to_load = new QImage(95,95, QImage::Format_RGB32);
    image_to_load->load(":/images/Pepperoni.png");
    m_loadedImages.insert("pepperonis",image_to_load);

    // load Anchovies
    image_to_load = new QImage(95,95, QImage::Format_RGB32);
    image_to_load->load(":/images/Anchoives.png");
    m_loadedImages.insert("fish",image_to_load);

    // load Tomatoes
    image_to_load = new QImage(95,95, QImage::Format_RGB32);
    image_to_load->load(":/images/Tomatoes.png");
    m_loadedImages.insert("tomatoes",image_to_load);

    // load Pineapple
    image_to_load = new QImage(95,95, QImage::Format_RGB32);
    image_to_load->load(":/images/Pineapple.png");
    m_loadedImages.insert("pineapple",image_to_load);

    // Load your new topping imagine like above
}

QQuickImageResponse * PizzaProvider::requestImageResponse(const QString &id, const QSize &requestedSize)
{
    AsyncPizzaResponse *response = new AsyncPizzaResponse(m_toppings,m_loadedImages, requestedSize);
    pool.start(response);
    return response;
}


PizzaProvider::~PizzaProvider() // will delete all images
{
    QImage * image;
    foreach(const QString &key, m_loadedImages.keys())
    {
        image = m_loadedImages.value(key);
        m_loadedImages.remove(key);
        delete image;
    }
    m_loadedImages.clear();
}






