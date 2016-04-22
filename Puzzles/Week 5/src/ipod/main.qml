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
                    id: ma_mousearea_back
                    anchors.fill: parent

                    onClicked:
                    {
                        console.log("Back button clicked!")
                    }
                }
            }

            Rectangle
            {
                id: iPod_forward_button
                x: 185
                y: 262
                width: 228 - x
                height: 331 - y
//                x:80
//                y: 250
//                width: 40
//                height: 83
                //color: "transparent"

                MouseArea
                {
                    id: ma_mousearea_forward
                    anchors.fill: parent

                    onClicked:
                    {
                        console.log("x = " + ma_mousearea_forward.mouseX)
                        console.log("y = " + ma_mousearea_forward.mouseY)
                        console.log("Forward button clicked!")
                    }
                }
            }

            Rectangle
            {
                id: iPod_menu_button
                x: 130
                y: 225
                width: 47
                height: 263 - y
//                x:80
//                y: 250
//                width: 40
//                height: 83
                //color: "transparent"

                MouseArea
                {
                    id: ma_mousearea_menu
                    anchors.fill: parent

                    onClicked:
                    {
                        console.log("x = " + ma_mousearea_menu.mouseX)
                        console.log("y = " + ma_mousearea_menu.mouseY)
                        console.log("Menu button clicked!")
                    }
                }
            }

            Rectangle
            {
                id: iPod_play_button
                x: 130
                y: 330
                width: 47
                height: 368 - y
//                x:80
//                y: 250
//                width: 40
//                height: 83
                //color: "transparent"

                MouseArea
                {
                    id: ma_mousearea_play
                    anchors.fill: parent

                    onClicked:
                    {
                        console.log("x = " + ma_mousearea_play.mouseX)
                        console.log("y = " + ma_mousearea_play.mouseY)
                        console.log("Play button clicked!")
                    }
                }
            }
        }

    }
}
