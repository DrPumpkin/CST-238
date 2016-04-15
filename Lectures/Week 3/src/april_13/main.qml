import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Zoo")


    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent

        Text
        {
            id: txt_name
            text: Patrick.get_name()
            font.family: "BELLABOO"
            font.pixelSize: 36
            color: "red"

            NumberAnimation on x{
                duration: 8000
                from: 0
                to: 300
                loops: Animation.Infinite
                //easing.type: Easing.InOutQ
            }

            NumberAnimation on y{
                duration: 8000
                from: 0
                to: 300
                loops: Animation.Infinite
                //easing.type: Easing.InOutQ
            }

        }

        TextInput
        {
            id: ti_usernamefield
            font.family: "BELLABOO"
            font.pixelSize: 48
            color: "green"
            focus: true

            anchors.horizontalCenter: big_wrapper.horizontalCenter
            anchors.verticalCenter: big_wrapper.verticalCenter

            Keys.onReturnPressed:
            {
                Patrick.set_name(ti_usernamefield.text);
                txt_name.text = Patrick.get_name();
                console.log("Arthur THINKS this will work. ");
            }
        }
    }


}
