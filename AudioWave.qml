import QtQuick

Item {
    id: root
    anchors.fill: parent

    property bool running: true
    signal timeout()

    Timer {
        interval: 2000
        running: root.running
        repeat: true
        onTriggered: root.timeout();
    }

    ListModel {
        id: barModel

        ListElement {
            color: "red"
            delay: 0
        }

        ListElement {
            color: "orange"
            delay: 200
        }

        ListElement {
            color: "brown"
            delay: 400
        }

        ListElement {
            color: "pink"
            delay: 600
        }

        ListElement {
            color: "purple"
            delay: 800
        }
    }

    Row {
        spacing: 10
        anchors.centerIn: parent

        Repeater {
            model: barModel

            AudioBar {
                delay: model.delay
                color: model.color
                anchors.verticalCenter: parent.verticalCenter
                running: root.running

                Component.onCompleted: timer.start();

                Connections {
                    target: root

                    function onTimeout() {
                        timer.restart();
                    }
                }
            }
        }
    }
}
