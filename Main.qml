import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Audio Animation")

    Switch {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.topMargin: 10
        checked: audioWave.running
        onCheckedChanged: audioWave.running = checked
    }

    AudioWave {
        id: audioWave
    }
}
