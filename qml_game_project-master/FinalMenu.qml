/**
 * FinalMenu.qml
 *
 * Copyright (c) 2016 Stepanov Mihail
 */

import QtQuick 2.0
import QtQuick.Layouts 1.3

RowLayout{
    anchors.fill: parent
    spacing: 150

    onVisibleChanged: {
        ret.chooseMenuLabel()
        exit.dismissMenuLabel()

        keys.focus = visible
    }

    MouseArea{
        id:mouse
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged:{
            ret.dismissMenuLabel()
            exit.dismissMenuLabel()
        }
    }

    MenuLabel{
        id: ret
        Layout.alignment: "AlignRight"
        text: qsTr("Play Again")
        mouseArea.onPressed: {
            end.visible = false
            //game beginning
        }
    }

    MenuLabel{
        id: exit
        Layout.alignment: "AlignLeft"
        text: qsTr("Exit to Menu")
        mouseArea.onPressed: {
            end.visible = false
            menu.visible = true
            //reset all variables
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
                if(ret.selected)resume()
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
            ret.chooseMenuLabel()
        } else {
            exit.chooseMenuLabel()
            ret.dismissMenuLabel()
        }
    }
    function resume(){
        //continue timer
        end.visible = false
    }
    function backToMenu(){
        //reset all variables
        end.visible = false
        menu.visible = true
    }
}

