import QtQuick 2.5

Rectangle{
    property alias source:image.source // allow setting source from outside
    border.width: 2
    radius:4
    color:"transparent"
    Image{
        id:image
        anchors.fill: parent
        anchors.margins:4
        fillMode:Image.Stretch
        source:"puppy.jpg"
    }
}
