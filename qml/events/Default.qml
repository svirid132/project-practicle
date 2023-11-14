import QtQuick 2.15

Item {
    height: blueRect.height + blueRect.anchors.topMargin + text.implicitHeight
    width: blueRect.width

    property alias orangeRect: orangeRect
    property alias text: text.text
    property alias blueRectWrap: blueRectWrap.sourceComponent
    property alias orangeRectWrap: orangeRectWrap.sourceComponent

    Text {
        id: text
        text: 'default'
        width: parent.width
        horizontalAlignment: Text.Center
        wrapMode: Text.WordWrap
    }

    Rectangle {
        id: blueRect
        anchors.top: text.bottom
        anchors.horizontalCenter: text.horizontalCenter
        anchors.topMargin: 10
        width: 100; height: 100
        color: 'blue'
        Loader {
            id: blueRectWrap
            anchors.fill: parent
            sourceComponent: MouseArea {
                onClicked: {
                    console.log('blue')
                }
            }
        }

        Rectangle {
            id: orangeRect
            x: 50; y: 50
            width: 50; height: 50
            color: 'orange'

            Loader {
                id: orangeRectWrap
                anchors.fill: parent
                sourceComponent: MouseArea {
                    onClicked: {
                        console.log('orange')
                    }
                }
            }
        }
    }
}
