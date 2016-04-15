import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2

ApplicationWindow {
    id: root
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Magic 8 ball")

    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent

//        AnimatedImage
//        {
//            id: gif_background
//            source: "../img/background.gif"
//            anchors.fill: parent
//            height: parent.height
//            width: parent.width
//        }

        Text
        {
            id: txt_question
            text: Cursed_8_ball.get_question();
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 24
            font.family: "BELLABOO"
            color: "purple"
            anchors.bottomMargin: 20
        }

        TextInput
        {
            id: txtin_input
            anchors.topMargin: 20
            anchors.bottom: rect_outer_ball.top
            anchors.horizontalCenter: big_wrapper.horizontalCenter
            focus: spg_animation_y.running ? false : true
            visible: spg_animation_y.running ? false : true
            text: "Enter question here..."
            font.pointSize: 24
            height: 50
            width: 50
            color: "orange"
        }

        Rectangle
        {
            id: rect_outer_ball
            height: 300
            width: 300

//            anchors.horizontalCenter: big_wrapper.horizontalCenter
//            anchors.verticalCenter: big_wrapper.verticalCenter
            x: parent.width/2 - width/2;
            y: parent.height/2 - height/2;
            border.color: "white"
            color: "black"
            radius: width/2;

            Behavior on x
            {
                SpringAnimation
                {
                    id: spg_animation_x
                    spring: 4.0
                    damping: .5
                    epsilon: 0.5
                    mass: 10
                }
            }

            Behavior on y
            {
                SpringAnimation
                {
                    id: spg_animation_y
                    spring: 4.0
                    damping: .5
                    epsilon: 0.5
                    mass: 10
                }
            }

            Rectangle
            {
                id: rect_inner_ball
                height: parent.height * .60
                width: parent.width * .60
                anchors.horizontalCenter: rect_outer_ball.horizontalCenter;
                border.color: "purple"
                color: "white"
                radius: width/2;

                Rectangle
                {
                    id: rect_wave_wrapper
                    height: parent.height + border.width
                    width: parent.width + border.width
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "transparent"
                    border.color: "black"
                    border.width: 35
                    radius: width/2
                    z: 2
                }

                    AnimatedImage
                    {
                        id: gif_waves
                        source: "../img/waves.gif"
                        height: parent.height - rect_wave_wrapper.border.width
                        width: parent.width - rect_wave_wrapper.border.width
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        visible: spg_animation_y.running ? true : false
                    }

                Text
                {
                    id: txt_saying
                    //anchors.fill: parent
                    wrapMode: Text.Wrap
                    font.family: "BELLABOO"
                    font.pointSize: 24
                    anchors.centerIn: parent

                    text: spg_animation_y.running ? "" : Cursed_8_ball.get_saying(Math.floor((Math.random() * (3 - 0)) + 0))
                }
            }

            MouseArea
            {
                id: ma_mouse_area
                anchors.fill: parent

                onReleased:
                {
                    if(Cursed_8_ball.get_is_draggable())
                    {
                        //drag.target = undefined
                        rect_outer_ball.x = big_wrapper.width/2 - rect_outer_ball.width/2;
                        rect_outer_ball.y = big_wrapper.height/2 - rect_outer_ball.height/2;
                    }
                }



            }
        }

    }


}
