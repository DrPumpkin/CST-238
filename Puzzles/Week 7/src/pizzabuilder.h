#ifndef PIZZABUILDER_H
#define PIZZABUILDER_H

#include <QObject>
class PizzaProvider;

class PizzaBuilder : public QObject
{
    Q_OBJECT
public:
    explicit PizzaBuilder(PizzaProvider * provider, QObject *parent = 0);

signals:
    void updateLivePizza();
public slots:
   void chooseTopping(QString topping);
   void removeTopping(QString topping);
private:
    PizzaProvider * mPizzaProvider;
};

#endif // PIZZABUILDER_H
