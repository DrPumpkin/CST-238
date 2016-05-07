import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    id:mainWindow

    Component{ // The HomeScreen as a component (Inline)
        id:homeScreen
        Rectangle{
            anchors.fill: parent
            Image{  //Background
                id:backgroundImage
                anchors.fill: parent
                fillMode:Image.Stretch
                source:"gallery_background.jpg"
            }
            Image{ // Close button
                anchors.right:parent.right
                anchors.top:parent.top
                height:80
                width:80
                source:"close.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked:Qt.quit()
                }
            }

            Rectangle{ // Button to change to galleryview
                id:galleryButton
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
                    text:"Show Gallery"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        galleryLoader.active = true;  // Load the gallery
                        homeScreenLoader.active = false; // unload homescreen
                    }
                }
            }
        }
    }

    Loader{ // Loader responsible for loading HomeScreen
        id:homeScreenLoader
        active:false
        sourceComponent: homeScreen
        anchors.fill: parent
    }


    Loader{ // Loader Responsible for loading GalleryView
        id:galleryLoader
        anchors.fill: parent
        source:"GalleryView.qml"
        active:false
        onLoaded: {
            item.visible = true;
            connectionToGalleryView.target = item // dynamically assign connection (see below)
        }
    }
    Connections{ // After galleryview is created this connection is dynamically assigned
        id:connectionToGalleryView
        target:null
        onVisibleChanged:{ // when galleryView is closed (prevent spaghetti code)
            if(visible)
            {
                homeScreenLoader.active = true; //load homescreen
                galleryLoader.active = false; // unload gallerView
            }
        }
    }

    Component.onCompleted: { // When Main Window is loaded, start loading homeScreen and resize
        mainWindow.width = Screen.width
        mainWindow.height = Screen.height
        mainWindow.showFullScreen()
        homeScreenLoader.active = true;
    }
}
