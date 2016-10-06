import QtQuick 2.0

//менеджер для создания переменных, объектов и пр.
QtObject {
    id: object
    property int width: 1280 //параметры экрана: ширина
    property int height: width / 16*9 //высота

    property int sprite_width: width / 5 //параметры спрайта: ширина
    property int sprite_height: height / 4 //высота
    property int hero_sprite_x: width * 0.15 //положение спрайта по x
    property int hero_sprite_y: height * 0.7 //положение спрайта по y
    property int enemy_sprite_x: width * 0.6 //положение вражеского спрайта, 0.85 не работает
    property int enemy_sprite_y: height * 0.7

    property int z_background: -10 //координата заднего фона

    property int heroes_count: 3 //кол-во персонажей
    property int current_hero: 1 //текущий персонаж у героя (1 игрока)
    property int current_enemy: 3 //текущий персонаж у врага (2 игрока)
    property int first: 1 //1,0,100
    property int zero: 0
    property int hundred: 100

    property int hero_damage_head: 0 //урон героя по голове, телу, ногам + шанс попадания
    property int hero_damage_body: 0
    property int hero_damage_legs: 0
    property int hero_chance_head: 0
    property int hero_chance_body: 0
    property int hero_chance_legs: 0
    property int hero_health: 100 //здоровье героя
    property int hero_health_position_x: width * 0.25 //положение бара со здоровьем
    property int hero_health_position_y: height * 0.1

    property int enemy_damage_head: 0 //урон врага по голове, телу, ногам + шанс попадания
    property int enemy_damage_body: 0
    property int enemy_damage_legs: 0
    property int enemy_chance_head: 0
    property int enemy_chance_body: 0
    property int enemy_chance_legs: 0
    property int enemy_health: 100 //здоровье врага
    property int enemy_health_position_x: width * 0.7 //положение бара со здоровьем
    property int enemy_health_position_y: height * 0.1

    //property int random_number: Math.floor(Math.random() * 100)
    //property int number: 1337

    property bool chars_selected: false //выбраны ли персонажи


    //C H A M P I O N S
    //1 - Warrior
    //характеристики воина
    property int warrior_damage_head: 40
    property int warrior_damage_body: 10
    property int warrior_damage_legs: 5

    property int warrior_chance_head: 25
    property int warrior_chance_body: 100
    property int warrior_chance_legs: 25

    //2 - Archer
    //характеристики лучника
    property int archer_damage_head: 40
    property int archer_damage_body: 20
    property int archer_damage_legs: 10

    property int archer_chance_head: 33
    property int archer_chance_body: 100
    property int archer_chance_legs: 40

    //3 - Sorcerer
    //характеристики заклинателя
    property int sorcerer_damage_head: Math.floor(Math.random() * 21) + 30 //30 - 50
    property int sorcerer_damage_body: Math.floor(Math.random() * 11) + 5 //5 - 15
    property int sorcerer_damage_legs: Math.floor(Math.random() * 5) + 3 //3 - 7

    property int sorcerer_chance_head: 25
    property int sorcerer_chance_body: 100
    property int sorcerer_chance_legs: 25

    //исходники
    property string hero_source: "warrior.png"
    property string enemy_source: "archer.png"

    property int move_x: width / 2 //положение бара с текущим ходом
    property int move_y: height / 2
    property int move: Math.floor(Math.random() * 2) + 1 //кто ходит первым
    property int move_num: 1 //номер хода
    property string cur_ev: "0" //текущее событие
    property int cur_ev_x: move_x //положение бара текущего события
    property int cur_ev_y: move_y - 50

    property int random: 0 //рандомное число

    /*function warrior(a) {
        if (a === 1) {
            hero_damage_head = warrior_damage_head
            hero_damage_body = warrior_damage_body
            hero_damage_legs = warrior_damage_legs
        }
        if (a === 2) {
            enemy_damage_head = warrior_damage_head
            enemy_damage_body = warrior_damage_body
            enemy_damage_legs = warrior_damage_legs
        }
    }

    function archer() {

    }

    function sorcerer() {

    } */
}
