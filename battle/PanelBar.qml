import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    //LayoutMirroring.enabled: true
    //LayoutMirroring.childrenInherit: true
    Player {
        id: pl
    }

    //ЗАДНИЙ ФОН
    Image {
        width: mainwindow.width
        height: mainwindow.height * 0.85
        source: "bg4.png"
    }

    property bool arr_1_visible: rand()
    property bool arr_2_visible: !arr_1_visible

    function rand() {
        if (1 + (Math.floor(Math.random() * 2)) == 1) return true;
        else return false;
    }

    property int cur_round: 1
    property int currentHero: arr_1_visible ? 1 : 2
    property int hero1_health: pl.h1
    property int hero2_health: pl.h2


    Rectangle {
        id: hero1_bar
        x: mainwindow.width * 0.05
        y: mainwindow.height * 0.05
        width: mainwindow.width * 0.40
        height: mainwindow.height * 0.05
        color: "green"
        border.color: arr_1_visible ? "#bab023" : "#000000"
        border.width: 3
        Text {
            x: 5
            y: 5
            color: "white"
            text: "HP: " + hero1_health
        }
    }

    Image {
        id: round_bar
        x: mainwindow.width * 0.48
        y: mainwindow.height * 0.03
        source: "round.png"
        Text {
            x: 23
            y: 19
            text: cur_round
            font.bold: true
            color: "black"
            font.pixelSize: 15
        }
    }

    Rectangle {
        id: hero2_bar
        x: mainwindow.width * 0.55
        y: mainwindow.height * 0.05
        width: mainwindow.width * 0.40
        height: mainwindow.height * 0.05
        color: "green"
        border.color: arr_2_visible ? "#bab023" : "#000000"
        border.width: 3
        Text {
            x: 5
            y: 5
            color: "white"
            text: "HP: " + hero2_health
        }
    }



    //НИЖНЯЯ ПАНЕЛЬ
    property int space: mainwindow.height * 0.03
    Rectangle {
        id: panel_rect
        width: mainwindow.width
        height: mainwindow.height * 0.85
        border.color: "red"
        x: 0
        y: mainwindow.height * 0.85
        Image {
            width: mainwindow.width
            height: mainwindow.height * 0.85
            source: "panel_bg.jpg"
        }
        RowLayout {
            x: space
            y: space
            RowLayout {
                spacing: space
                Image {
                    source: arr_1_visible ? "warrior_s1.jpg" : "archer_s1.jpg"
                    smooth: arr_1_visible
                    Text {
                        id: text_1
                        text: "1"
                        color: "white"
                        font.bold: true
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (currentHero == 1) {
                            text_name.text = pl.n11
                            text_desc.text = pl.d11
                            }
                            if (currentHero == 2) {
                            text_name.text = pl.n21
                            text_desc.text = pl.d21
                            }
                            text_1.color = "red"
                            text_2.color = "white"
                            text_3.color = "white"
                            text_4.color = "white"
                            text_5.color = "white"
                        }
                    }
                }
                Image {
                    source: arr_1_visible ? "warrior_s2.jpg" : "archer_s2.jpg"
                    Text {
                        id: text_2
                        text: "2"
                        color: "white"
                        font.bold: true
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (currentHero == 1) {
                            text_name.text = pl.n12
                            text_desc.text = pl.d12
                            }
                            if (currentHero == 2) {
                            text_name.text = pl.n22
                            text_desc.text = pl.d22
                            }
                            text_1.color = "white"
                            text_2.color = "red"
                            text_3.color = "white"
                            text_4.color = "white"
                            text_5.color = "white"
                        }
                    }
                }
                Image {
                    source: arr_1_visible ? "warrior_s3.jpg" : "archer_s3.jpg"
                    Text {
                        id: text_3
                        text: "3"
                        color: "white"
                        font.bold: true
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (currentHero == 1) {
                            text_name.text = pl.n13
                            text_desc.text = pl.d13
                            }
                            if (currentHero == 2) {
                            text_name.text = pl.n23
                            text_desc.text = pl.d23
                            }
                            text_1.color = "white"
                            text_2.color = "white"
                            text_3.color = "red"
                            text_4.color = "white"
                            text_5.color = "white"
                        }
                    }
                }
                Image {
                    source: arr_1_visible ? "warrior_b4.jpg" : "archer_b4.jpg"
                    Text {
                        id: text_4
                        text: "4"
                        color: "white"
                        font.bold: true
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (currentHero == 1) {
                            text_name.text = pl.n14
                            text_desc.text = pl.d14
                            }
                            if (currentHero == 2) {
                            text_name.text = pl.n24
                            text_desc.text = pl.d24
                            }
                            text_1.color = "white"
                            text_2.color = "white"
                            text_3.color = "white"
                            text_4.color = "red"
                            text_5.color = "white"
                        }
                    }
                }
                Image {
                    source: arr_1_visible ? "warrior_d5.jpg" : "archer_d5.jpg"
                    Text {
                        id: text_5
                        text: "5"
                        color: "white"
                        font.bold: true
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (currentHero == 1) {
                            text_name.text = pl.n15
                            text_desc.text = pl.d15
                            }
                            if (currentHero == 2) {
                            text_name.text = pl.n25
                            text_desc.text = pl.d25
                            }
                            text_1.color = "white"
                            text_2.color = "white"
                            text_3.color = "white"
                            text_4.color = "white"
                            text_5.color = "red"
                        }
                    }
                }
            }
        }
        Rectangle {
            x: mainwindow.width / 2
            y: 0
            width: 3
            height: mainwindow.height * 0.15
            color: "black"
        }

        Rectangle {
            x: mainwindow.width / 2
            y: space * 2.5
            width: mainwindow.width / 2
            height: 3
            color: "black"
        }

        ColumnLayout {
            x: mainwindow.width / 2 + space
            y: space / 3
            spacing: space
            Text {
                id: text_name
                color: "#825b53"
                text: pl.n11
                font.family: "Arial"
                font.bold: true
                font.pixelSize: 30
            }

            Text {
                id: text_desc
                color: "#d6c7c7"
                text: pl.d11
                font.italic: true
                font.pixelSize: 20
            }

        }
    }
}
