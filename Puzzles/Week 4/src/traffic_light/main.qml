import QtQuick 2.6
import QtQuick.Controls 1.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Traffic Light")

    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent

        Rectangle
        {
            id: rect_traffic_light_head
            anchors.horizontalCenter: big_wrapper.horizontalCenter
            anchors.verticalCenter: big_wrapper.verticalCenter

            height: parent.height * .9;
            width: parent.width/3;
            border.color: "brown"

            Rectangle
            {
                id: rect_red_light
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                height: 100;
                width: 100;
                radius: width/2;
                border.width: 10
                border.color: "black"
                color: "red"
            }

            Rectangle
            {
                id: rect_yellow_light
                anchors.top: rect_red_light.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                height: 100;
                width: 100;
                radius: width/2;
                border.width: 10
                border.color: "black"
                color: "yellow"
            }

            Rectangle
            {
                id: rect_green_light
                anchors.top: rect_yellow_light.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                height: 100;
                width: 100;
                radius: width/2;
                border.color: "black"
                border.width: 10
                color: "green"
            }
        }
    }
}
