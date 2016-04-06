import QtQuick 2.5

Rectangle {
    property alias topGradient:topGradient
    property alias bottomGradient:bottomGradient
    gradient: Gradient {
        GradientStop {
            id:topGradient
            position: 0.00;
            color: "#ffffff";
        }
        GradientStop {
            id:bottomGradient
            position: 1.00;
            color: "#ffffff";
        }
    }
    Behavior on rotation{
        NumberAnimation{
            duration:2000
        }
    }

}

