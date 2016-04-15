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

    m_questions.append("If violent video games make people violent, then does Farmville make people farmers?");
    m_questions.append("If the school says sleep is important, ever wonder why does lab start at 8 am?");
    m_questions.append("If I download a movie in Jamaica, am I a pirate of the carribbean?");
    m_questions.append("If you're too hott for me, doesn't that make me cooler than you?");
    m_questions.append("If practice makes perfect and no one's perfect, why practice?");
    m_questions.append("In an abacus factory, being counter productive would be a good thing, right?");
    m_questions.append("If being hipster is mainstream and I am not a hipster Does that make me a hipster?");
    m_questions.append("if you put lil wayne and lil john together would you have a full size john wayne?");
    m_questions.append("If time is money, is an atm a time machine?");
    m_questions.append("Can a teacher give a homeless kid, homework?");
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
