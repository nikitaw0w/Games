import QtQuick 2.0

Item {
    id: hero_item

    property int hero1: 1
    property int hero2: 2

    property int health_1: 120
    property int damage_1: 10
    property int period_damage_1: 5
    property int period_damage_count_1: 3
    property int stunned_1: 0
    property real blocked_1: 0.5
    property real debuff_damage_1: 0.25
    property int debuff_damage_count_1: 3
    property real buff_1: 0
    property real chance_1: 0


    property string s1_name: "Удар мечом"
    property string s2_name: "Кровопускание"
    property string s3_name: "Сокрушающий удар"
    property string b4_name: "Змеиная кожа"
    property string d5_name: "Пронзительный вой"

    property string s1_desc: "Наносит 10 ед. урона."
    property string s2_desc: "Наносит 5 ед. урона + 5 ед. урона следующие 2 хода."
    property string s3_desc: "Оглушает цель, нанося 10 ед. урона."
    property string b4_desc: "Блокирует весь входящий урон на 50% на 2 хода."
    property string d5_desc: "Увеличивает входящий урон врага на 25% на 3 хода."

    property int health_2: 80
    property int damage_2: 15
    property int period_damage_2: 5
    property int period_damage_count_2: 3
    property int stunned_2: 0
    property real blocked_2: 0
    property real debuff_damage_2: 0.25
    property int debuff_damage_count_2: 3
    property real buff_2: 0.4
    property real chance_2: 0.66

    property string s11_name: "Быстрый выстрел"
    property string s12_name: "Пронзающий выстрел"
    property string s13_name: "Шквал стрел"
    property string b14_name: "Верный орёл"
    property string d15_name: "Метка лучницы"

    property string s11_desc: "Наносит 15 ед. урона."
    property string s12_desc: "Наносит 10 ед. урона, повышая уклонение на 40% на след. ход."
    property string s13_desc: "Выпускает 3 стрелы на 15 ед. урона с вероятностью 66%."
    property string b14_desc: "Очищает от эффектов. Повышает уклонение на 50%. на 1 ход."
    property string d15_desc: "Увеличивает входящий урон врага на 35% на 2 хода."


    //// Warrior ////
    QtObject {
        id: warrior_1
        property int health: 120

        //// Skills ////
        // p0. s1 наносит на 10 ед. урона больше, если здоровье опускается до 20.
        // s1. [Удар мечом] Наносит 10 ед. урона.
        // s2. [Кровопускание] Наносит 5 ед. урона + 5 ед. урона следующие 2 хода.
        // s3. [Сокрушающий удар] Оглушает цель, нанося 10 ед. урона.
        // b4. [Змеиная кожа] Блокирует весь входящий урон на 50% на 2 хода.
        // d5. [Пронзительный вой] Увеличивает входящий урон врага на 25% на 3 хода.
        ////////////////

        property string s1_name: "Удар мечом"
        property string s2_name: "Кровопускание"
        property string s3_name: "Сокрушающий удар"
        property string b4_name: "Змеиная кожа"
        property string d5_name: "Пронзительный вой"

        property string s1_desc: "Наносит 10 ед. урона."
        property string s2_desc: "Наносит 5 ед. урона + 5 ед. урона следующие 2 хода."
        property string s3_desc: "Оглушает цель, нанося 10 ед. урона."
        property string b4_desc: "Блокирует весь входящий урон на 50% на 2 хода."
        property string d5_desc: "Увеличивает входящий урон врага на 25% на 3 хода."

    }

    //// Archer ////
    QtObject {
        id: archer_2
        property int health: 80

        //// Skills ////
        // p0. s2 - шанс критического урона 15 с вероятностью 20%.
        // s1. [Быстрый выстрел] Наносит 15 ед. урона.
        // s2. [Пронзающий выстрел] Наносит 10 ед. урона, увеличивая уклонение на 40% на след. ход.
        // s3. [Шквал стрел]Выпускает 3 стрелы, каждая из которых наносит 15 ед. урона с вероятностью 66%.
        // b4. [Верный орёл] Очищает от отрицательных эффектов. Увеличивает уклонение на 50% на 1 ход.
        // d5. [Метка лучницы] Увеличивает входящий урон на 25% на 3 хода.
        ////////////////

        property string s1_name: "Быстрый выстрел"
        property string s2_name: "Пронзающий выстрел"
        property string s3_name: "Шквал стрел"
        property string b4_name: "Верный орёл"
        property string d5_name: "Метка лучницы"

        property string s1_desc: "Наносит 15 ед. урона."
        property string s2_desc: "Наносит 10 ед. урона, увеличивая уклонение на 40% на след. ход."
        property string s3_desc: "Выпускает 3 стрелы, каждая из которых наносит 15 ед. урона с вероятностью 66%."
        property string b4_desc: "Очищает от отрицательных эффектов. Увеличивает уклонение на 50% на 1 ход."
        property string d5_desc: "Увеличивает входящий урон врага на 25% на 3 хода."

    }

}
