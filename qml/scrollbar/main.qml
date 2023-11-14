import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ScrollBar")

    Rectangle {
        id: wrapperScrollView
        border.color: 'black'
        x: 10; y: 10
        width: 200; height: 100
        CustomScrollView {
            Text {
                text: "ABCDE"
                font.pixelSize: 160
            }
        }
    }
    Label {
        anchors.right: wrapperScrollView.right; anchors.left: wrapperScrollView.left
        anchors.top: wrapperScrollView.bottom
        text: "CustomScrollView"
        height: 50
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Rectangle {
        id: wrapperFlickable
        border.color: 'black'
        x: 300; y: 10
        width: 200; height: 100
        CustomFlickable {
            anchors.fill: parent
            contentWidth: content.width; contentHeight: content.height
            Text {
                id: content
                text: "ABCDE"
                font.pixelSize: 160
            }
        }
    }
    Label {
        anchors.right: wrapperFlickable.right; anchors.left: wrapperFlickable.left
        anchors.top: wrapperFlickable.bottom
        text: "CustomFlickable"
        height: 50
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    ViewScrollBar {
        id: scrollBar
        x: 10; y: 180
        sourceComponent: Text {
            text: "ABC"
            font.pixelSize: 160
        }
    }
    Label {
        anchors.right: scrollBar.right; anchors.left: scrollBar.left
        anchors.top: scrollBar.bottom
        text: "ViewScrollBar"
        height: 50
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
