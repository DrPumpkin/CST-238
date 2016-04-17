#include "light.h"

Light::Light()
{
    qDebug() << "Light ctor.";
}

void Light::set_color(Color color)
{
    m_color = color;
}

Color Light::get_color()
{
    return m_color;
}

void Light::set_light(bool is_on)
{
    if(is_on == true)
        m_light_on = true;
    else
        m_light_on = false;
}

bool Light::get_light()
{
    return m_light_on;
}
