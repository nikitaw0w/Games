import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtMultimedia 5.6

ApplicationWindow {
    id: window
    visible: true
    width: Screen.width
    height: Screen.height
    visibility: "FullScreen"
    title: qsTr("TBFG")

    property bool appFirstStart: true

    onFocusObjectChanged: {
        if (window.active) {
            window.raise()
            sound.volume = 1

            if(appFirstStart){
                menu.visible = true
                appFirstStart = false
            }
        }
        else {
            window.lower()
            sound.volume = 0
        }
    }

    MediaPlayer {
        id: sound
        autoPlay: true
        playlist: Playlist{
            id:playlist
            PlaylistItem {id:menu_music; source: "sound/menu_music.wav"}
            playbackMode: "CurrentItemInLoop"

        }
    }

    MainMenu {
        id: menu
        visible:false
    }

    CharMenu {
        id: begin
        visible: false
    }

    PauseMenu{
        id: pause
        visible: false
        //add handler on 'Esc'
    }
    FinalMenu{
        id: end
        visible: false
    }
    GameBeginning {
        id: beginning
        visible: false
    }
}


