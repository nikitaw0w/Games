/**
 * HeroSelectContainer.qml
 *
 * Copyright (c) 2016 Stepanov Mihail
 */

import QtQuick 2.0
import QtQuick.Layouts 1.3



Rectangle{
    id: panel
    color: "white"
    width: parent.width/6
    height: parent.height/2
    radius: 4


    property variant charName: ["Warrior", "Archer", "Sorcerer"]
    property int i: 0
    property alias character: name.text

    /*
      realize container with animation
      */

    RowLayout{
        id: switcher
        anchors.bottom: parent.bottom
        anchors.left:parent.left
        anchors.right:parent.right
        Image{
            id: lswitch
            source:"img/switcher.png"
            mirror: true
            Layout.alignment: "AlignLeft"
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    lswitch.scale = 1.2
                    if (i == 0) i = 2
                    else i--
                }
                onReleased: lswitch.scale = 1
            }
        }
        Text{
            id: name
            Layout.alignment: "AlignCenter"
            text: charName[i].toString()
        }

        Image{
            id: rswitch
            source:"img/switcher.png"
            Layout.alignment: "AlignRight"
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    rswitch.scale = 1.2
                    if (i == 2) i = 0
                    else i++
                }
                onReleased: rswitch.scale = 1
            }
        }
    }
}
