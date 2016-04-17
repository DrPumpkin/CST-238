#include "traffic_light.h"

Traffic_Light::Traffic_Light()
{
    qDebug() << "Traffic light ctor.";
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

