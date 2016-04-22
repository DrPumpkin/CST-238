import QtQuick 2.6
import QtQuick.Controls 1.5
import QtMultimedia 5.6

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("iPod")

    property bool is_playing: false

    // Possibly use hash table instead...iffy on qml's implementation of them, though (basically tuples and cannot change them)
    property variant songs: ["Burning the Nicotine Armoire",
                             "Happiness",
                             "Open Your Eyes And Look North",
                             "Surprise! I'm From Cuba, Everyone Else Has One Brain."]
    property variant bands: ["Dance Gavin Dance", "Dance Gavin Dance", "Dance Gavin Dance"]
    property int song_index: 0
    property variant sources: ["../songs/Dance Gavin Dance - Burning Down the Nicotine Armoire (audio-cutter.com).mp3",
                               "../songs/Dance Gavin Dance - Happiness.mp3",
                               "../songs/Dance Gavin Dance - Open Your Eyes and Look North.mp3"]
    property int number_of_songs: 3

    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent

        Audio
        {
            id: song_current
            source: sources[song_index]
        }

        Image {
            id: img_iPod
            source: "iPod.svg"
            smooth: true
            sourceSize.width: parent.width * .89
            sourceSize.height: parent.height * .90
            anchors.centerIn: parent

            Rectangle
            {
                id: iPod_screen
                x: 50
                y: 31
                width: 258 - x
                height: 187 - y
                color: "orange"

                Text
                {
                    id: txt_screen_song
                    //anchors.fill: parent
                    y: 0
                    text: is_playing === true ? "Song: " + songs[song_index] : ""
                    font.family: "BELLABOO"
                    font.pointSize: 16
                    wrapMode: Text.Wrap
                }

                Text
                {
                    id: txt_screen_band
                    anchors.top: txt_screen_song.bottom
                    text: is_playing === true ? "Band: " + bands[song_index] : ""
                    font.family: "BELLABOO"
                    font.pointSize: 16
                    wrapMode: Text.Wrap
                }
                MouseArea
                {
                    id: ma_screen
                    anchors.fill: parent
                    onClicked:
                    {
                        console.log("x = " + ma_screen.mouseX)
                        console.log("y = " + ma_screen.mouseY)
                        console.log("Screen clicked!")
                    }

                }
            }

            Rectangle
            {
                id: iPod_back_button
                x:80
                y: 250
                width: 40
                height: 83
                color: "transparent"

                MouseArea
                {
                    id: ma_mousearea_back
                    anchors.fill: parent

                    onClicked:
                    {
                        if(song_index > 0)
                        {
                            song_index--
                            song_current.source = sources[song_index]
                            txt_screen_song.text = "Song: " + songs[song_index]
                            txt_screen_band.text = "Band: " + bands[song_index]
                            song_current.play()
                        }

                        else
                            console.log("Reached beginning of playlist")
                        console.log("Back button clicked!")
                    }
                }
            }

            Rectangle
            {
                id: iPod_forward_button
                x: 185
                y: 262
                width: 228 - x
                height: 331 - y
                color: "transparent"

                MouseArea
                {
                    id: ma_mousearea_forward
                    anchors.fill: parent

                    onClicked:
                    {
                        if(song_index < (number_of_songs - 1))
                        {
                            song_index++
                            song_current.source = sources[song_index]
                            txt_screen_song.text = "Song: " + songs[song_index]
                            txt_screen_band.text = "Band: " + bands[song_index]
                            song_current.play()
                        }

                        else
                            console.log("Reached end of playlist")
                        console.log("Forward button clicked!")
                    }
                }
            }

            Rectangle
            {
                id: iPod_menu_button
                x: 130
                y: 225
                width: 47
                height: 263 - y
                color: "transparent"

                MouseArea
                {
                    id: ma_mousearea_menu
                    anchors.fill: parent

                    onClicked:
                    {
                        console.log("Menu button clicked!")
                    }
                }
            }

            Rectangle
            {
                id: iPod_play_button
                x: 130
                y: 330
                width: 47
                height: 368 - y
                color: "transparent"

                MouseArea
                {
                    id: ma_mousearea_play
                    anchors.fill: parent

                    onClicked:
                    {
                        if(is_playing === false)
                        {
                            is_playing = true;
                            txt_screen_song.text = "Song: " + songs[song_index]
                            txt_screen_band.text = "Band: " + bands[song_index]
                            song_current.play()
                            //song_burning_the_nicotine_armoire.play()
                        }
                        else
                        {
                            is_playing = false;
                            song_current.pause()
                            //song_burning_the_nicotine_armoire.pause()
                            txt_screen_song.text = "Paused"
                            txt_screen_band.text = ""
                        }
                        console.log("Play button clicked!")
                    }
                }
            }
        }

    }
}
