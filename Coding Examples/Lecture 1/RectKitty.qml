import QtQuick 2.5

Rectangle{
    id:exampleRectangle
    color: "red"
    height: 180
    width:360
    radius: 10
    border.color:"black"
    border.width:2
    Image{
        width:parent.width *.5
        anchors.top: exampleRectangle.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:helloText.top
        fillMode: Image.PreserveAspectFit
        source: "cat_image.jpg"
    }

    Text{
        id:helloText
        text:"Hello World"
        color:"white"
        styleColor: "navy"
        style: Text.Raised
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 30
        anchors.bottom:parent.bottom
        anchors.horizontalCenter: exampleRectangle.horizontalCenter
        height:40
    }
}

