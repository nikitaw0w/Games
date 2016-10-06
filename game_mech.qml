import QtQuick 2.4
import QtQuick 2.0
import QtMultimedia 5.0
import QtQuick.Controls 1.2
// MainForm { mouseArea.onClicked: { Qt.quit(); } }

Item {
    id: item
    width: manager.width
    height: manager.height

    //property int speed: 0

    //здоровье героя
    Text {
        x: manager.hero_health_position_x
        y: manager.hero_health_position_y
        text: manager.hero_health
    }

    //здоровье врага
    Text {
        x: manager.enemy_health_position_x
        y: manager.enemy_health_position_y
        text: manager.enemy_health
    }

    //экземпляр создания объектов
    Manager {
        id: manager
    }

    Item {
        anchors.fill: parent
        focus: true
        Keys.onPressed: {
            if (event.key == Qt.Key_Left) {
                console.log("move left");
                event.accepted = true;
            }
        }
    }

    //реализаця кнопок
    Keys.onReleased: {
       if (event.isAutoRepeat) {
           return;
    }
       switch (event.key) {

           //смена текущего персонажа для героя и врага (не работают спрайты)
           case Qt.Key_A:
               if (manager.current_hero != manager.heroes_count) manager.current_hero++
               else manager.current_hero = manager.first
               break;
           case Qt.Key_S:
               if (manager.current_enemy != manager.heroes_count) manager.current_enemy++
               else manager.current_enemy = manager.first
               break;

           //загрузка выбранного персонажа героя и врага
           case Qt.Key_Space:
               if (manager.current_hero == 1)
               {
                   manager.hero_damage_head = manager.warrior_damage_head;
                   manager.hero_damage_body = manager.warrior_damage_body;
                   manager.hero_damage_legs = manager.warrior_damage_legs;
                   manager.hero_chance_head = manager.warrior_chance_head;
                   manager.hero_chance_body = manager.warrior_chance_body;
                   manager.hero_chance_legs = manager.warrior_chance_legs;
               }
               else if (manager.current_hero == 2)
               {
                   manager.hero_damage_head = manager.archer_damage_head;
                   manager.hero_damage_body = manager.archer_damage_body;
                   manager.hero_damage_legs = manager.archer_damage_legs;
                   manager.hero_chance_head = manager.archer_chance_head;
                   manager.hero_chance_body = manager.archer_chance_body;
                   manager.hero_chance_legs = manager.archer_chance_legs;
               }
               else if (manager.current_hero == 3)
               {
                   manager.hero_damage_head = manager.sorcerer_damage_head;
                   manager.hero_damage_body = manager.sorcerer_damage_body;
                   manager.hero_damage_legs = manager.sorcerer_damage_legs;
                   manager.hero_chance_head = manager.sorcerer_chance_head;
                   manager.hero_chance_body = manager.sorcerer_chance_body;
                   manager.hero_chance_legs = manager.sorcerer_chance_legs;
               }

               if (manager.current_enemy == 1)
               {
                   manager.enemy_damage_head = manager.warrior_damage_head;
                   manager.enemy_damage_body = manager.warrior_damage_body;
                   manager.enemy_damage_legs = manager.warrior_damage_legs;
                   manager.enemy_chance_head = manager.warrior_chance_head;
                   manager.enemy_chance_body = manager.warrior_chance_body;
                   manager.enemy_chance_legs = manager.warrior_chance_legs;
               }
               else if (manager.current_enemy == 2)
               {
                   manager.enemy_damage_head = manager.archer_damage_head;
                   manager.enemy_damage_body = manager.archer_damage_body;
                   manager.enemy_damage_legs = manager.archer_damage_legs;
                   manager.enemy_chance_head = manager.archer_chance_head;
                   manager.enemy_chance_body = manager.archer_chance_body;
                   manager.enemy_chance_legs = manager.archer_chance_legs;
               }
               else if (manager.current_enemy == 3)
               {
                   manager.enemy_damage_head = manager.sorcerer_damage_head;
                   manager.enemy_damage_body = manager.sorcerer_damage_body;
                   manager.enemy_damage_legs = manager.sorcerer_damage_legs;
                   manager.enemy_chance_head = manager.sorcerer_chance_head;
                   manager.enemy_chance_body = manager.sorcerer_chance_body;
                   manager.enemy_chance_legs = manager.sorcerer_chance_legs;
               }
               break;

           //сигнал удара в голову героя или врага
           case Qt.Key_Q:
               if (manager.move == 1)
               {
                   events(1, 1)
                   manager.move = 2;
               }
               else if (manager.move == 2)
               {
                   events(1, 2)
                   manager.move = 1;
               }
               break;

           //сигнал удара в тело героя или врага
           case Qt.Key_W:
               if (manager.move == 1)
               {
                   events(2, 1)
                   manager.move = 2;
               }
               else if (manager.move == 2)
               {
                   events(2, 2)
                   manager.move = 1;
               }
               break;

           //сигнал удара в ноги героя или врага
           case Qt.Key_E:
               if (manager.move == 1)
               {
                   events(3, 1)
                   manager.move = 2;
               }
               else if (manager.move == 2)
               {
                   events(3, 2)
                   manager.move = 1;
               }
               break;

           //сигнал суперудара героя или врага
           case Qt.Key_R:
               if (manager.move == 1)
               {
                   events(4, 1)
                   manager.move = 2;
               }
               else if (manager.move == 2)
               {
                   events(4, 2)
                   manager.move = 1;
               }
               break;
       }
    }

    //таймер для загрузки спрайтов
    Timer {
        interval: 1
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            if (manager.current_hero == 1) manager.hero_source = "warrior.png"
            if (manager.current_hero == 2) manager.hero_source = "archer.png"
            if (manager.current_hero == 3) manager.hero_source = "sorcerer.png"

            if (manager.current_enemy == 1) manager.enemy_source = "warrior.png"
            if (manager.current_enemy == 2) manager.enemy_source = "archer.png"
            if (manager.current_enemy == 3) manager.enemy_source = "sorcerer.png"
        }
    }

    /*
    //задний фон
    Image {
        source: "back.jpg"
        fillMode: Image.Tile //свойство, когда источник изображения имеет другой размер, чем заданный
        anchors.fill: parent
        z: manager.z_background //задний план фона
    }
*/

    //спрайт героя
    SpriteSequence {
        id: spritesequence_hero
        width: manager.sprite_width
        height: manager.sprite_height
        x: manager.hero_sprite_x
        y: manager.hero_sprite_y
        Sprite {
            id: hero_first_sprite
            source: manager.hero_source
        }
    }

    //спрайт врага
    SpriteSequence {
        id: spritesequence_enemy
        width: manager.sprite_width
        height: manager.sprite_height
        x: manager.enemy_sprite_x
        y: manager.enemy_sprite_y
        Sprite {
            id: enemy_first_sprite
            source: manager.enemy_source
            reverse: true
        }
    }

     /* Image { //изображение врага вместо спрайта (работает зеркальное отражение)
          id: my_image
          source: "archer.png"
          //fillMode: Image.Tile //свойство, когда источник изображения имеет другой размер, чем заданный
          //anchors.fill: parent
          width: manager.sprite_width
          height: manager.sprite_height
          x: manager.enemy_sprite_x
          y: manager.enemy_sprite_y
          mirror: true
      }
*/
    //property string cur_ev: "0"
    //случившееся событие (номер события, номер игрока (герой или враг))
    function events(ev, num) {
        if (ev == 1 && num == 1)
        {
            manager.cur_ev = "11"
            if (on_hit(manager.hero_chance_head)) manager.enemy_health -= manager.hero_damage_head
        }
        if (ev == 1 && num == 2)
        {
            manager.cur_ev = "12"
            if (on_hit(manager.enemy_chance_head)) manager.hero_health -= manager.enemy_damage_head
        }
        if (ev == 2 && num == 1)
        {
            manager.cur_ev = "21"
            if (on_hit(manager.hero_chance_body)) manager.enemy_health -= manager.hero_damage_body
        }
        if (ev == 2 && num == 2)
        {
            manager.cur_ev = "22"
            if (on_hit(manager.enemy_chance_body)) manager.hero_health -= manager.enemy_damage_body
        }
        if (ev == 3 && num == 1)
        {
            manager.cur_ev = "31"
            if (on_hit(manager.hero_chance_legs)) manager.enemy_health -= manager.hero_damage_legs
        }
        if (ev == 3 && num == 2)
        {
            manager.cur_ev = "32"
            if (on_hit(manager.enemy_chance_legs)) manager.hero_health -= manager.enemy_damage_legs
        }
        if (ev == 4 && num == 1) manager.cur_ev = "41"
        if (ev == 4 && num == 2) manager.cur_ev = "42"
    }

    //текущий ход (кто ходит?)
    Text {
        x: manager.move_x
        y: manager.move_y
        text: "Move " + manager.move
    }

    //последнее случившееся событие
    Text {
        x: manager.cur_ev_x
        y: manager.cur_ev_y
        text: "Event " + manager.cur_ev
    }

    //характеристики персонажей
    Text {
        x: manager.hundred
        y: manager.hundred
        text: "Damage in Head\n" + manager.hero_damage_head + " " + manager.enemy_damage_head + "\n" +
              "Damage in Body\n" + manager.hero_damage_body + " " + manager.enemy_damage_body + "\n" +
              "Damage in Legs\n" + manager.hero_damage_legs + " " + manager.enemy_damage_legs + "\n" +
              "Chance in Head\n" + manager.hero_chance_head + " " + manager.enemy_chance_head + "\n" +
              "Chance in Body\n" + manager.hero_chance_body + " " + manager.enemy_chance_body + "\n" +
              "Chance in Legs\n" + manager.hero_chance_legs + " " + manager.enemy_chance_legs
    }

    //функция, отслеживающая попадание
    function on_hit(chance)
    {
        if (chance >= random(manager.hundred, manager.zero)) return 1
        else return 0
    }

    //функция случайного числа
    function random(a, b) {
        manager.random = Math.floor(Math.random() * (a + 1)) + b
        return manager.random
    }
}
