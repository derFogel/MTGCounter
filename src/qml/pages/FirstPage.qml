import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.configuration 1.0

Page {
    id: page
    property int lifes: 20

    allowedOrientations: Orientation.Portrait

    Item {
        id: settings
        property alias life: life.value
        property alias energy: energy.value
        property alias poison: poison.value

        ConfigurationValue {
            id: life
            key: "/apps/LifeCounter/life"
            defaultValue: true
        }

        ConfigurationValue {
            id: energy
            key: "/apps/LifeCounter/energy"
            defaultValue: false
        }

        ConfigurationValue {
            id: poison
            key: "/apps/Lifecounter/poison"
            defaultValue: false
        }
    }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("reset")
                rotation: 180
                onClicked: {
                    counter1.lifes = page.lifes;
                    counter2.lifes = page.lifes;
                }
            }
        }

        PushUpMenu {
            MenuItem {
                text: qsTr("reset")
                onClicked: {
                    counter1.lifes = page.lifes;
                    counter2.lifes = page.lifes;
                }
            }

            MenuItem {
                text: qsTr("settings")
                onClicked: {
                    var dialog = pageStack.push(Qt.resolvedUrl("Settings.qml"), {life: settings.life, energy: settings.energy, poison: settings.poison});
                    dialog.accepted.connect(function() {
                        page.lifes = dialog.lifes;
                        settings.life = dialog.life;
                        settings.poison = dialog.poison;
                        settings.energy = dialog.energy;
                    });
                }
            }
        }

        Column {
            anchors.fill: parent

            LifePointsItem {
                id: counter1
                width: parent.width
                height: parent.height / 2
                lifes: page.lifes
                angle: 180

                life: settings.life
                energy: settings.energy
                poison: settings.poison
            }

            LifePointsItem {
                id: counter2
                width: parent.width
                height: parent.height / 2
                lifes: page.lifes

                life: settings.life
                energy: settings.energy
                poison: settings.poison
            }
        }
    }
}
