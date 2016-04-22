import QtQuick 2.6
import QtQuick.Controls 1.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("iPod")

    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent



        Image {
            id: img_iPod
            source: "iPod.svg"
            smooth: true
            sourceSize.width: parent.width * .89
            sourceSize.height: parent.height * .90
            anchors.centerIn: parent

            Rectangle
            {
                id: iPod_back_button
                x:80
                y: 250
                width: 40
                height: 83
                color: "transparent"

                MouseArea
                {
                    id: ma_mousearea
                    anchors.fill: parent

                    onClicked:
                    {
                        console.log("Back button clicked!")
                    }
                }
            }
        }

    }
}
