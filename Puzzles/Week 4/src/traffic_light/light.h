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

    void set_color(Color color);
    Color get_color();
    void set_light(bool is_on);
    bool get_light();
private:
    Color m_color;
    bool m_light_on;
};

#endif // LIGHT_H
