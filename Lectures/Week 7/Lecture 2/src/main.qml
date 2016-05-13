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
    Connections{
        target:SortManager
        onAppendedValue:{
            listItems.append({"numberVal":value})
        }
        onSwap:{
            listItems.move(index1,index2,1);
        }
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
            SortManager.appendToList(random_value)
        }
        onAddClicked: {
            // Add the input value
            if(numberIn.text != "")
            {
                SortManager.appendToList(parseInt(numberIn.text))
            }
        }
        onSortClicked:{
            // Send items to WorkerScript for processing
            console.log("List model has ", numberList.model.count, " Objects when starting sort");
            SortManager.runBubbleSort();
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


    Component.onCompleted:{
        mainWindow.showMaximized();
    }
}
