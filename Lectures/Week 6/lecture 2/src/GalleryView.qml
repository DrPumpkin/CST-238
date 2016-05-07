import QtQuick 2.5

Rectangle {
    id:topRect
    anchors.fill: parent
    color:"lightsteelblue"
    property int itemCount:0
    property int imageCount:0
    property var component:null
    function populateGallery() // This function will generate a new image object
    {
        if(component.status == Component.Ready)
        {
            var instance = component.createObject(gallery,{})
            if(instance == null)
                console.log("Failed to create instance of ImageDelegate")
            else
            {
                if(imageCount == 0)
                {
                    imageCount = 1;
                    instance.source = "puppy.jpg"
                }
                else if(imageCount == 1)
                {
                    imageCount = 2;
                    instance.source = "cat.jpg"
                }
                else{
                    imageCount = 0;
                    instance.source = "bird.jpg"
                }


                instance.width = 80;
                instance.height = instance.width;
            }
        }
    }
    Timer{
        id:creationTimer
        repeat: true
        interval:30
        onTriggered: {
            populateGallery();
            itemCount++;
            if(itemCount > 300)
                creationTimer.stop();
        }
    }

    Rectangle{
        border.width: 2
        radius: 4
        anchors.fill: parent
        anchors.margins: 40
        anchors.bottomMargin: parent.height/8
        clip:true
        color:"black"
        Grid{
            id:gallery
            anchors.fill: parent
            columns: gallery.width/80
            anchors.leftMargin:10
            columnSpacing:2
            add: Transition {
                NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 700 }
                NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 700 }
            }
        }

    }
    Rectangle{
        id:backButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.bottom
        anchors.bottomMargin:8
        width:120
        height:80
        radius:8
        border.width: 2
        Text{
            id:buttonText
            anchors.fill: parent
            text:"Close Gallery"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea{
            anchors.fill: parent
            onClicked:{
                topRect.visible = false;
            }
        }
    }
    Component.onCompleted: {
        component = Qt.createComponent("ImageDelegate.qml");
        creationTimer.start();
    }
}
