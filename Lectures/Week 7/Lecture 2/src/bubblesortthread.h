#ifndef BUBBLESORTTHREAD_H
#define BUBBLESORTTHREAD_H
#include <QThread>
#include <QObject>
#include <QList>

class BubbleSortThread: public QThread
{
    Q_OBJECT
    void run()
    {
        // Initialize bubblesort variables
        int last_index = mOtherThreadsData->length()-1;
        int end_index = last_index;
        int run_times = 0;
        int times_to_run = last_index -1;
        int current_index = 0;
        int item_to_swap(0);
        int swap_at(0);

        // Run bubble sort
        if(last_index == 1) // Only 2 items (Check the two items and bounce)
        {
            swap_at = mOtherThreadsData->at(0);
            item_to_swap = mOtherThreadsData->at(1);
            if(swap_at > item_to_swap)
            {
                swapItems(0,1);

            }
            emit finishedSorting();
            return;
        }
        else if(last_index < 1) // one items or less
        {
            // if one does exist turn to red
            if(last_index == 0)
            {
            }
            emit finishedSorting();
            return;
        }
        while(run_times <= times_to_run)
        {
            for(current_index = 1; current_index <= end_index; current_index++)
            {
                swap_at = mOtherThreadsData->at(current_index-1);
                item_to_swap = mOtherThreadsData->at(current_index);
                if(swap_at > item_to_swap)
                {
                    swapItems(current_index-1,current_index);

                }
            }
            run_times++;
        }
        emit finishedSorting();
    }

signals:
    void swap(int index1,int index2);
    void finishedSorting();

public:
    BubbleSortThread(){}
    void setData(QList<int> * data)
    {
        if(data)
            mOtherThreadsData = data;
    }
    void swapItems(int index1, int index2)
    {
        int val1 = mOtherThreadsData->at(index1);
        (*mOtherThreadsData)[index1] = mOtherThreadsData->at(index2);
        (*mOtherThreadsData)[index2] = val1;
        emit swap(index1, index2);
        msleep(200); // comment sleep to see real sorting speed of moving to c++
    }

private:
    QList<int> * mOtherThreadsData;

};


#endif // BUBBLESORTTHREAD_H
