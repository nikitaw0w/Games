import QtQuick 2.0

Item {
    id: player
    Hero {
        id: hero1
    }

    Hero {
        id: hero2
    }
    property int h1: hero1.health_1
    property int h2: hero2.health_2

    property string n11: hero1.s1_name
    property string n12: hero1.s2_name
    property string n13: hero1.s3_name
    property string n14: hero1.b4_name
    property string n15: hero1.d5_name
    property string d11: hero1.s1_desc
    property string d12: hero1.s2_desc
    property string d13: hero1.s3_desc
    property string d14: hero1.b4_desc
    property string d15: hero1.d5_desc


    property string n21: hero2.s11_name
    property string n22: hero2.s12_name
    property string n23: hero2.s13_name
    property string n24: hero2.b14_name
    property string n25: hero2.d15_name
    property string d21: hero2.s11_desc
    property string d22: hero2.s12_desc
    property string d23: hero2.s13_desc
    property string d24: hero2.b14_desc
    property string d25: hero2.d15_desc
}
