import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    height: 600
    width: 800
    property int currentBackground:1
    Image{     // image container to fill display Pixel Buffer from C++
        id: backgroundImage
        source:""
        anchors.fill: parent
    }
    MouseArea{
        anchors.fill: parent
        onClicked:{
            if(currentBackground == 3)
            {
                currentBackground = 1;
            }
            else
                currentBackground += 1;
            backgroundImage.source = "image://backgrounds/" +currentBackground // update the source
        }
    }
    Component.onCompleted: {
        backgroundImage.source = "image://backgrounds/" +currentBackground // set the initial source value
    }
}
