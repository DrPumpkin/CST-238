#include "sortmanager.h"
#include "bubblesortthread.h"

SortManager::SortManager(QObject *parent) : QObject(parent)
{

}

// round trip QML notify of value added
void SortManager::appendToList(int value)
{
    if(mSortThread != nullptr)
        return;

    mData.append(value);
    emit appendedValue(value);
}

void SortManager::cleanUpThread()
{
    disconnect(mSortThread, &BubbleSortThread::swap, this, &SortManager::swap);
    disconnect(mSortThread, &BubbleSortThread::finishedSorting, this, &SortManager::cleanUpThread);
    mSortThread->deleteLater();
    mSortThread = nullptr;
    emit finishedSorting();

}


void SortManager::runBubbleSort() // create the thread and start it
{
    if(mSortThread == nullptr)
    {
       mSortThread = new BubbleSortThread;
       mSortThread->setData(&mData);
       connect(mSortThread, &BubbleSortThread::swap, this, &SortManager::swap);
       connect(mSortThread, &BubbleSortThread::finishedSorting, this, &SortManager::cleanUpThread);
       mSortThread->start();
    }
}
