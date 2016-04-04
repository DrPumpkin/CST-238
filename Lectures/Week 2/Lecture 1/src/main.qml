import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id:topWindow
    visible: true
    property bool isRotated:false
    Rectangle{
        color:"grey"
        anchors.fill:parent

    }
    ColorRect{
        id:blueRect
        color:"blue"
        anchors.left:parent.left
        anchors.top:parent.top
        mouseArea.onClicked:{
            topGradient.color = color
            topWindow.isRotated = false
        }
    }
    ColorRect{
        id:yellowRect
        color:"yellow"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        mouseArea.onClicked:{
            topGradient.color = color
            topWindow.isRotated = false
        }
    }
    ColorRect{
        id:redRect
        color:"red"
        anchors.right:parent.right
        anchors.top:parent.top
        mouseArea.onClicked:{
            topGradient.color = color
            topWindow.isRotated = false
        }
    }

    ColorRect{
        id:grenRect
        color:"green"
        anchors.left:parent.left
        anchors.bottom:parent.bottom
        mouseArea.onClicked:{
            bottomGradient.color = color
            topWindow.isRotated = true
        }
    }
    ColorRect{
        id:orangeRect
        color:"orange"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.bottom
        mouseArea.onClicked:{
            bottomGradient.color = color
            topWindow.isRotated = true
        }
    }
    ColorRect{
        id:purpleRect
        color:"purple"
        anchors.right:parent.right
        anchors.bottom:parent.bottom
        mouseArea.onClicked:{
            bottomGradient.color = color
            topWindow.isRotated = true
        }
    }

    Rectangle{
        id:centerCircle
        rotation: isRotated ? 90:0
        anchors.centerIn: parent
        width:parent.width/4
        height:width
        radius:width/2
        gradient: Gradient {
            GradientStop {
                id:topGradient
                position: 0.00;
                color: "#ffffff";
            }
            GradientStop {
                id:bottomGradient
                position: 1.00;
                color: "#ffffff";
            }
        }
        Behavior on rotation{
            NumberAnimation{
                duration:2000
            }
        }

        color:"white"
        border.width: 2
    }


    Component.onCompleted: {
     topWindow.width = Screen.width/2;
     topWindow.height = Screen.height/2;
     topWindow.x = Screen.width/4;
     topWindow.y  = Screen.height/4
    }
}
