import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Particles 2.0
import QtQuick.Window 2.0
import QtMultimedia 5.6

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("May 4th")

    Timer
    {
        id: tmr_twenty_bucks
        interval: 42000
        running: true
        onTriggered:
        {
            img_twenty_bucks.visible = true
        }
    }

    Timer
    {
        id: tmr_tv
        interval: 48000
        running:  true
        onTriggered:
        {
            img_tv.visible = true
            vo_tv.visible = true
        }
    }

    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent

        Image
        {
            id: img_background
            source: "../img/background.jpg"
            height: parent.height
            width: parent.width}

        AnchorChanges
        {
            target: img_twenty_bucks
            anchors.right: big_wrapper.right
        }

        SequentialAnimation
        {
            id: sa_dance
            running: true
            loops: Animation.Infinite

            ColorAnimation {
                target: rect_1
                properties: "color"
                from: "white"
                to: "orange"
                duration: 2000
            }

            PropertyAnimation
            {
                target: rect_1
                properties: "width"
                from: rect_1.width
                to: 1
                duration: 5000
            }

            PropertyAnimation
            {
                target: rect_1
                properties: "width"
                from: 1
                to: rect_1.width
                duration: 5000
            }

            RotationAnimation
            {
                target: rect_1
                from: 0
                to: 360
                duration: 5000
            }

            NumberAnimation
            {
                target: rect_1
                from: 0
                to: 200
                properties: "x"
                duration: 2000
            }

            ScaleAnimator
            {
                target: img_twenty_bucks
                from: 0.5
                to: 1
                easing.type: Easing.OutBounce;
                duration: 1000
            }
        }

        Image
        {
            id: img_twenty_bucks
            source: "../img/twenty_bucks.jpg"
            height: 200
            width: 200
            anchors.left: img_background.left
            anchors.verticalCenter: img_background.verticalCenter
            visible: false
        }

        Rectangle
        {
            id: rect_1
            x: 0
            y: 100
            height: 200
            width: 200
            z: 10
        }


        Image
        {
            id: img_tv
            source: "../img/tv.png"
            height: 200
            width: 200
            anchors.right: img_background.right
            anchors.verticalCenter: img_background.verticalCenter
            visible: false


            MouseArea
            {
                id: ma_tv
                x: 15
                y: 55
                width: 163 - x
                height: 162 - y

                onClicked:
                {
                    console.log("x = " + mouseX)
                    console.log("y = " + mouseY)
                }

                Camera
                {
                    id: camera
                }

                VideoOutput
                {
                    id: vo_tv
                    anchors.fill: parent
                    source: camera
                    visible: false
                }
            }
        }

    ParticleSystem
    {
        id: ps_fire
    }

    ImageParticle
    {
        id: ip_fire
        source: "../img/fire_particle.png"
        system: ps_fire
    }

    Emitter
    {
        id: em_fire
        anchors.centerIn: parent
        width: 160; height: 80
        system: ps_fire
        emitRate: 10
        lifeSpan: 1000
        lifeSpanVariation: 500
        size: 16
        endSize: 32
    }

    }

    Audio
    {
        id: iPod_monument
        source: "../music/A Day To Remember - Monument (Acoustic).mp3"
        autoPlay: true
    }

    /*
    PropertyAnimation - Animates changes in property values
    NumberAnimation - Animates changes in qreal-type values
    ColorAnimation - Animates changes in color values
    RotationAnimation - Animates changes in rotation values

Besides these basic and widely used animation elements, Qt Quick provides also more specialized animations for specific use cases:

    PauseAnimation - Provides a pause for an animation
    SequentialAnimation - Allows animations to be run sequentially
    ParallelAnimation - Allows animations to be run in parallel
    AnchorAnimation - Animates changes in anchor values
    ParentAnimation - Animates changes in parent values
    SmoothedAnimation - Allows a property to smoothly track a value
    SpringAnimation - Allows a property to track a value in a spring-like motion
    PathAnimation - Animates an item along a path
    Vector3dAnimation - Animates changes in QVector3d values
*/

}
