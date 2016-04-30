import QtQuick 2.6
import QtQuick.Controls 1.5
import QtMultimedia 5.6
import QtQuick.Window 2.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Poor Man's Snapchat")

    Camera
    {
        id: cam_selfie
    }



    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent

        VideoOutput
        {
            anchors.fill: parent
            source: cam_selfie
        }

        Image
        {
            id: img_camera
            source: "../../img/camera.png"
            height: 75
            width: 75
            anchors.horizontalCenter: big_wrapper.horizontalCenter
            anchors.bottom: big_wrapper.bottom
            anchors.bottomMargin: 50
        }

        Audio
        {
            id: iPod_shameless
            source:  "../../music/Shameless.mp3"
            autoPlay: true
        }
    }
}
