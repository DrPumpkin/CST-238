#include "drawer.h"
#include <QColor>
#include <QTimer>
Drawer::Drawer(QImage *image, QObject *parent) : QObject(parent),
    m_image(image)
{
    // set the update timer (change depending on CPU)
    m_updateTimer.setInterval(100);
    m_updateTimer.setSingleShot(false);
    // Connection of Signal and Slot
    connect(&m_updateTimer,&QTimer::timeout,this,&Drawer::updatedPixmap);
}


void Drawer::drawToImage(int x, int y, int weight, QColor color)
{
    // Should be moved to a separate thread or could block GUI
    for(int index(0); index < weight; index++)
    {
        m_image->setPixel((x +index) ,(y + index),color.rgb());
    }
    if(!m_updateTimer.isActive())
        m_updateTimer.start();
}
