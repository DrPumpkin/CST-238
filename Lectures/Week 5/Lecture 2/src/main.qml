import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: windowTop
    visible: true
    height: 600
    width: 800
    property int weight:3
    property int currentBackground:1
    property color penColor:"white"
    Connections{// Connection objects allow definition of signals to other objects
        target:Drawer
        onUpdatedPixmap:{ // on Drawer.updatedPixmap - swap the source to refesh the image
            backgroundImage.source = ""
            backgroundImage.source = "image://backgrounds/1"
        }
    }

    Image{ // Image will display the pixelbuffer received from pixmapprovider
        id: backgroundImage
        source:""
        anchors.centerIn:parent
        height:600
        width:800
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        cache: false
        MouseArea{ // Monitor mouse change - only fires after click
            anchors.fill: parent
            onMouseXChanged:  {
                Drawer.drawToImage(mouse.x,mouse.y, windowTop.weight,penColor);
            }
            onMouseYChanged:{
                Drawer.drawToImage(mouse.x,mouse.y, windowTop.weight, penColor);
            }
        }
    }

    Component.onCompleted: { // Load initial background
        backgroundImage.source = "image://backgrounds/" +currentBackground
    }
}
