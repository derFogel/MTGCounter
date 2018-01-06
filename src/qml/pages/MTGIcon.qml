import QtQuick 2.0
import QtGraphicalEffects 1.0
import Sailfish.Silica 1.0

Item {
    id: root
    property string icon
    property int value: 0
    width: Theme.iconSizeMedium
    height: Theme.iconSizeMedium

    signal clicked()

    function clear() {
        overlay.color = Theme.primaryColor;
    }

    function activate() {
        overlay.color = Theme.highlightColor;
    }

    Image {
        id: energy
        source: icon
        height: Theme.iconSizeMedium
        width: sourceSize.width / sourceSize.height * Theme.iconSizeMedium

        MouseArea {
            anchors.fill: parent

            onClicked: {
                root.clicked();
            }
        }
    }

    ColorOverlay {
        id: overlay
        anchors.fill: energy
        source: energy
        color: Theme.primaryColor
    }
}
