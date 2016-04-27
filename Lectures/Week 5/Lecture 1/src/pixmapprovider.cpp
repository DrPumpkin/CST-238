#include "pixmapprovider.h"
#include <QUrl>
#include <QDebug>
#include <QByteArray>
#include <QFile>

PixmapProvider::PixmapProvider()
 : QQuickImageProvider(QQuickImageProvider::Pixmap)
{
    setImage(m_currentImage); // set the initial image to 1
}

// Generates the pixmap from a the requested 'id'
QPixmap PixmapProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    int width = 100;
    int height = 50;

    if(id.compare(m_currentImage) != 0) // check if requesting same image
    {
        setImage(id);
    }

    if(m_loadedImage) // if a valid image is loaded - grab widht and height
    {
        width = m_loadedImage->width();
        height = m_loadedImage->height();
    }

    if (size) // if the size pointer exists, another object (outside of this function) is requesting the size knowledge
    {
        *size = QSize(width, height); // set the size object
    }

    QPixmap pixmap(width,height); // generate a new pixmap
    if(m_loadedImage)
    {
        pixmap = pixmap.fromImage(*m_loadedImage); // generate image
    }

    return pixmap; // seems bad to return a local object - NO WORRIES Qt uses Implicit Sharing - http://doc.qt.io/qt-5/implicit-sharing.html
}


void PixmapProvider::setImage(QString id)
{
    if(m_loadedImage) // if the image is loaded - delete it
    {
        m_loadedImage->detach(); // detach implicit sharing
        delete m_loadedImage;    // delete the image
    }
    m_loadedImage = new QImage(":/" +id); // load the new image
    m_currentImage = id;                  // update current ID

}

PixmapProvider::~PixmapProvider()   // cleanup when the destructor is called
{
    if(m_loadedImage)
    {
        m_loadedImage->detach();
    }
    delete m_loadedImage;
}
