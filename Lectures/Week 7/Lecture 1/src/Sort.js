function swapItems(item1,item2)
{
    var swap_val = item1.numberVal;
    item1.numberVal = item2.numberVal;
    item2.numberVal = swap_val;
    //console.log("Swapping -", item1.numberVal, " and ", item2.numberVal)
}

WorkerScript.onMessage = function(message) {
    var data_model = message.item
    data_model.sync();
    var last_index = data_model.count-1;
    var end_index = last_index;
    var run_times = 0;
    var times_to_run = last_index -1;
    var current_index = 0;
    var item_to_swap = null;
    var swap_at = null;
    var reply = null;
    console.log("Sort called with count of ", data_model.count)
    // Run bubble sort
    if(last_index == 1) // Only 2 items (Check the two items and bounce)
    {
        swap_at = data_model.get(0);
        item_to_swap = data_model.get(1);
        if(swap_at.numberVal > item_to_swap.numberVal)
        {
            swapItems(item_to_swap,swap_at)
            reply = { "index1":0, "index2":1}
            WorkerScript.sendMessage({'reply':reply});
        }
        reply = { "sorted":true, "index":0}
        WorkerScript.sendMessage({'reply':reply});

        reply = { "sorted":true, "index":1}
        WorkerScript.sendMessage({'reply':reply});
        return;
    }
    else if(last_index < 1) // one items or less
    {
        // if one does exist turn to red
        if(last_index == 0)
        {
            reply = { "sorted":true, "index":0}
            WorkerScript.sendMessage({'reply':reply});
        }

        return;
    }
    while(run_times <= times_to_run)
    {
        for(current_index = 1; current_index <= end_index; current_index++)
        {
            swap_at = data_model.get(current_index-1);
            item_to_swap = data_model.get(current_index);
            var sleep_a_few  = 0;
            while(sleep_a_few < 13800) // no method to sleep in JS, normally this would be bad
            {
                var value = Math.random() * 10000;// - but we want to animate the sort (could have used a time in main thread as well)
                value /= 4;
                sleep_a_few++;
            }
            if(swap_at.numberVal > item_to_swap.numberVal)
            {
                swapItems(swap_at,item_to_swap)
                reply = { "index1":current_index-1, "index2":current_index}
                WorkerScript.sendMessage({'reply':reply});
            }
            else // found position
            {
                reply = { "sorted":true, "index":current_index}
                WorkerScript.sendMessage({'reply':reply});
            }

        }
        run_times++;
    }
    // Done so make sure last and first is marked as sorted
    reply = { "sorted":true, "index":data_model.count-1}
    WorkerScript.sendMessage({'reply':reply});
    reply = { "sorted":true, "index":0}
    WorkerScript.sendMessage({'reply':reply});
    reply = { "finished":true}
    WorkerScript.sendMessage({'reply':reply});
}
