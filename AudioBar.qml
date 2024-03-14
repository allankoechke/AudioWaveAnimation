import QtQuick

Rectangle {
    id: root
    color: 'red'
    width: 20
    height: 20
    radius: width/2

    property alias timer: heightAnimationTimer
    property int delay: 0
    property bool running: true
    property alias heightAnimation: heightAnimation

    onRunningChanged: {
        if(running) {
            heightAnimationTimer.start()
        } else {
            heightAnimationTimer.stop();
            heightAnimation.stop();
            root.height = 20
        }
    }

    Timer {
        id: heightAnimationTimer
        interval: delay
        repeat: false
        running: false
        onTriggered: heightAnimation.restart()
    }

    SequentialAnimation {
        id: heightAnimation

        NumberAnimation {
            target: root
            property: "height"
            from: 20
            to: 200
            duration: 450
        }

        NumberAnimation {
            target: root
            property: "height"
            duration: 100
        }

        NumberAnimation {
            target: root
            property: "height"
            from: 200
            to: 20
            duration: 450
        }
    }
}
