import QtQuick 2.5

Rectangle {
    property alias mouseArea:mouseArea
    width:parent.width/6
    height:parent.height/5
    border.width: 2
    MouseArea{
        id:mouseArea
        anchors.fill: parent
    }
}
