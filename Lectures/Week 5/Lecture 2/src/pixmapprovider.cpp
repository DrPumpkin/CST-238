#include "pixmapprovider.h"
#include <QUrl>
#include <QDebug>
#include <QByteArray>
#include <QFile>

PixmapProvider::PixmapProvider()
 : QQuickImageProvider(QQuickImageProvider::Pixmap)
{
    setImage(m_currentImage);
}

QPixmap PixmapProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    int width = 800;
    int height = 600;
    if(id.compare(m_currentImage) != 0)
    {
        setImage(id);
    }
    if (size)
    {
        *size = QSize(width, height);
    }
    QPixmap pixmap(width,height);
    if(m_loadedImage)
    {
        pixmap = pixmap.fromImage(*m_loadedImage);
    }
    return pixmap;
}


void PixmapProvider::setImage(QString id)
{
    if(m_loadedImage)
    {
        m_loadedImage->detach();
        delete m_loadedImage;
    }
    m_loadedImage = new QImage(":/" +id);

    m_currentImage = id;

}

PixmapProvider::~PixmapProvider(){
    if(m_loadedImage)
    {
        m_loadedImage->detach();
    }
    delete m_loadedImage;
}
