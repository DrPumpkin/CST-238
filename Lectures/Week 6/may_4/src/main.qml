import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Particles 2.0
import QtMultimedia 5.6

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("May 4th")

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

        Image
        {
            id: img_twenty_bucks
            source: "../img/twenty_bucks.jpg"
            height: 200
            width: 200
            anchors.left: img_background.left
            anchors.verticalCenter: img_background.verticalCenter
        }

        Image
        {
            id: img_tv
            source: "../img/tv.png"
            height: 200
            width: 200
            anchors.right: img_background.right
            anchors.verticalCenter: img_background.verticalCenter

            MouseArea
            {
                id: ma_tv
                anchors.fill: parent

                onClicked:
                {
                    console.log("x = " + mouseX)
                    console.log("y = " + mouseY)
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
