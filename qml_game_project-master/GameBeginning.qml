import QtQuick 2.3
import QtMultimedia 5.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2

Rectangle {
    anchors.fill:parent
    id: mainwindow
    width: Screen.width
    height: Screen.height
    //visibility: "FullScreen"

    PanelBar {
        id: panelBar
    }

    Player {
        id: player
    }

    Scene {
        id: scene
    }

    Manager {
        id: manager
    }

    //title: qsTr("Hello World")
}





    /*MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }*/

