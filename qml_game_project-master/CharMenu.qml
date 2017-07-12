/**
 * CharMenu.qml
 *
 * Copyright (c) 2016 Stepanov Mihail
 */

import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Rectangle {
    anchors.fill:parent

    property int bgIndex: box.currentIndex
    property string location: background[bgIndex]
    property variant background:["img/unknown.png","img/bg1.png","img/bg2.png","img/bg3.png","img/bg4.png","img/bg5.png","img/bg6.png","img/bg7.png"]
    property string locationOut

    onVisibleChanged: {
        keys.focus = visible

        box.currentIndex = 1
        bo3.checked = true

        go.chooseMenuLabel()
        back.dismissMenuLabel()
    }

    MouseArea{
        id:mouse
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged:{
            go.dismissMenuLabel()
            back.dismissMenuLabel()
        }
    }

    DynamicBackground{
        bgSource: location
    }

    RowLayout{
        id:mod
        anchors.top:parent.top
        anchors.left:parent.left
        anchors.right:parent.right
        height: begin.height/5

        RadioDelegate {
            id: bo1
            Layout.alignment: "AlignCenter"
            contentItem: Text{
                text: qsTr('BO1')
                color: "white"
                font.bold: true
                font.pixelSize: 18
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
        }

        RadioDelegate {
            id: bo3
            Layout.alignment: "AlignCenter"
            contentItem: Text{
                text: qsTr('BO3')
                color: "white"
                font.bold: true
                font.pixelSize: 18
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
        }

        RadioDelegate {
            id: bo5
            Layout.alignment: "AlignCenter"
            contentItem: Text{
                text: qsTr('BO5')
                color: "white"
                font.bold: true
                font.pixelSize: 18
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
        }
    }


    HeroSelectContainer{
        id: p1
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: width
    }

    //make description container with icons and stats
    Text{
        id: desc1
        anchors.margins:10
        anchors.right: p1.left
        anchors.top: p1.top
        anchors.left:parent.left
        font.italic: true
        font.pixelSize: window.width / 70
        font.family: "Courier"
        color: "#ffffff"
        text: qsTr("Description\nDescription\nDescription\nDescription\nDescription")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
    }

    HeroSelectContainer{
        id:p2
        anchors.right: parent.right
        anchors.rightMargin: width
        anchors.verticalCenter: parent.verticalCenter
    }

    Text{
        id: desc2
        anchors.margins:10
        anchors.left: p2.right
        anchors.top: p2.top
        anchors.right:parent.right
        font.italic: true
        font.pixelSize: window.width / 70
        font.family: "Courier"
        color: "#ffffff"
        text: qsTr("Description\nDescription\nDescription\nDescription\nDescription")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
    }

    Image{
        id:imgVs
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source:"img/vs.png"
    }

    RowLayout{
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        height: begin.height/5

        MenuLabel{
            id: back
            Layout.alignment: "AlignCenter"
            text: qsTr("Back to Menu")
            mouseArea.onPressed: {
                backToMenu()
            }
        }

        MenuLabel{
            id: go
            Layout.alignment: "AlignCenter"
            text: qsTr("To Fight!")
            mouseArea.onPressed: {
                //game beginning
            }
        }
    }

    Row{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: imgVs.bottom
        anchors.topMargin: parent.height/5
        spacing: 5

        Text{
            text: qsTr("Location:")
            style: Text.Normal
            font.italic: true
            font.pixelSize: window.width / 60
            font.family: "Courier"
            color: "#ffffff"
        }

        ComboBox {
            id: box
            width: 200
            model: [ "Random","Waterfall", "Springhead", "Forest", "Autumn court","Cemetery", "Water mill", "Temple" ]
            onCurrentIndexChanged: {
                if (currentIndex == 0){
                    locationOut = background[Math.floor(Math.random() * (box.count))]
                }
                else {
                    locationOut = location
                }
            }
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
                if(go.selected){/*game start*/}
                else backToMenu()
                break;

            case Qt.Key_Escape:
                backToMenu()
                break;
            }
        }
    }

    function backToMenu(){
        begin.visible = false
        menu.visible = true
    }

    function toFight() {
        sound.pause()
        begin.visible = false
        beginning.visible = true
    }

    function swapLabels(){
        if(go.selected) {
            go.dismissMenuLabel()
            back.chooseMenuLabel()
        } else {
            go.chooseMenuLabel()
            back.dismissMenuLabel()
        }
    }
}

