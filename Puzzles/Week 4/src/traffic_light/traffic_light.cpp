#include "traffic_light.h"

Traffic_Light::Traffic_Light()
{
    for(int i = 0; i < 3; i++)
    {
        m_light[i].set_color(static_cast<Color>(i));
        m_light[i].set_light(false);
    }

    m_light[0].set_light(true); // Red light

    qDebug() << "Traffic light ctor.";
}

bool Traffic_Light::get_light_on(int index)
{
    return m_light[index].get_light();
}

void Traffic_Light::toggle_light(int index)
{
    for(int i = 0; i < 3; i++)
    {
        if(i == index)
            m_light[i].set_light(true);
        else
            m_light[i].set_light(false);
    }
}

