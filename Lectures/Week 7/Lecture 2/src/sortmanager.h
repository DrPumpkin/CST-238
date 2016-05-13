#ifndef SORTMANAGER_H
#define SORTMANAGER_H

#include <QObject>
#include <QList>
class BubbleSortThread;

class SortManager : public QObject
{
    Q_OBJECT
public:
    explicit SortManager(QObject *parent = 0);

signals: // interface signals to notify QML
    void swap(int index1, int index2);
    void finishedSorting();
    void appendedValue(int value);

public slots:   // Slots to be invoked from QML
    void appendToList(int value);
    void runBubbleSort();

private:
    QList<int>  mData;
    BubbleSortThread *mSortThread = nullptr;

private slots:
    void cleanUpThread(); // internal clean up of thread
};

#endif // SORTMANAGER_H
