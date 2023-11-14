import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
     id: frame
     clip: true
     width: 160
     height: 160
     border.color: "black"
     property alias sourceComponent: content.sourceComponent

     Loader {
         id: content
         x: -hbar.position * width
         y: -vbar.position * height
     }

     ScrollBar {
         id: vbar
         hoverEnabled: true
         active: hovered || pressed
         orientation: Qt.Vertical
         size: frame.height / content.height
         anchors.top: parent.top
         anchors.right: parent.right
         anchors.bottom: parent.bottom
         contentItem: Rectangle {
             visible: vbar.active
             color: 'green'
             implicitWidth: 5
         }
     }

     ScrollBar {
         id: hbar
         hoverEnabled: true
         active: hovered || pressed
         orientation: Qt.Horizontal
         size: frame.width / content.width
         anchors.left: parent.left
         anchors.right: parent.right
         anchors.bottom: parent.bottom
     }
 }
