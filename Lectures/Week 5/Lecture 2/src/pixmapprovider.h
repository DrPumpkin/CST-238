#ifndef PIXMAPPROVIDER_H
#define PIXMAPPROVIDER_H

#include <QObject>
#include <QQuickImageProvider>
#include <QString>
class PixmapProvider : public QQuickImageProvider
{

public:
    PixmapProvider();
    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize);
    void    setImage(QString id);
    QImage *getImage()
    {
        return m_loadedImage;
    }

    ~PixmapProvider();
private:
    QImage*   m_loadedImage = nullptr;
    QString   m_currentImage = "1";

};

#endif // PIXMAPPROVIDER_H
