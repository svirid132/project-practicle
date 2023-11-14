import QtQuick 2.15
import QtQuick.Controls 2.15

FocusScope {
    id: focusScope
    implicitWidth: bodyFocusScope.width
    implicitHeight: bodyFocusScope.height
    Control {
        id: bodyFocusScope
        contentItem: Item {
            implicitWidth: childFocusScope.width
            implicitHeight: label.height + childFocusScope.height
            Label {
                id: label
                bottomPadding: 20
                font.pixelSize: 16
                width: parent.width
                horizontalAlignment: Text.Center
                text: 'focus scope'
            }
            Column {
                id: childFocusScope
                anchors.top: label.bottom
                spacing: 20
                FocusButton { }
                FocusButton { }
            }
        }
        background: Rectangle {
            id: back
            border.color: focusScope.activeFocus ? 'blue' : 'transparent'
            border.width: 2
            color: 'transparent'
            z: 1
        }
    }
}
