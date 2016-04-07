import QtQuick 2.0

Rectangle
{
    id: big_wrapper
    anchors.fill: parent
    border.color: "white"

    Grid
    {
        id: grd_board
        height: parent.height * .75
        width: parent.width * .75
        anchors.horizontalCenter: big_wrapper.horizontalCenter
        anchors.verticalCenter: big_wrapper.verticalCenter
        columns: 3
        rows: 3

        Rectangle{border.color: "white"; height: parent.height/3; width: parent.width/3}
        Rectangle{border.color: "red"; height: parent.height/3; width: parent.width/3}
        Rectangle{border.color: "white"; height: parent.height/3; width: parent.width/3}
        Rectangle{border.color: "magenta"; height: parent.height/3; width: parent.width/3}
        Rectangle{border.color: "gold"; height: parent.height/3; width: parent.width/3}
        Rectangle{border.color: "green"; height: parent.height/3; width: parent.width/3}
        Rectangle{border.color: "white"; height: parent.height/3; width: parent.width/3}
        Rectangle{border.color: "brown"; height: parent.height/3; width: parent.width/3}
        Rectangle{border.color: "white"; height: parent.height/3; width: parent.width/3}
    }

    Rectangle
    {
        id: rect_left
        anchors.right: grd_board.left
        anchors.rightMargin: -10
        height: grd_board.height
        width: grd_board.width

        border.color: "white"
        border.width: 20
    }

    Rectangle
    {
        id: rect_right
        anchors.left: grd_board.right
        anchors.leftMargin: -10
        height: grd_board.height
        width: grd_board.width

        border.color: "white"
        border.width: 20
    }

    Rectangle
    {
        id: rect_top
        anchors.bottom: grd_board.top
        anchors.bottomMargin: -10
        height: grd_board.height
        width: grd_board.width

        border.color: "white"
        border.width: 20
    }

    Rectangle
    {
        id: rect_bottom
        anchors.top: grd_board.bottom
        anchors.topMargin: -10
        height: grd_board.height
        width: grd_board.width

        border.color: "white"
        border.width: 20
    }
}
