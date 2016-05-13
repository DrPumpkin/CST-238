import QtQuick 2.5

Rectangle {
    id:buttonTray
    // signals for outside (dont make spaghetti)
    signal randomClicked()
    signal addClicked()
    signal sortClicked()
    radius:4
    onEnabledChanged: {
        if(enabled)
        {
            randomButton.color = "white";
            addButton.color = "white";
            sortButton.color = "white";
        }
        else
        {
            randomButton.color = "darkgrey";
            addButton.color = "darkgrey";
            sortButton.color = "darkgrey";

        }
    }

    Row{
        anchors.fill: parent
        anchors.margins: 4
        spacing:4
        Rectangle{ // Could have become a Button.qml - but copy pasta
            id: randomButton
            border.width: 2
            anchors.margins: 2
            radius:4
            Text{
                id:randText
                anchors.fill: parent
                text:"Add Random"
                horizontalAlignment:Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }
            height:parent.height
            width:parent.width/3 - 2
            MouseArea{
                id: randomMouse
                anchors.fill: parent
                onPressed: {
                    randText.color = "white";
                    randomButton.color = "black";
                }
                onReleased:{
                    randText.color = "black";
                    randomButton.color = "white";
                }
            }
        }
        Rectangle{ // Could have become a Button.qml - but copy pasta
            id: addButton
            border.width: 2
            anchors.margins: 2
            radius:4
            Text{
                id:addText
                color:"black"
                anchors.fill: parent
                text:"Add Number"
                horizontalAlignment:Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }
            height:parent.height
            width:parent.width/3 - 2
            MouseArea{
                id: addMouse
                anchors.fill: parent
                onPressed: {
                    addText.color = "white";
                    addButton.color = "black";
                }
                onReleased:{
                    addText.color = "black";
                    addButton.color = "white";
                }
            }
        }
        Rectangle{ // Could have become a Button.qml - but copy pasta
            id: sortButton
            border.width: 2
            anchors.margins: 2
            radius:4
            Text{
                id:sortText
                anchors.fill: parent
                text:"Sort Numbers"
                horizontalAlignment:Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }
            height:parent.height
            width:parent.width/3 - 2
            MouseArea{
                id: sortMouse
                anchors.fill: parent
                onPressed: {
                    sortText.color = "white";
                    sortButton.color = "black";
                }
                onReleased:{
                    sortText.color = "black";
                    sortButton.color = "white";
                }
            }
        }
    }
    Component.onCompleted: {
        // connect internal signals to external signals
        randomMouse.clicked.connect(buttonTray.randomClicked)
        addMouse.clicked.connect(buttonTray.addClicked)
        sortMouse.clicked.connect(buttonTray.sortClicked)
    }
}
