import QtQuick 2.5

Rectangle {
    id:containerTop
    property alias titleText:titleText.text
    signal clickedItem(int index);
    property alias listData:dataModel
    ListModel{
        id:dataModel
    }

    Rectangle{
        id:titleBar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        anchors.topMargin: 12
        height:26
        width:parent.width *.8
        border.width: 2
        Text{
            id:titleText
            anchors.fill: parent
            anchors.margins: 1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 20
        }
    }
    Rectangle{
        border.width: 2
        anchors.top:titleBar.bottom
        anchors.bottom:parent.bottom
        anchors.right:parent.right
        anchors.left:parent.left
        anchors.margins:4
        ListView{
            id:listView
            model:listData
            anchors.fill: parent
            anchors.margins: 4
            spacing:4
            delegate:Rectangle{
                height:32
                width:parent.width *.9
                border.width: 2
                anchors.horizontalCenter: parent.horizontalCenter
                Text{
                    anchors.fill: parent
                    anchors.margins: 1
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 24
                    text:model.name
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {containerTop.clickedItem(index)}
                }
            }
        }
    }
}
