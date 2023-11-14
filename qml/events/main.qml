import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Row {
        x: 20; y: 20
        spacing: 30
        Default {}
        PropagateComposedEvents {}
        AliasChild {}
    }
}
