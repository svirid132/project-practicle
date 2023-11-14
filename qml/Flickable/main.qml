import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ListView {
        id: listView
        x: 20; y: 20
        width: 100
        height: window.height - 2 * listView.y
        clip: true
        model: {
            const arr = []
            for (let i = 0; i < 50; ++i) {
                arr.push(i + 1)
            }
            return arr
        }
        delegate: Rectangle {
            width: 100; height: 50
            border.width: 1
            color: 'red'
            Label {
                anchors.fill: parent
                text: modelData
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    Column {
        spacing: 10
        anchors {
            left: listView.right
            top: listView.top
            leftMargin: 20
        }
        Label {
            text: 'moving'
            color: listView.moving ? 'green' : 'red'
        }
        Label {
            text: 'flicking'
            color: listView.flicking ? 'green' : 'red'
        }
        Label {
            text: 'dragging'
            color: listView.dragging ? 'green' : 'red'
        }
    }
}
