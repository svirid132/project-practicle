import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    FontLoader { id: fixedFont; source: "qrc:/roboto/Roboto-Black.ttf" }
    FontLoader { source: "qrc:/roboto/Roboto-BlackItalic.ttf" }
    FontLoader { source: "qrc:/roboto/Roboto-Bold.ttf" }
    FontLoader { source: "qrc:/roboto/Roboto-Italic.ttf" }
    FontLoader { source: "qrc:/roboto/Roboto-Light.ttf" }
    FontLoader { source: "qrc:/roboto/Roboto-LightItalic.ttf" }
    FontLoader { source: "qrc:/roboto/Roboto-Medium.ttf" }
    FontLoader { source: "qrc:/roboto/Roboto-MediumItalic.ttf" }
    FontLoader { source: "qrc:/roboto/Roboto-Regular.ttf" }
    FontLoader { source: "qrc:/roboto/Roboto-Thin.ttf" }
    FontLoader { source: "qrc:/roboto/Roboto-ThinItalic.ttf" }

    Text { text: "Fixed-size font"; font.family: fixedFont.name; font.italic: true}
    Text { text: "Fixed-size font"; y: 20; font.family: 'Roboto'; font.bold: true }

    ListView {
        x: 100; y: 100
        width: 240; height: 320
        property color clr: 'red'
        model: ListModel {
            id: listModel
            Component.onCompleted: {
                for (var i = 0; i < 10; i++)
                    listModel.append({"Name": "Item " + i})
            }
        }
        delegate: Item {
            id: delegateItem
            width: 100; height: 30

            Rectangle {
                width: 100; height: 30
                color: delegateItem.ListView.isCurrentItem ? "red" : "yellow"   // correct
                border.color: delegateItem.ListView.clr
                border.width: 3
            }
        }
    }

}
