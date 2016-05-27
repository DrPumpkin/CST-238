#ifndef LOGINMANAGER_H
#define LOGINMANAGER_H

#include <QObject>
#include <QMap>
#include <QString>

class LoginManager : public QObject
{
    Q_OBJECT
public:
    explicit LoginManager(QObject *parent = 0);

signals:
    void userLoginInvalid(QString username);
    void userLoginValid(QString username, QString image);
public slots:
    void validateUser(QString username, QString password);

private:
    QMap<QString,QString>     mUserDB;

    void    addValidUsers();

};

#endif // LOGINMANAGER_H
