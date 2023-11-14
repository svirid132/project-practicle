import QtQuick 2.15
import QtQuick.Controls 2.15

Flickable {
    id: flick
    clip: true

    ScrollBar.horizontal: ScrollBar {
        id: hor
        parent: flick.parent
        anchors.right: flick.right
        anchors.left: flick.left
        anchors.bottom: flick.top
        minimumSize: 0.1
        contentItem: Rectangle {
            visible: hor.active
            color: 'green'
            implicitHeight: 5
        }
    }

    ScrollBar.vertical: ScrollBar {
        parent: flick.parent
        anchors.left: flick.right
        anchors.bottom: flick.bottom
        anchors.top: flick.top
    }
}
