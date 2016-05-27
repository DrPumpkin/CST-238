#include "loginmanager.h"

LoginManager::LoginManager(QObject *parent) : QObject(parent)
{
    addValidUsers();
}

void LoginManager::addValidUsers()
{
    mUserDB.insert("admin","IRuleOver4LL");
}


void LoginManager::validateUser(QString username, QString password)
{
    // if valid user, emit valid user and the image connected


    // else emit invalid

}
