#ifndef DRAWER_H
#define DRAWER_H

#include <QObject>
#include <QImage>
#include <QColor>
#include <QTimer>

class Drawer : public QObject
{
    Q_OBJECT
public:
    explicit Drawer(QImage * image,QObject *parent = 0);

signals:
    void updatedPixmap(); // notifies QML to update source

public slots:
    void drawToImage(int x, int y, int weight, QColor color); // performs a C++ operation on the image

private:
    QImage * m_image;
    QTimer   m_updateTimer; // how often to refresh image with the pixmap data
};

#endif // DRAWER_H
