import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    id: mainWindow
    visible: true
    visibility: Window.FullScreen

    // Camera Dialog uses the button from main but displays the camera preview
    CameraDialog{
        id:cameraDialog
        anchors.fill: parent
        visible:false
    }

    Rectangle{
        id:cameraButton
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
            text:"Show Camera"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea{
            anchors.fill: parent
            onClicked:{
                if(cameraDialog.visible) // Snap a photo - add logic here (or whatever you want)
                {
                    Qt.quit()
                }
                else // move from home menu to cameraDialog
                {
                    cameraDialog.visible = true;
                    buttonText.text = "Take a Picture"
                }

            }
        }
    }

    Component.onCompleted: {
        mainWindow.height = Screen.height;
        mainWindow.width  = Screen.width;
    }
}

