#include "magic_8_ball.h"

magic_8_ball::magic_8_ball()
    : m_draggable(false), m_state(WAITING_FOR_TEXT)
{
    qDebug() << "Hello, I am magic 8 ball!  What is your question? ";

    m_sayings.append("Yes.");
    m_sayings.append("No.");
    m_sayings.append("Maybe.");
    m_sayings.append("Zac Efron.");
    m_sayings.append("Ronda Rousey.");

    m_questions.append("If violent games make people violent, then does Farmville make people farmers?");
    m_questions.append("If the school says sleep is important, ever wonder why does lab start at 8 am?");
    m_questions.append("If I download a movie in Jamaica, am I a pirate of the carribbean?");
    m_questions.append("While you're waiting for the waiter, in that moment do you not become the waiter?");
    m_questions.append("If a vampire bites a zombie, will it turn into a zombie or will the zombie turn into a vampire?");
    m_questions.append("In an abacus factory, being counter productive would be a good thing, right?");
    m_questions.append("If being hipster is mainstream and I am not a hipster Does that make me a hipster?");
    m_questions.append("if you put lil wayne and lil john together would you have a full size john wayne?");
    m_questions.append("those first two guys who thought superman was a bird or a plane ever wonder why were they so excited?");
    m_questions.append("If a word in the dictionary is misspelled ever wonder How we Know?");
    m_questions.append("if the earth is the third planet from the sun then isn't every country a third world country?");
    m_questions.append("If the zombie apocalypse happens in Vegas, would it stay in Vegas?");
    m_questions.append("if a girl from iceland and a guy from cuba have a kid... will he be an icecube?");
    m_questions.append("If left got mad at right and right left Is left right?");

    QTime time = QTime::currentTime();
    qsrand((uint)time.msec());

    int rand_num = qrand() % ((13 + 1) - 0) + 0;

    m_question = this->get_question(rand_num);
}

QString magic_8_ball::get_question(int index)
{
    return m_questions.at(index);
}

QString magic_8_ball::get_saying(int index)
{
    return m_sayings.at(index);
}

bool magic_8_ball::get_is_draggable()
{
    return m_draggable;
}

State magic_8_ball::get_state()
{
    return m_state;
}

void magic_8_ball::set_question(QString question)
{
    m_question = question;
}

void magic_8_ball::set_draggable(bool is_draggable)
{
    if(is_draggable == true)
        m_draggable = true;
    else
        m_draggable = false;
}

QString magic_8_ball::get_question()
{
    return m_question;
}

magic_8_ball::~magic_8_ball()
{}
