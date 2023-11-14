import QtQuick 2.15

Default {
    text: 'propagateComposedEvents (подъем). обработчик при нажатии на orange захватывает сперва orange, потом blue'
    width: 200
    blueRectWrap: MouseArea {
        onClicked: {
            console.log('blue')
        }
    }
    orangeRectWrap: MouseArea {
        propagateComposedEvents: true
        onClicked: {
            console.log('orange')
            mouse.accepted = false
        }
    }
}
