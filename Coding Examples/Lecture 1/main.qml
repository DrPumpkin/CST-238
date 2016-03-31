import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    height: 768
    property int widthVar:1000
    width:  widthVar +24
    RectKitty{
        anchors.left:parent.left
    }
    RectKitty{
        anchors.right:parent.right
        color:"blue"
    }


}
