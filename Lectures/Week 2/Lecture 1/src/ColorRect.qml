import QtQuick 2.5

Rectangle {
    property alias mouseArea:mouseArea
    height: parent.height/4
    width:  parent.width/8
    border.width: 2
    MouseArea{
        id:mouseArea
        anchors.fill: parent
    }
}
