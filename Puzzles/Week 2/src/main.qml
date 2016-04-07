import QtQuick 2.6
import QtQuick.Controls 1.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tic-tac-toe")

    Board
    {
        id: brd_board

    }
}
