import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property bool life
    property bool energy
    property bool poison
    property int lifes

    Column {
        anchors.fill: parent

        DialogHeader {
            id: title
            title: qsTr("settings")
        }

        Slider {
            id: slider
            width: parent.width
            minimumValue: 10
            maximumValue: 40
            value: 20
            valueText: value
            stepSize: 1
            label: qsTr("lifes")
        }

        TextSwitch {
            text: qsTr("life")
            checked: life

            onCheckedChanged: {
                life = checked;
            }
        }

        TextSwitch {
            text: qsTr("energy")
            checked: energy

            onCheckedChanged: {
                energy = checked;
            }
        }

        TextSwitch {
            text: qsTr("poison")
            checked: poison

            onCheckedChanged: {
                poison = checked;
            }
        }
    }

    onDone: {
        if (result == DialogResult.Accepted) {
            lifes = slider.value
        }
    }
}
