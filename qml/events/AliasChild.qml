import QtQuick 2.15

Default {
    id: root
    text: 'alias child (спуск). обработчик при нажатии на orange захватывает blue, потом проверяет наличие под курсором orange'
    width: 200
    blueRectWrap: MouseArea {
        onClicked: {
            console.log('blue')
            const x = mouse.x - root.orangeRect.x
            const y = mouse.y - root.orangeRect.y
            if (root.orangeRect.contains(Qt.point(x, y))) {
                console.log('orange')
            }
        }
    }
    orangeRectWrap: MouseArea {
        propagateComposedEvents: true
        onClicked: {
            mouse.accepted = false
        }
    }
}
