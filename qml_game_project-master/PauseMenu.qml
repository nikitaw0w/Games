/**
 * PauseMenu.qml
 *
 * Copyright (c) 2016 Stepanov Mihail
 */

import QtQuick 2.0
import QtQuick.Layouts 1.3

RowLayout{
    anchors.fill: parent
    spacing: 150

    onVisibleChanged: {
        res.chooseMenuLabel()
        exit.dismissMenuLabel()

        keys.focus = visible
    }

    MouseArea{
        id:mouse
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged:{
            res.dismissMenuLabel()
            exit.dismissMenuLabel()
        }
    }

    MenuLabel{
        id: res
        Layout.alignment: "AlignRight"
        text: qsTr("Resume Fight")
        mouseArea.onPressed: {
            resume()
        }
    }

    MenuLabel{
        id: exit
        Layout.alignment: "AlignLeft"
        text: qsTr("Exit to Menu")
        mouseArea.onPressed: {
            pause.visible = false
            menu.visible = true
        }
    }

    Item {
        id: keys
        Keys.onPressed: {
            if (event.isAutoRepeat) {
                return;
            }
            switch (event.key) {

            case Qt.Key_Right:
                swapLabels()
                break;

            case Qt.Key_Left:
                swapLabels()
                break;


            case Qt.Key_Space:
                if(res.selected)resume()
                else backToMenu()
                break;

            case Qt.Key_Escape:
                resume()
                break;
            }
        }
    }
    function swapLabels(){
        if(exit.selected) {
            exit.dismissMenuLabel()
            res.chooseMenuLabel()
        } else {
            exit.chooseMenuLabel()
            res.dismissMenuLabel()
        }
    }
    function resume(){
        //continue timer
        pause.visible = false
    }
    function backToMenu(){
        //reset all variables
        pause.visible = false
        menu.visible = true
    }
}
