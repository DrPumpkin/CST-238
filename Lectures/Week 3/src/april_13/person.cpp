#include "person.h"

person::person()
    :m_age(55), m_name("Stu"), m_is_good_person(false)
{
    qDebug() << "I am the constructor.";

}

void person::set_name(QString name)
{
    m_name = name;
}

QString person::get_name()
{
    return m_name;
}
