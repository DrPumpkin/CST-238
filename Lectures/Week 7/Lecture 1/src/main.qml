import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id:mainWindow
    visible: true
    color:"teal"
    ListModel{   // Empty list
        id:listItems
        /* ListElement{ // initialize with an element
            numberVal:777
        }*/
    }
    Rectangle{ // Gridview container
        anchors.fill:parent
        anchors.leftMargin: parent.width * .1
        anchors.rightMargin: parent.width * .1
        anchors.topMargin: parent.height *.05
        anchors.bottomMargin: parent.height *.2
        clip:true
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#6b7cff";
            }
            GradientStop {
                position: 1.00;
                color: "#001dff";
            }
        }
        GridView{ // GridView to show the items
            antialiasing: true
            id:numberList
            anchors.fill: parent
            anchors.margins: 10
            add: Transition {
                NumberAnimation { alwaysRunToEnd: true; property: "opacity"; from: 0; to: 1.0; duration: 200 }
                NumberAnimation { alwaysRunToEnd: true; property: "scale"; from: 0; to: 1.0; duration: 200 }
            }

            displaced: Transition {
                      NumberAnimation { alwaysRunToEnd: true; properties: "x,y"; duration: 200 }
                      NumberAnimation { alwaysRunToEnd: true; property: "scale"; from: 1.4; to: 1.0; duration: 200 }
                  }
            model:listItems

            delegate: NumberItem{
                number:numberVal
            }
        }
    }


    ButtonTray{
        id:buttonTray
        width:parent.width * .8
        height:parent.height * .15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.bottom
        anchors.bottomMargin: parent.height *.01
        onRandomClicked: {
            // Add a random value
            var random_value = Math.random() * 1000;
            random_value = Math.round(random_value);
            listItems.append({"numberVal":random_value});
        }
        onAddClicked: {
            // Add the input value
            if(numberIn.text != "")
            {
                listItems.append({"numberVal":parseInt(numberIn.text)});
            }
        }
        onSortClicked:{
            // Demonstrate random swap
            //var random_index = Math.random() * listItems.count;
            //var random_index2 = Math.random() * listItems.count;
            //listItems.move(random_index,random_index2,1)

            // Send items to WorkerScript for processing
            console.log("List model has ", numberList.model.count, " Objects when starting sort");
            workerScript.sendMessage({'item':listItems})
        }
    }
    Rectangle{
        border.width: 2
        width:buttonTray.width/3
        height:30
        anchors.bottom: buttonTray.top
        anchors.horizontalCenter:buttonTray.horizontalCenter
        TextInput{
            id: numberIn
            anchors.fill:parent
            anchors.margins:2
            validator:IntValidator{
                bottom:0
                top:1000
            }
            font.pixelSize: 21
            horizontalAlignment: Text.AlignHCenter
        }
    }

    // Declare the WorkerScript for sorting the list
    WorkerScript{
        id: workerScript
        source:"Sort.js"
        onMessage: { // on message received from WorkerScript thread
            // recieve the reply
            var reply = messageObject.reply;
            if(reply.sorted !== undefined)
            {
                // passed in the index of a sorted item
                numberList.currentIndex = reply.index
                var current_item = numberList.currentItem;
                current_item.border.color = "red"
                return;
            }
            if(reply.finished !== undefined)
            {
                buttonTray.enabled = true;
                return;
            }
            // Otherwise it is a swap -> perform the swap
            //listItems.sync();
            listItems.move(reply.index1,reply.index2,1)
        }
    }

    Component.onCompleted:{
        mainWindow.showMaximized();
    }
}
