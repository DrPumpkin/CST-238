import QtQuick 2.6
import QtQuick.Controls 1.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Traffic Light")

    property int index: 0

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
                color: TrafficLight.get_light_on(0) ? "red" : "black"

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
                color: TrafficLight.get_light_on(1) ? "yellow" : "black"
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
                color: TrafficLight.get_light_on(2) ? "green" : "black"
            }
        }

        Timer
        {
            id: tmr_countdown
            running: true
            repeat: true
            interval: 2000
            onTriggered:
            {
                if(index == 2)
                    index = 0;
                else if (index == 0)
                    index++;
                else if (index == 1)
                    index++;

                TrafficLight.toggle_light(index)
                rect_red_light.color = TrafficLight.get_light_on(0) ? "red" : "black"
                rect_yellow_light.color = TrafficLight.get_light_on(1) ? "yellow" : "black"
                rect_green_light.color = TrafficLight.get_light_on(2) ? "green" : "black"
            }
        }
    }
}
