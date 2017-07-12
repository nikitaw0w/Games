import QtQuick 2.0

Item {

    Hero {
        id: l
    }
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

    function damage(num) {
        if (num == 1) l.health_2 -= l.damage_1
        if (num == 2) l.health_1 -= l.damage_2
    }

    function period_damage(num, rounds) {
        if (num == 1) health_1++
    }
}
