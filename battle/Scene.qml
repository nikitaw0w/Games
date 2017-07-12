import QtQuick 2.0

Item {
    id: scene
    focus: true
    property int round: 1
    //arr_1
    Manager {
        id: man
    }

    PanelBar {
        id: pbar
        Sprite {
            id: spr
        }
    }

    Hero {
        id: he
    }

    property bool run_hero_1: pbar.arr_1_visible ? true : false
    property bool run_hero_2: pbar.arr_1_visible ? false : true

    property bool event11: false
    property bool event12: false
    property bool event21: false
    property bool event22: false
    property bool event31: false
    property bool event32: false
    property bool event41: false
    property bool event42: false
    property bool event51: false
    property bool event52: false

    property bool evcount1: false
    property bool evcount2: false
    property bool evcount3: false
    property bool evcount4: false
    property bool evcount5: false
    property bool evcount6: false
    property bool evcount7: false
    property bool evcount8: false
    property bool evcount9: false

    property bool bhero1c_ss: false
    property bool bhero1s_ss: false

    property int rand_num: 0

    Keys.onReleased: {
        if (event.isAutoRepeat) {
            //return;
          }

        switch (event.key) {
            case Qt.Key_W:
                start();
                break;
            case Qt.Key_1:
                if (pbar.arr_1_visible) doEvent(1, 1)
                else doEvent(1, 2)
                break;
            case Qt.Key_2:
                if (pbar.arr_1_visible) doEvent(2, 1)
                else doEvent(2, 2)
                break;
            case Qt.Key_3:
                if (pbar.arr_1_visible) doEvent(3, 1)
                else doEvent(3, 2)
                break;
            case Qt.Key_4:
                if (pbar.arr_1_visible) doEvent(4, 1)
                else doEvent(4, 2)
                break;
            case Qt.Key_5:
                if (pbar.arr_1_visible) doEvent(5, 1)
                else doEvent(5, 2)
                break;
            case Qt.Key_S:
                //pbar.hero1_s_framecount += 1
                hero1_s.frameCount = 6;
                break;
            case Qt.Key_D:
                //pbar.hero1_s_framecount += 1
                //hero1_s1.frameCount = 12;
                break;
            case Qt.Key_E:
                //pbar.hero1_s_framecount += 1
                hero1_ss.jumpTo(hero1_s2)
                break;
            case Qt.Key_F:
                //pbar.hero1_s_framecount += 1
                hero1c_ss.jumpTo("dismiss")
                hero1s_ss.jumpTo("dismiss")
                break;
        }
    }

    //warrior
    /* arrow */
    /*Image {
        id: arr_1
        x: mainwindow.width * 0.22
        y: mainwindow.height * 0.15
        z: 5
        source: "arr.png"
        visible: arr_1_visible

        SequentialAnimation {
            running: true
            NumberAnimation {target:arr_1; property: "y";  from: mainwindow.height * 0.15; to: mainwindow.height * 0.15 - 60; duration: 1000 }
            NumberAnimation {target:arr_1; property: "y";  from: mainwindow.height * 0.15 - 60; to: mainwindow.height * 0.15; duration: 1000 }
        }
    }*/
    //WARRIOR
    SpriteSequence {
        id: hero1_ss
        x: mainwindow.width * 0.15
        y: mainwindow.height * 0.35
        width: 303
        height: 303
        interpolate: false
        running: true
        smooth: true

        Sprite {
            id: hero1_s1
            name: "stay" //имя спрайта
            source: "ss_warrior.png" //ссылка на изображение
            frameCount: 6 //hero_frame количество кадров в анимации
            frameDuration: 400
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 0 //X координата в файле изображения
            frameY: 0 //Y
        }

        Sprite {
            id: hero1_s2
            name: "move"
            source: "ss_warrior.png" //ссылка на изображение
            frameCount: 4 //hero_frame количество кадров в анимации
            frameDuration: 200
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 303 //X координата в файле изображения
            frameY: 303 //Y
        }

        Sprite {
            id: hero1_s3
            name: "hit"
            source: "ss_warrior.png" //ссылка на изображение
            frameCount: 2 //hero_frame количество кадров в анимации
            frameDuration: 200
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 1515 //X координата в файле изображения
            frameY: 303 //Y
        }

        Sprite {
            id: hero1_s4
            name: "moveback"
            source: "ss_warrior_reverse.png" //ссылка на изображение
            frameCount: 4 //hero_frame количество кадров в анимации
            frameDuration: 200
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 303 //X координата в файле изображения
            frameY: 303 //Y
        }

        Sprite {
            id: hero1_s5
            name: "bleeding"
            source: "ss_warrior.png" //ссылка на изображение
            frameCount: 6 //hero_frame количество кадров в анимации
            frameDuration: 200
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 0 //X координата в файле изображения
            frameY: 606 //Y
        }

        Sprite {
            id: hero1_s6
            name: "bash"
            source: "ss_warrior.png" //ссылка на изображение
            frameCount: 8 //hero_frame количество кадров в анимации
            frameDuration: 200
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 303 //X координата в файле изображения
            frameY: 1212 //Y
        }

        Sprite {
            id: hero1_s7
            name: "buff"
            source: "ss_warrior.png" //ссылка на изображение
            frameCount: 3 //hero_frame количество кадров в анимации
            frameDuration: 200
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 909 //X координата в файле изображения
            frameY: 1515 //Y
        }

        Sprite {
            id: hero1_s11
            name: "damaged"
            source: "ss_warrior.png" //ссылка на изображение
            frameCount: 2 //hero_frame количество кадров в анимации
            frameDuration: 200
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 0 //X координата в файле изображения
            frameY: 909 //Y
        }

    }

    //ARMOR
    SpriteSequence {
        id: hero1c_ss
        x: mainwindow.width * 0.24
        y: mainwindow.height * 0.25
        z: 100
        width: 51
        height: 51
        interpolate: false
        running: true
        smooth: true


        Sprite {
            id: hero1c_b45d
            name: "dismiss"
            source: "ss_effects.png" //ссылка на изображение
            frameCount: 1 //hero_frame количество кадров в анимации
            frameDuration: 200
            frameWidth: 153 //параметры кадра
            frameHeight: 153
            frameX: 1515 //X координата в файле изображения
            frameY: 1515 //Y
        }

        Sprite {
            id: hero1c_b45
            name: "armor"
            source: "ss_effects.png" //ссылка на изображение
            frameCount: 1 //hero_frame количество кадров в анимации
            frameDuration: 200
            frameWidth: 153 //параметры кадра
            frameHeight: 153
            frameX: 459 //X координата в файле изображения
            frameY: 0 //Y
        }

    }

    //DEBUFF
    SpriteSequence {
        id: hero1s_ss
        x: mainwindow.width * 0.74
        y: mainwindow.height * 0.15
        z: 100
        width: 51
        height: 51
        interpolate: false
        running: true
        smooth: true

        Sprite {
            id: hero1s_b45d
            name: "dismiss"
            source: "ss_effects.png" //ссылка на изображение
            frameCount: 1 //hero_frame количество кадров в анимации
            frameDuration: 200
            frameWidth: 153 //параметры кадра
            frameHeight: 153
            frameX: 1515 //X координата в файле изображения
            frameY: 1515 //Y
        }
        Sprite {
            id: hero1s_b45
            name: "debuff"
            source: "ss_effects.png" //ссылка на изображение
            frameCount: 1 //hero_frame количество кадров в анимации
            frameDuration: 200
            frameWidth: 153 //параметры кадра
            frameHeight: 153
            frameX: 612 //X координата в файле изображения
            frameY: 0 //Y
        }
    }


    //archer
    /* arrow */
    /*Image {
        id: arr_2
        x: mainwindow.width * 0.72
        y: mainwindow.height * 0.15
        z: 5
        source: "arr.png"
        visible: arr_2_visible
        SequentialAnimation {
            running: true
            NumberAnimation { target: arr_2; property: "y";  from: mainwindow.height * 0.15; to: mainwindow.height * 0.15 - 60; duration: 1000 }
            NumberAnimation { target: arr_2; property: "y";  from: mainwindow.height * 0.15 - 60; to: mainwindow.height * 0.15; duration: 1000 }
        }
    }*/

    //ARCHER
    SpriteSequence {
        id: hero2_ss
        x: mainwindow.width * 0.65
        y: mainwindow.height * 0.35
        width: 303
        height: 303
        interpolate: false
        running: true
        smooth: true

        Sprite {
            id: hero2_s1
            name: "stay" //имя спрайта
            source: "ss_archer_reverse.png" //ссылка на изображение
            frameCount: 6 //hero_frame количество кадров в анимации
            frameDuration: 400
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 0 //X координата в файле изображения
            frameY: 0 //Y
         }

        Sprite {
            id: hero2_s2
            name: "prep" //имя спрайта
            source: "ss_archer_reverse.png" //ссылка на изображение
            frameCount: 6 //hero_frame количество кадров в анимации
            frameDuration: 400
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 0 //X координата в файле изображения
            frameY: 303 //Y
         }

        Sprite {
            id: hero2_s11
            name: "damaged" //имя спрайта
            source: "ss_archer_reverse.png" //ссылка на изображение
            frameCount: 2 //hero_frame количество кадров в анимации
            frameDuration: 200
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 0 //X координата в файле изображения
            frameY: 606 //Y
         }
    }


    SpriteSequence {
        id: hero2c_ss
        x: mainwindow.width * 0.70
        y: mainwindow.height * 0.36
        width: 303
        height: 303
        interpolate: false
        running: true
        smooth: true

        Sprite {
            id: hero2c_s1d
            name: "dismiss" //имя спрайта
            source: "ss_archer_reverse.png" //ссылка на изображение
            frameCount: 1 //hero_frame количество кадров в анимации
            frameDuration: 400
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 1212
            frameY: 1818
        }

        Sprite {
            id: hero2c_s1
            name: "arrow" //имя спрайта
            source: "ss_archer_reverse.png" //ссылка на изображение
            frameCount: 6 //hero_frame количество кадров в анимации
            frameDuration: 400
            frameWidth: 303 //параметры кадра
            frameHeight: 303
            frameX: 909 //X координата в файле изображения
            frameY: 909 //Y
         }
    }

    /*Timer {
        id: timer_on_start
        running: true
        repeat: true
        interval: 1000
        triggeredOnStart : true
        onTriggered: {
            start();
        }
    }*/

    property bool start_game: true

    function start() {
        if (run_hero_1 == true) { run_hero_1 = false; run_hero_2 = true; pbar.arr_1_visible = true; pbar.arr_2_visible = false }
        else if (run_hero_2 == true) { run_hero_1 = true; run_hero_2 = false; pbar.arr_1_visible = false; pbar.arr_2_visible = true; }

    }

    function doEvent(ability, hero) {
        if (ability === 1 && hero === 1)
        {
            event11 = true
            evcount1 = true
            //pbar.hero2_health -= he.damage_1
        }
        if (ability === 1 && hero === 2)
        {
            event12 = true
            evcount1 = true
            //pbar.hero1_health -= he.damage_2
        }
        if (ability === 2 && hero === 1)
        {
            event21 = true
            evcount1 = true
            //pbar.hero2_health -= he.damage_1
        }
        if (ability === 2 && hero === 2)
        {
            event22 = true
            evcount1 = true
           //pbar.hero1_health -= he.damage_2
        }
        if (ability === 3 && hero === 1)
        {
            event31 = true
            evcount1 = true
            //pbar.hero2_health -= he.damage_1
        }
        if (ability === 3 && hero === 2)
        {
            event32 = true
            evcount1 = true
            //pbar.hero1_health -= he.damage_2
        }
        if (ability === 4 && hero === 1)
        {
            event41 = true
            evcount1 = true
            //pbar.hero2_health -= he.damage_1
        }
        if (ability === 4 && hero === 2)
        {
            event42 = true
            evcount1 = true
            //pbar.hero1_health -= he.damage_2
        }
        if (ability === 5 && hero === 1)
        {
            event51 = true
            evcount1 = true
            //pbar.hero2_health -= he.damage_1
        }
        if (ability === 5 && hero === 2)
        {
            event52 = true
            evcount1 = true
            //pbar.hero1_health -= he.damage_2
        }

    }

    function rand(num) {
        return 1 + Math.floor(Math.random() * num);
    }

    Timer { //таймер для event11
        id: event11_timer
        interval: 100
        running: event11
        repeat: true
        onTriggered: {
            if (evcount1) {
                hero1_ss.z = 10
                hero1_ss.jumpTo("move")
                //hero1_s.setf
                evcount1 = false
                evcount2 = true
            }
            else if (evcount2) {
                if (hero1_ss.x + 100 < hero2_ss.x) {
                    hero1_ss.x += 30
                } else {
                    event11_timer.interval = 500;
                    hero1_ss.jumpTo("hit");
                    hero2_ss.jumpTo("damaged");
                    hero2_ss.x += 40
                    evcount2 = false;
                    evcount3 = true;
                }
            }
            else if (evcount3) {
                event11_timer.interval = 100
                evcount3 = false
                evcount4 = true
            }
            else if (evcount4) {
                hero2_ss.x -= 30
                hero1_ss.jumpTo("moveback")
                hero2_ss.jumpTo("stay")
                evcount4 = false
                evcount5 = true
            }
            else if (evcount5) {
                if (hero1_ss.x > mainwindow.width * 0.15) {
                    hero1_ss.x -= 30
                } else { hero1_ss.jumpTo("stay"); hero1_ss.z = 0; evcount5 = false; event11 = false; }
            }
        }
    }

    Timer { //таймер для event21
        id: event21_timer
        interval: 100
        running: event21
        repeat: true
        onTriggered: {
            if (evcount1) {
                hero1_ss.z = 10
                hero1_ss.jumpTo("move")
                //hero1_s.setf
                evcount1 = false
                evcount2 = true
            }
            else if (evcount2) {
                if (hero1_ss.x + 100 < hero2_ss.x) {
                    hero1_ss.x += 30
                } else {
                    event21_timer.interval = 1200;
                    hero1_ss.jumpTo("bleeding");
                    hero2_ss.jumpTo("damaged");
                    hero2_ss.x += 40
                    evcount2 = false;
                    evcount3 = true;
                }
            }
            else if (evcount3) {
                event21_timer.interval = 100
                evcount3 = false
                evcount4 = true
            }
            else if (evcount4) {
                hero2_ss.x -= 30
                hero1_ss.jumpTo("moveback")
                hero2_ss.jumpTo("stay")
                evcount4 = false
                evcount5 = true
            }
            else if (evcount5) {
                if (hero1_ss.x > mainwindow.width * 0.15) {
                    hero1_ss.x -= 30
                } else { hero1_ss.jumpTo("stay"); hero1_ss.z = 0; evcount5 = false; event21 = false; }
            }
        }
    }

    Timer { //таймер для event31
        id: event31_timer
        interval: 100
        running: event31
        repeat: true
        onTriggered: {
            if (evcount1) {
                hero1_ss.z = 10
                hero1_ss.jumpTo("move")
                //hero1_s.setf
                evcount1 = false
                evcount2 = true
            }
            else if (evcount2) {
                if (hero1_ss.x + 100 < hero2_ss.x) {
                    hero1_ss.x += 30
                } else {
                    event31_timer.interval = 1500;
                    hero1_ss.jumpTo("stun");
                    hero2_ss.jumpTo("damaged");
                    hero2_ss.x += 40
                    evcount2 = false;
                    evcount3 = true;
                }
            }
            else if (evcount3) {
                event31_timer.interval = 100
                evcount3 = false
                evcount4 = true
            }
            else if (evcount4) {
                hero2_ss.x -= 30
                hero1_ss.jumpTo("moveback")
                hero2_ss.jumpTo("stay")
                evcount4 = false
                evcount5 = true
            }
            else if (evcount5) {
                if (hero1_ss.x > mainwindow.width * 0.15) {
                    hero1_ss.x -= 30
                } else { hero1_ss.jumpTo("stay"); hero1_ss.z = 0; evcount5 = false; event31 = false; }
            }
        }
    }

    Timer { //таймер для event41
        id: event41_timer
        interval: 100
        running: event41
        repeat: true
        onTriggered: {
            if (evcount1) {
                hero1_ss.z = 10
                event41_timer.interval = 1200
                hero1_ss.jumpTo("buff")
                //hero1_s.setf
                evcount1 = false
                evcount2 = true
            }
            else if (evcount2) {
                hero1_ss.jumpTo("stay")
                hero1c_ss.jumpTo("armor")
                evcount2 = false
                hero1_ss.z = 0
                event41 = false
            }
        }
    }

    Timer { //таймер для event51
        id: event51_timer
        interval: 100
        running: event51
        repeat: true
        onTriggered: {
            if (evcount1) {
                hero1_ss.z = 10
                //event51_timer.interval = 1000
                //hero1_ss.jumpTo("buff")
                //hero1_s.setf
                evcount1 = false
                evcount2 = true
            }
            else if (evcount2) {
                hero1s_ss.jumpTo("debuff")
                //event51_timer.interval = 200
                evcount2 = false
                hero1_ss.z = 0
                event51 = false
            }
        }
    }
    ///////////////////////////////////////////////////////////////////////////////////////


    Timer { //таймер для event12
        id: event12_timer
        interval: 100
        running: event12
        repeat: true
        onTriggered: {
            if (evcount1) {
                hero2_ss.z = 10
                event12_timer.interval = 1200
                hero2_ss.jumpTo("prep")
                //hero1_s.setf
                evcount1 = false
                evcount2 = true
            }
            else if (evcount2) {
                hero2c_ss.jumpTo("arrow")
                //event51_timer.interval = 200
                evcount2 = false
                evcount3 = true
            }
            else if (evcount3) {
                hero2c_ss.jumpTo("arrow")
                //event51_timer.interval = 200
                event12_timer.interval = 10
                evcount3 = false
                evcount4 = true
            }
            else if (evcount4) {
                hero2_ss.jumpTo("stay")
                if (hero2c_ss.x - 100 > hero1_ss.x) {
                    hero2c_ss.x -= 10
                } else {
                hero1_ss.jumpTo("damaged")
                hero2c_ss.jumpTo("dismiss")
                hero2_ss.z = 0
                event12_timer.interval = 1000
                hero1_ss.x -= 40
                evcount4 = false
                evcount5 = true
                }
            }
            else if (evcount5) {
                hero1_ss.jumpTo("stay")
                hero1_ss.x += 40
                hero2c_ss.x = mainwindow.width * 0.70
                event12_timer.interval = 10
                event12 = false
            }
        }
    }







}
