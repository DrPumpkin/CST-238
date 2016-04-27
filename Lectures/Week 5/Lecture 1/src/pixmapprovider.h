#ifndef PIXMAPPROVIDER_H
#define PIXMAPPROVIDER_H

#include <QObject>
#include <QQuickImageProvider>
#include <QString>


// This class performs two functions
// Loading an external image based on the id passed
// Generates a pixmap for Qml to use.
class PixmapProvider : public QQuickImageProvider // must inherit QQuickImageProvider
{
public:
    PixmapProvider();
    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize);
    void    setImage(QString id);
    ~PixmapProvider();
private:
    QImage*   m_loadedImage = nullptr;  //stores the loaded image
    QString      m_currentImage = "1";  //stores an id of the current loaded image

};

#endif // PIXMAPPROVIDER_H
