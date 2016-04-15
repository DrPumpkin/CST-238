#include "person.h"

person::person()
    :m_name("Russ"), m_age(21)
{

}

void person::set_name(QString name)
{
    m_name = name;
}

QString person::get_name()
{
    return m_name;
}
