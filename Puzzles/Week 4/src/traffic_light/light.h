#ifndef LIGHT_H
#define LIGHT_H

#include <QDebug>
#include <QObject>

enum Color
{
    RED = 0,
    YELLOW,
    GREEN
};

class Light : public QObject{
    Q_OBJECT
public:
    Light();
public slots:

    void set_color(Color color);
    int get_color();
    void set_light(bool is_on);
    bool get_light();
private:
    bool m_light_on;
    Color m_color;
};

#endif // LIGHT_H
