/**
 * MenuLabel.qml
 *
 * Copyright (c) 2016 Stepanov Mihail
 */

import QtQuick 2.0
import QtMultimedia 5.0
import QtQuick.Window 2.2

Text {
    property alias mouseArea: mouseArea
    property alias labelSound: labelSound
    property bool selected: false

    id: label
    style: Text.Normal
    font.italic: true
    font.pixelSize: window.width / 48
    font.family: "Courier"
    color: "#ffffff"

    Image {
        id: mark
        source: "img/marker.png"
        visible: false
        anchors.right: label.left
        anchors.bottom: label.bottom
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent
        onEntered: {
            label.chooseMenuLabel()
        }
        onExited: {
            label.dismissMenuLabel()
        }
    }
    SoundEffect {
        id: labelSound
    }
    SoundEffect{
        id: switchSound
        source: "sound/menu_switch.wav"
    }

    Behavior on scale {
        PropertyAnimation {
            duration: 200
        }
    }

    function chooseMenuLabel(){
        selected = true
        switchSound.play()
        label.scale = 1.2
        mark.visible = true
    }

    function dismissMenuLabel(){
        selected = false
        label.scale = 1
        mark.visible = false
    }
}

