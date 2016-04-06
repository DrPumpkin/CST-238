import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id:topWindow
    visible: true
    property bool isRotated:false
    property Item itemBeingDragged:null
    Rectangle{
        color:"grey"
        anchors.fill:parent

    }
    DropArea{
        id:dropArea
        x:parent.width/2 -centerCircle.width/2
        y:parent.height/2 -centerCircle.height/2
        width:parent.width/4
        height:width
        Drag.dragType: Drag.Automatic
        keys:[]
        CenterCircle{
            id:centerCircle
            rotation: isRotated ? 90:0
            radius:width/2
            color: dropArea.containsDrag ? "black":"white"
            border.width: 2
            width:topWindow.width/4
            height:width
        }

        onDropped:{
            centerCircle.topGradient.color = itemBeingDragged.color
        }
    }

    ColorRect{
        id:blueRect
        color:"blue"
        Drag.active: mouseArea.drag.active
        maximumDragX: parent.width
        maximumDragY: parent.height
        anchors.top: parent.top
        x:0
        y:0
        Drag.hotSpot.x: 32
        Drag.hotSpot.y: 32
        mouseArea.onClicked:{
            centerCircle.topGradient.color = color
            topWindow.isRotated = false
        }
    }
    ColorRect{
        id:yellowRect
        color:"yellow"
        Drag.active: mouseArea.drag.active
        maximumDragX: parent.width
        maximumDragY: parent.height
        x:parent.width/2 - yellowRect.width/2
        y:0
        mouseArea.onClicked:{
            centerCircle.topGradient.color = color
            topWindow.isRotated = false
        }
        Drag.onActiveChanged: {
                topWindow.itemBeingDragged = yellowRect
        }
    }
    ColorRect{
        id:redRect
        color:"red"
        Drag.active: mouseArea.drag.active
        maximumDragX: parent.width
        maximumDragY: parent.height
        x:parent.width - yellowRect.width
        y:0
        mouseArea.onClicked:{
            centerCircle.topGradient.color = color
            topWindow.isRotated = false
        }
        Drag.onActiveChanged:  {
            topWindow.itemBeingDragged = redRect
        }
    }

    ColorRect{
        id:greenRect
        color:"green"
        Drag.active: mouseArea.drag.active
        maximumDragX: parent.width
        maximumDragY: parent.height
        x:0
        y:parent.height-greenRect.height
        mouseArea.drag.target:centerCircle
        mouseArea.onClicked:{
            centerCircle.bottomGradient.color = color
            topWindow.isRotated = true
        }
    }
    ColorRect{
        id:orangeRect
        color:"orange"
        Drag.active: mouseArea.drag.active
        maximumDragX: parent.width
        maximumDragY: parent.height
        x:parent.width/2 - orangeRect.width/2
        y:parent.height - orangeRect.height
        mouseArea.onClicked:{
            centerCircle.bottomGradient.color = color
            topWindow.isRotated = true
        }
    }
    ColorRect{
        id:purpleRect
        color:"purple"
        Drag.active: mouseArea.drag.active
        maximumDragX: parent.width
        maximumDragY: parent.height
        x:parent.width - purpleRect.width
        y:parent.height - purpleRect.height
        mouseArea.onClicked:{
            centerCircle.bottomGradient.color = color
            topWindow.isRotated = true
        }
    }




    Component.onCompleted: {
     topWindow.width = Screen.width/2;
     topWindow.height = Screen.height/2;
     topWindow.x = Screen.width/4;
     topWindow.y  = Screen.height/4
    }
}
