import QtQuick 2.5

Rectangle{ // a base delegate item for the view
    width:80
    height:80
    border.width:2
    property alias number: componentText.text
    Text{
        id:componentText
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.margins: 2
    }
}
