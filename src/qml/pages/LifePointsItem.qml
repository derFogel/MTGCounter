import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    id: root
    property variant activeItem
    property alias lifes: lifes.value
    property bool life: true
    property bool energy: true
    property bool poison: true
    property int angle

    rotation: angle

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: Theme.paddingMedium

        function toggle(item) {
            energy.clear();
            lifes.clear();
            poison.clear();
            item.activate();
            activeItem = item;
        }

        MTGIcon {
            id: lifes
            icon: "image://theme/icon-m-health"
            visible: root.life

            onClicked: {
                parent.toggle(lifes)
            }
        }

        MTGIcon {
            id: energy
            icon: "energy.png"
            visible: root.energy

            onClicked: {
                parent.toggle(energy)
            }
        }

        MTGIcon {
            id: poison
            icon: "poison.png"
            visible: root.poison

            onClicked: {
                parent.toggle(poison)
            }
        }

        Component.onCompleted: {
            lifes.activate();
            activeItem = lifes;
        }
    }

    Text {
        anchors.centerIn: parent
        text: activeItem.value
        font.pixelSize: parent.height * 0.8
        color: Theme.primaryColor
    }

    IconButton {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        icon.source: "image://theme/icon-m-add"

        onClicked: {
            activeItem.value++;
        }
    }

    IconButton {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        icon.source: "image://theme/icon-m-remove"

        onClicked: {
            activeItem.value--;
        }
    }
}
