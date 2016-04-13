import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Open Your Eyes and Look North")


    Rectangle
    {
        id: rect_big_wrapper
        anchors.fill: parent


        Text
        {
            id: txt_myname
            text: MyTeacher.get_name()
            font.pixelSize: 36
            font.family: "BELLABOO"
        }

        TextInput
        {
            id: ti_usernamefield
            focus: true
            font.family: "BELLABOO"
            color: "purple"
            font.pixelSize: 48
            anchors.horizontalCenter: rect_big_wrapper.horizontalCenter
            anchors.verticalCenter: rect_big_wrapper.verticalCenter

            Keys.onReturnPressed:
            {
                MyTeacher.set_name(ti_usernamefield.text)
                txt_myname.text = MyTeacher.get_name()
                console.log("I am the keyboard...someone pressed me!");
            }

        }
    }

}
