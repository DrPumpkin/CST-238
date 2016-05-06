import QtQuick 2.5
import QtMultimedia 5.5
Rectangle {
    id:cameraViewfinder
    VideoOutput {
        id:videoOutput
        source: camera
        anchors.fill: parent
        visible:parent.visible
        Camera {
            id: camera
            // add camera adjustments here
        }
    }
}

