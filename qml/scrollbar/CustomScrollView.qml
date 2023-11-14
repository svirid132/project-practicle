import QtQuick 2.15
import QtQuick.Controls 2.15

ScrollView {
    id: flick
    anchors.fill: parent
    clip: true

    ScrollBar.horizontal {
        parent: flick.parent
        anchors.right: flick.right
        anchors.left: flick.left
        anchors.bottom: flick.bottom
        minimumSize: 0.1
        policy: ScrollBar.AsNeeded // Не работает из-за переопределенного contentItem
        contentItem: Rectangle {
            color: 'green'
            implicitHeight: 5
        }
    }

    ScrollBar.vertical {
        parent: flick.parent
        anchors.left: flick.right
        anchors.bottom: flick.bottom
        anchors.top: flick.top
    }
}
