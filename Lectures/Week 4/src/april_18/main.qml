import QtQuick 2.6
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0
import QtMultimedia 5.6

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("April 18")

    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent
        color: "orange"

        Settings
        {
            id: settings_global
            property alias color: big_wrapper.color
            property alias muted_hsjakh: iPod_intro.muted
        }

        Video
        {
            id: iPod_intro
            source: "../../video/roses_for_the_dead.mp4"
            height: parent.height/2
            width: parent.width/2
            anchors.horizontalCenter: big_wrapper.horizontalCenter
            anchors.verticalCenter: big_wrapper.verticalCenter
            autoPlay: true
            fillMode: VideoOutput.Stretch
            //seekable: true

            MouseArea
            {
                id: ma_video
                anchors.fill: parent

                onClicked:
                {
                   iPod_intro.muted = !iPod_intro.muted;
                   console.log("Clicked!")
                }

            }
        }

        Row
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: iPod_intro.bottom
            anchors.topMargin: 60
            spacing: 10

            Repeater
            {
                id: repeater_rects
                model: 4

                Rectangle
                {
                    height: 50
                    width: 50
                    color: Qt.hsla(Math.random(), 0.5, 0.5, 1.0);
                    border.color: "black"

                    MouseArea
                    {
                        id: ma_mouseArea
                        anchors.fill: parent

                        onClicked:
                        {
                            big_wrapper.color = repeater_rects.itemAt(index).color
                        }
                    }
                }
            }
        }


    }


}
