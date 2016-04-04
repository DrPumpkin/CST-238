import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id:topWindow
    visible: true
    Rectangle{
        id:background
        anchors.fill: parent
        color:"grey"
    }

    ColorRect{
        id:blueRect
        anchors.left:parent.left
        anchors.top:parent.top
        color:"blue"
        border.width: 8
        mouseArea.onClicked:{
            topGradient.color = color;
        }
    }
    ColorRect{
        id:yellowRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        color:"yellow"
        mouseArea.onClicked:{
            topGradient.color = color;
        }
    }
    ColorRect{
        id:redRect
        anchors.right:parent.right
        anchors.top:parent.top
        color:"red"
        mouseArea.onClicked:{
            topGradient.color = color;
        }
    }

    ColorRect{
        id:greenRect
        anchors.left:parent.left
        anchors.bottom:parent.bottom
        color:"green"
        mouseArea.onClicked:{
            bottomGradient.color = color;
        }
    }
    ColorRect{
        id:orangeRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.bottom
        color:"orange"
        mouseArea.onClicked:{
            bottomGradient.color = color;
        }
    }
    ColorRect{
        id:purpleRect
        anchors.right:parent.right
        anchors.bottom:parent.bottom
        color:"purple"
        mouseArea.onClicked:{
            bottomGradient.color = purpleRect.color;
        }
    }

    Rectangle{
        id:circle
        rotation:90
        anchors.centerIn: background
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
        border.color: "black"
        border.width: 2

    }

    Component.onCompleted: {
        topWindow.width = Screen.width/2
        topWindow.height = Screen.height/2
        topWindow.x =Screen.width/4
        topWindow.y =Screen.height/4
    }
}
