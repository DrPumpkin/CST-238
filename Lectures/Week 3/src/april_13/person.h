#ifndef PERSON_H
#define PERSON_H

#include <QString>
#include <QObject>
#include <QDebug>

class person : public QObject
{
    Q_OBJECT
public:
    person();

public slots:
    void set_name(QString);
    QString get_name();

private:
    QString m_name;
    int m_age;
    bool m_is_good_person;

};

#endif // PERSON_H
