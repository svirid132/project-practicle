import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import Qt.labs.qmlmodels 1.0
import TableModel 1.0
import Lines 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Item {
        width: parent.width
        height: parent.height
        TableView {
            id: tableView
            anchors.fill: parent
            clip: true
//            rowSpacing: 1
//            columnSpacing: 1
//            reuseItems: true // Стоит ли вностить данные в пул
            interactive: false
            onWidthChanged: {
                tableView.forceLayout()
                canvas.requestPaint()
            }

            property var minWids: {
                const arr = []
                for (let i = 0; i < tableView.columns; ++i) {
                    if (i % 2 === 0) {
                        arr.push(50)
                    } else {
                        arr.push(100)
                    }
                }
                return arr
            }

            property int minContentWidth: {
                let maxWidth = 0
                for (let i = 0; i < minWids.length; ++i) {
                    maxWidth += minWids[i]
                }

                return maxWidth
            }

            columnWidthProvider: function(column) {
                if (tableView.width > tableView.minContentWidth) {
                    const interval = minWids[column] / minContentWidth * (tableView.width - tableView.minContentWidth)
                    return minWids[column] + interval
                }

                return minWids[column]
            }

            rowHeightProvider: function(row) {
                return 50
            }

            ScrollBar.vertical: ScrollBar { policy: ScrollBar.AlwaysOn }
            ScrollBar.horizontal: ScrollBar { policy: ScrollBar.AlwaysOn }

            contentWidth: {
                if (tableView.width > tableView.minContentWidth) {
                    return tableView.width
                }
                return minContentWidth
            }

            model: TableModel {}

            // если сложный delegate с несколькими delegate, то есть DelegateChooser
            delegate: Rectangle {
                implicitWidth: {
                    if (column % 2 === 0) {
                        return 50
                    }
                    return 100
                }
                implicitHeight: 50
                color: {
                    if (column % 2 === 0) {
                        return 'gray'
                    }
                    return 'white'
                }
                Text {
                    anchors.centerIn: parent
                    text: display
                }

                TableView.onReused: {
                    // Данные взяты из пула, а column, row и index обновлены
                }

                TableView.onPooled: {
                    // Данные внесены в пул
                }
            }

            onFlickEnded: {
                canvas.requestPaint()
            }
            onMovementEnded: {
                canvas.requestPaint()
            }

            Canvas {
                id: canvas
                z: 2
                width: tableView.width; height: tableView.height
                x: tableView.contentX; y: tableView.contentY
                onXChanged: {
                    canvas.requestPaint()
                }
                onYChanged: {
                    canvas.requestPaint()
                }
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();
                    ctx.strokeStyle = Qt.rgba(1, 0, 0, 1);
                    let x = 0; let y = 0
                    console.log('begin x', canvas.x, tableView.originX)
                    for (let a = 0; a < tableView.columns; ++a) {
                        x += tableView.columnWidthProvider(a)
                        if (canvas.x <= x && x <= (canvas.x + tableView.width)) {
                            console.log('x', x)
                            ctx.moveTo(x - canvas.x, 0)
                            ctx.lineTo(x - canvas.x, tableView.height)
                        }
                    }
                    for (let i = 0; i < tableView.rows - 1; ++i) {
                        y += tableView.rowHeightProvider(i)
                        if (canvas.y <= y && y <= (canvas.y + tableView.height)) {
                            ctx.moveTo(0, y)
                            ctx.lineTo(tableView.width, y)
                        }
                    }
                    ctx.stroke()
                }
            }
        }
    }
}
