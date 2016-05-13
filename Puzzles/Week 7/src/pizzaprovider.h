#ifndef PIZZAPROVIDER_H
#define PIZZAPROVIDER_H
#include <QObject>
#include <QQuickAsyncImageProvider>
#include <QThreadPool>
#include <QMap>
#include <QImage>
#include "asyncpizzaresponse.h"
class PizzaProvider : public QObject, public QQuickAsyncImageProvider
{
    Q_OBJECT
public:
    PizzaProvider(QObject *parent = nullptr);

    QQuickImageResponse *requestImageResponse(const QString &id, const QSize &requestedSize);

    ~PizzaProvider();

    void addTopping(QString &topping)
    {
        m_toppings.append(topping);
        emit readyForUpdate();
    }

    void removeTopping(QString &topping)
    {
        if(m_toppings.contains(topping))
        {
            m_toppings.removeAll(topping);
            emit readyForUpdate();
        }
    }
signals:
    void readyForUpdate(); // notifies QML to redraw the image!

private:
    QList<QString> m_toppings;
    QMap<QString,QImage *>   m_loadedImages;
    QThreadPool pool;
};
#endif // PIZZAPROVIDER_H
