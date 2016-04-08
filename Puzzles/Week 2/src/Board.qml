// x = first  player
// o = second player

import QtQuick 2.0

Rectangle
{
    property bool game_over: false
    property bool first_player_turn: true
    property variant has_clicked: [false, false, false, false, false, false, false, false, false]

    function check_game_over()
    {
        if(img_o1.visible === true && img_o2.visible === true && img_o3.visible === true)
        {
            big_wrapper.visible = false;
            game_over = true;
            txt_game_over.visible = true;
        }
        else if(img_o1.visible && img_o5.visible && img_o9.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_o1.visible && img_o4.visible && img_o7.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_o2.visible && img_o5.visible && img_o8.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_o3.visible && img_o5.visible && img_o7.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_o3.visible && img_o6.visible && img_o9.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_o4.visible && img_o5.visible && img_o6.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_o7.visible && img_o8.visible && img_o9.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_x1.visible && img_x2.visible && img_x3.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_x1.visible && img_x5.visible && img_x9.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_x1.visible && img_x4.visible && img_x7.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_x2.visible && img_x5.visible && img_x8.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_x3.visible && img_x5.visible && img_x7.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_x3.visible && img_x6.visible && img_x9.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_x4.visible && img_x5.visible && img_x6.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
        else if(img_x7.visible && img_x8.visible && img_x9.visible)
        {
            big_wrapper.visible = false;
            game_over = true;
        }
    }

    id: big_wrapper
    anchors.fill: parent
    border.color: "white"
    visible:
    {
        if(game_over === false)
            visible = true;
        else
        {
            visible = false;
            txt_game_over.visible = true;
        }
    }

    Text
    {
        id: txt_game_over
        visible: true
        font.family: "Arial"
        font.pointSize: 72
        color: "Red"
        text: "Game Over"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        z: 5
    }

    Grid
    {
        id: grd_board
        height: parent.height * .75
        width: parent.width * .75
        anchors.horizontalCenter: big_wrapper.horizontalCenter
        anchors.verticalCenter: big_wrapper.verticalCenter
        columns: 3
        rows: 3

        Rectangle
        {
            border.color: "white";
            height: parent.height/3;
            width: parent.width/3;
            Image
            {
                id: img_x1;
                visible: false;
                anchors.horizontalCenter: parent.horizontalCenter;
                height: 100;
                width: 100;
                source: "../img/letter_x.png";
            }
            Image
            {
                id: img_o1;
                visible: false;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                height: 75;
                width: 75;
                source: "../img/letter_o.png";
            }

            MouseArea
            {
                id: mouse_area;
                anchors.fill: parent;
                onClicked:
                {
                    if(!has_clicked[0])
                    {
                        first_player_turn ? img_x1.visible = true : img_o1.visible = true;
                        first_player_turn = !first_player_turn;
                        has_clicked[0] = true;
                        check_game_over();
                    }
                }
            }
        }

        Rectangle
        {
            border.color: "red";
            height: parent.height/3;
            width: parent.width/3;
            Image
            {
                id: img_x2;
                visible: false;
                anchors.horizontalCenter: parent.horizontalCenter;
                height: 100;
                width: 100;
                source: "../img/letter_x.png";
            }
            Image
            {
                id: img_o2;
                visible: false;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                height: 75;
                width: 75;
                source: "../img/letter_o.png";
            }
            MouseArea
            {
                id: mouse_area_2;
                anchors.fill: parent;
                onClicked:
                {
                    if(!has_clicked[1])
                    {
                        first_player_turn ? img_x2.visible = true : img_o2.visible = true;
                        first_player_turn = !first_player_turn;
                        has_clicked[1] = true;
                        check_game_over();
                    }
                }
            }
        }
        Rectangle{border.color: "white"; height: parent.height/3; width: parent.width/3; Image{ id: img_x3; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o3; visible:false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}MouseArea{id: mouse_area_3; anchors.fill: parent; onClicked:{if(!has_clicked[2]){first_player_turn ? img_x3.visible = true : img_o3.visible = true;first_player_turn = !first_player_turn;has_clicked[2] = true;check_game_over();}}}}
        Rectangle{border.color: "magenta"; height: parent.height/3; width: parent.width/3;Image{ id: img_x4; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o4; visible: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}MouseArea{id: mouse_area_4; anchors.fill: parent; onClicked:{if(!has_clicked[3]){first_player_turn ? img_x4.visible = true : img_o4.visible = true;first_player_turn = !first_player_turn;has_clicked[3] = true;check_game_over();}}}}
        Rectangle{border.color: "gold"; height: parent.height/3; width: parent.width/3;Image{ id: img_x5; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o5; visible: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}MouseArea{id: mouse_area_5; anchors.fill: parent; onClicked:{if(!has_clicked[4]){first_player_turn ? img_x5.visible = true : img_o5.visible = true;first_player_turn = !first_player_turn;has_clicked[4] = true;check_game_over();}}}}
        Rectangle{border.color: "green"; height: parent.height/3; width: parent.width/3;Image{ id: img_x6; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o6; visible: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}MouseArea{id: mouse_area_6; anchors.fill: parent; onClicked:{if(!has_clicked[5]){first_player_turn ? img_x6.visible = true : img_o6.visible = true;first_player_turn = !first_player_turn;has_clicked[5] = true;check_game_over();}}}}
        Rectangle{border.color: "white"; height: parent.height/3; width: parent.width/3;Image{ id: img_x7; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o7; visible: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}MouseArea{id: mouse_area_7; anchors.fill: parent; onClicked:{if(!has_clicked[6]){first_player_turn ? img_x7.visible = true : img_o7.visible = true;first_player_turn = !first_player_turn;has_clicked[6] = true;check_game_over();}}}}
        Rectangle{border.color: "brown"; height: parent.height/3; width: parent.width/3;Image{ id: img_x8; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o8; visible: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}MouseArea{id: mouse_area_8; anchors.fill: parent; onClicked:{if(!has_clicked[7]){first_player_turn ? img_x8.visible = true : img_o8.visible = true;first_player_turn = !first_player_turn;has_clicked[7] = true;check_game_over();}}}}
        Rectangle{border.color: "white"; height: parent.height/3; width: parent.width/3;Image{ id: img_x9; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o9; visible: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}MouseArea{id: mouse_area_9; anchors.fill: parent; onClicked:{if(!has_clicked[8]){first_player_turn ? img_x9.visible = true : img_o9.visible = true;first_player_turn = !first_player_turn;has_clicked[8] = true; check_game_over();}}}}
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
