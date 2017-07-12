import QtQuick 2.0
import QtQuick.Window 2.0

Rectangle{
    anchors.fill: parent
    visible: true
    //width: parent.width
    //height: parent.height
    property string bgSource

    AnimatedImage {
        id: imgBg1
        source: bgSource
        visible: true
        width: window.width
        height: window.height
    }

    AnimatedImage {
        id: imgBg2
        source: bgSource
        visible: true
        mirror: true
        width: window.width
        height: window.height
        x: window.width
    }
    Timer {
        property int vel: -1
        interval: 40
        triggeredOnStart: true
        running: true
        repeat: true

        onTriggered: {
            imgBg1.x += vel
            imgBg2.x += vel
            if (Math.abs(imgBg1.x) == parent.width/4) {
                vel *= -1
            }
            if ((imgBg2.x === parent.width && vel) || (imgBg2.x === -parent.width && vel<0)) imgBg2.x *= -1
        }
    }
}
