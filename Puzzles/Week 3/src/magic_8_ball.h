#ifndef MAGIC_8_BALL_H
#define MAGIC_8_BALL_H

#include <QObject>
#include <QList>
#include <QDebug>
#include <QtGlobal>
#include <QTime>

enum State
{
    WAITING_FOR_TEXT = 0,
    WAITING_FOR_SHAKE,
    SHAKING
};

class magic_8_ball : public QObject
{
    Q_OBJECT

public:
    explicit magic_8_ball();
    ~magic_8_ball();

public slots:
    void set_question(QString question);
    QString get_question();
    QString get_question(int index);
    QString get_saying(int index);
    bool get_is_draggable();
    void set_draggable(bool is_draggable);
    State get_state();

private:
    QString m_question;
    QList<QString> m_questions;
    QList<QString> m_sayings;
    bool m_draggable;
    State m_state;

};

#endif // MAGIC_8_BALL_H
