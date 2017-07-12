/**
 * MainMenu.qml
 *
 * Copyright (c) 2016 Stepanov Mihail
 */

import QtQuick 2.3
import QtMultimedia 5.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Rectangle {
    anchors.fill:parent
    property variant labels: [lNewGame, lCredits, lSound, lExitGame, empty]
    property int num: 3
    property int i: 0

    onVisibleChanged: {
        if(appFirstStart) {
            lNewGame.chooseMenuLabel()
        }

        if (imgScroll.visible) imgScroll.visible = false
        keys.focus = visible
    }

    MouseArea{
        id:mouse
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged:{
            labels[i].dismissMenuLabel()
            i = num+1
        }
    }

    Rectangle {
        id: bg
        anchors.fill: parent

        DynamicBackground{
            bgSource: "img/bg-menu.gif"
        }
        Image {
            id: imgScroll
            visible: false
            source: "img/credits.png"
            height: window.height*9/10
            width: window.width*4.5/10
            anchors.left: bg.left
            anchors.top: bg.top
            onVisibleChanged: {
                if (!visible) {
                    lCredits.text = qsTr("Show credits")
                } else {
                    lCredits.text = qsTr("Hide credits")
                }
            }
        }

        Image {
            id: imgLogo
            source: "img/logo.png"
            anchors.right: bg.right
            anchors.top: bg.top
            height: parent.height/2.5
            width: parent.width/2
        }


        RowLayout{
            anchors.right: parent.right
            anchors.left: parent.left
            height: window.height/5
            anchors.bottom: bg.bottom

            MenuLabel {
                id: lNewGame
                Layout.alignment: "AlignCenter"
                text: qsTr("New game")
                mouseArea.onPressed: {
                    gameStart()
                }
            }

            MenuLabel {
                id: lCredits
                Layout.alignment: "AlignCenter"
                text: qsTr("Show credits")
                labelSound.source: "sound/credits.wav"
                mouseArea.onPressed: {
                    credits()
                }
            }

            MenuLabel {
                id: lSound
                text: qsTr("Music:on")
                Layout.alignment: "AlignCenter"
                mouseArea.onPressed: {
                    setVolume()
                }
            }

            MenuLabel {
                id: lExitGame
                Layout.alignment: "AlignCenter"
                text: qsTr("Exit game")
                mouseArea.onPressed: {
                    window.close()
                }
            }
        }
        MenuLabel{id: empty}
    }

    Item {
        id: keys
        Keys.onPressed: {
            if (event.isAutoRepeat) {
                return;
            }

            for(var j = 0; j <= num; j++)
                if (labels[j].selected){
                    i = j
                    break;
                }

            switch (event.key) {
            case Qt.Key_Left:
                labels[i].dismissMenuLabel()
                if (--i < 0) i = num
                labels[i].chooseMenuLabel()
                break;

            case Qt.Key_Right:
                labels[i].dismissMenuLabel()
                if(++i > num) i = 0
                labels[i].chooseMenuLabel()
                break;

            case Qt.Key_Space:
                switch(i){
                case 0:
                    gameStart()
                    break;
                case 1:
                    credits()
                    break;
                case 2:
                    setVolume()
                    break;
                case 3:
                    window.close()
                    break;
                }
            }
        }
    }


    function gameStart(){
        begin.visible = true
        menu.visible = false
    }

    function credits(){
        lCredits.labelSound.play()
        imgScroll.visible = !imgScroll.visible
        console.log(imgScroll.visible)
    }

    function setVolume(){
        if (lSound.text == "Music:on") {
            sound.pause()
            lSound.text = "Music:off"
        } else {
            sound.play()
            lSound.text = "Music:on"
        }
    }
}
