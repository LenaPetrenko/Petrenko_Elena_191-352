
import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0
import QtMultimedia 5.12

Page {
    id:page2GUI
    header : ToolBar{ //создание панели
        background: Rectangle { //создание фона
            id:rec2
            color: "#001624"}
        GridLayout{
            id:layout2
            anchors.fill:parent //по ширине родителя

            columns:2
            rows: 1
            Label {
                Layout.row:0
                Layout.column:1
                id: lab2
                text: "Лабораторная работа №2"
                color: "#83bbde"
                anchors.verticalCenter: header.verticalCenter
                font.weight: Font.Medium
                font.pointSize: 15
                font.family: "Arial"
            }
            Image {
                id: imag2
                Layout.row:0
                Layout.column:0
                source: "qrc:/image/imgonline-com-ua-Resize-xQETFjaEy3.png"
                anchors.left:parent.left //привязка справа от родителя
                anchors.leftMargin: 5
            }

        }

    }
    ColumnLayout {
        anchors.fill:parent
        spacing: 8

        Row{ //расположение кнопок на одном ряду
            id:row2
            anchors.horizontalCenter: parent.horizontalCenter


            RadioButton {
                id: video
                text: qsTr("Видео")
                checked: true

                indicator: Rectangle {
                    implicitWidth: 26
                    implicitHeight: 26
                    x: video.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 13
                    border.color: video.down ? "#83bbde" : "#83bbde"

                    Rectangle {
                        width: 14
                        height: 14
                        x: 6
                        y: 6
                        radius: 7
                        color: video.down ? "#83bbde" : "#83bbde"
                        visible: video.checked
                    }
                }

                contentItem: Text {
                    text: video.text
                    font: video.font
                    opacity: enabled ? 1.0 : 0.3
                    color: video.down ? "#83bbde" : "#83bbde"
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: video.indicator.width + video.spacing
                }
            }
            RadioButton {
                id: camera
                text: qsTr("Камера")
                checked: false

                indicator: Rectangle {
                    implicitWidth: 26
                    implicitHeight: 26
                    x: camera.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 13
                    border.color: camera.down ? "#83bbde" : "#83bbde"

                    Rectangle {
                        width: 14
                        height: 14
                        x: 6
                        y: 6
                        radius: 7
                        color: camera.down ? "#83bbde" : "#83bbde"
                        visible: camera.checked
                    }
                }

                contentItem: Text {
                    text: camera.text
                    font: camera.font
                    opacity: enabled ? 1.0 : 0.3
                    color: camera.down ? "#83bbde" : "#83bbde"
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: camera.indicator.width + camera.spacing
                }
            }
        }
        RowLayout{
            Item{ // вкладка видео
                id: page_v
                width: parent.width
                height: parent.height
                ColumnLayout{
                    width: parent.width
                    height: parent.height

                    Row{

                        MediaPlayer{
                            id: lena_video
                            source: "qrc:/image/Storm - 40581.mp4"
                            volume: slid_vol.value //громкость видео настраивается на slid_vol
                        }
                    }
                    RowLayout{
                        Layout.fillWidth: true
                        RoundButton{ //создание кнопки stop

                                                           Image {
                                                               height: 40
                                                               width: 40
                                                               id: stop
                                                               source: "qrc:/image/stop.png"
                                                           }
                                                           ColorOverlay { //цвет для картинки
                                                                 anchors.fill: stop
                                                                 source: stop //источник
                                                                 color: "#83bbde"  // make image like it lays under red glass
                                                             }
                                                           flat: true
                                                           onClicked: lena_video.stop() //остановка видео
                                                       }
                        RoundButton{//создание кнопки play и pause

                            Image {
                                height: 40
                                width: 40
                                id: play_pause
                                source: {
                                    if (lena_video.playbackState == MediaPlayer.PlayingState) //PlayingState - медиафайл в данный момент воспроизводится.
                                        return "qrc:/image/pause.png"
                                    else
                                        return "qrc:/image/play.png"
                                }

                            }
                            ColorOverlay { //цвет для картинки
                                anchors.fill: play_pause // на весь слайдер
                                source: play_pause//источник
                                color: "#83bbde"
                            }

                            flat: true //кнопка плоская

                            onClicked: {
                                if (lena_video.playbackState == MediaPlayer.PlayingState)
                                    return lena_video.pause();
                                else
                                    return lena_video.play();
                            }
                        }



                            Slider {  //регулировка громкости громкости
                                id: slid_vol
                                from: 0
                                to: 1
                                value: 0.2

                                background: Rectangle {
                                    x: slid_vol.leftPadding
                                    y: slid_vol.topPadding + slid_vol.availableHeight / 2 - height / 2
                                    implicitWidth: 200
                                    implicitHeight: 4
                                    width: slid_vol.availableWidth
                                    height: implicitHeight
                                    radius: 2
                                    color: "#001624"

                                    Rectangle {
                                        width: slid_vol.visualPosition * parent.width
                                        height: parent.height
                                        color: "#83bbde"
                                        radius: 2
                                    }
                                }

                                handle: Rectangle {
                                    x: slid_vol.leftPadding + slid_vol.visualPosition * (slid_vol.availableWidth - width)
                                    y: slid_vol.topPadding + slid_vol.availableHeight / 2 - height / 2
                                    implicitWidth: 26
                                    implicitHeight: 26
                                    radius: 13
                                    color: slid_vol.pressed ? "#f0f0f0" : "#f6f6f6"
                                    border.color: "#bdbebf"
                                }
                            }
                        anchors.horizontalCenter: slid_time.horizontalCenter
                        anchors.top:slid_time.bottom

                    }

                    Slider {  //регулировка громкости громкости
                        id: slid_time
                        from: 0 //начало
                        to: lena_video.duration //конец
                        value: lena_video.position //позиция видео
                        Material.accent: Material.Blue
                        anchors.horizontalCenter: outv.horizontalCenter
                        anchors.top:outv.bottom
                        Layout.fillWidth:  true
                        anchors.left: parent.left

                        anchors.right: parent.right

                        onPressedChanged: {
                            lena_video.seek(slid_time.value) //при сдвиге позиция видео меняется
                        }

                        background: Rectangle {
                            x: slid_time.leftPadding
                            y: slid_time.topPadding + slid_time.availableHeight / 2 - height / 2
                            implicitWidth: 200
                            implicitHeight: 4
                            width: slid_time.availableWidth
                            height: implicitHeight
                            radius: 2
                            color: "#001624"

                            Rectangle {
                                width: slid_time.visualPosition * parent.width
                                height: parent.height
                                color: "#83bbde"
                                radius: 2
                            }
                        }

                        handle: Rectangle {
                            x: slid_time.leftPadding + slid_time.visualPosition * (slid_time.availableWidth - width)
                            y: slid_time.topPadding + slid_time.availableHeight / 2 - height / 2
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            color: slid_time.pressed ? "#f0f0f0" : "#f6f6f6"
                            border.color: "#bdbebf"
                        }
                    }



                    VideoOutput { //отображение видео
                        id: outv
                        source: lena_video
                        anchors.fill: parent
                        anchors.topMargin: 20
                        anchors.bottomMargin: 100
                        Layout.fillWidth: true
                    }



                    visible: { //отображение страницы когда нажата кнопка видео
                        if(video.checked == true){
                            return true
                        }
                        else
                            return false
                    }
                }
            }
            Item { // страница с камерой

                              id: page_c
                              anchors.left: parent.left
                              anchors.right: parent.right
                              anchors.top: camera1.bottom
                              anchors.bottom: parent.bottom
                              anchors.verticalCenter: parent.verticalCenter

                              Camera{
                                  id: camera1

                                  captureMode: stop()
                                  imageCapture{
                                      onImageCaptured: {
                                          photoPreview.source = preview //отображение превьюшки фоток
                                      }
                                  }
                              }


                              VideoOutput{ //отображение камеры
                                  id: videoCam
                                  source: camera1
                                  focus :  visible
                                  autoOrientation:true //автоориентация.Для телефона, чтобы камера отображалась корректно.
                                  anchors.left: parent.left
                                  anchors.right:parent.right
                                  anchors.top: camera1.bottom
                                  anchors.bottom: page_c.bottom
                                  anchors.leftMargin: 20
                                  anchors.rightMargin: 20
                                  anchors.bottomMargin: 45
                                  anchors.verticalCenter: parent.verticalCenter
                                  anchors.horizontalCenter: parent.horizontalCenter


                              }

                              Image { //превьюшка фоток
                                  Layout.column: 1
                                  Layout.row: 0
                                  id:  photoPreview

                                  anchors.horizontalCenter: parent.horizontalCenter
                                  height: 150
                                  width: 200
                              }
                              RowLayout{
                                  Layout.alignment: Qt.AlignCenter

                                  Layout.columnSpan: 3
                                  Layout.row: 2
                                  RoundButton{ // кнопка - сделать фото или поставить видео на паузу
                                      id: foto_button
                                      Layout.leftMargin: 8
                                      anchors.top:camera1.bottom
                                      anchors.topMargin: 10
                                      Image {
                                          source: {
                                              if (camera1.videoRecorder.recorderState === CameraRecorder.StoppedState) //StoppedState-камера не записывает видео.
                                                  return "qrc:/image/cam.png"

                                              else if (camera1.videoRecorder.recorderStatus === CameraRecorder.PausedStatus) //PausedStatus-Запись приостановлена.
                                                  return "qrc:/image/new_play.png"
                                          }
                                      }
                                      flat: true
                                      onClicked: {
                                          if (camera1.videoRecorder.recorderState === CameraRecorder.StoppedState){ //StoppedState-камера не записывает видео.
                                              camera1.imageCapture.capture() // метод захвата неподвижного объекта (фото)
                                              }
                                          else if (camera1.videoRecorder.recorderStatus === CameraRecorder.RecordingStatus) //RecordingState-Камера записывает видео.
                                              camera1.videoRecorder.recorderStatus = CameraRecorder.PausedStatus //PausedStatus-Запись приостановлена.
                                          else if (camera1.videoRecorder.recorderStatus === CameraRecorder.PausedStatus) //PausedStatus-Запись приостановлена.
                                              camera1.videoRecorder.recorderStatus = CameraRecorder.RecordingStatus //RecordingState-Камера записывает видео.
                                      }
                                  }

                                  RoundButton { //кнопка - начать видео или остановить его
                                      id: video_button
                                      Image {
                                          source: {
                                              if (camera1.videoRecorder.recorderStatus === CameraRecorder.RecordingStatus) //RecordingState-Камера записывает видео.
                                                  return "qrc:/image/new_stop.png"
                                              else
                                                  return "qrc:/image/v_cam.png"
                                          }
                                      }
                                      flat: true
                                      onClicked: {
                                          if(camera1.videoRecorder.recorderState === CameraRecorder.StoppedState){ //StoppedState-камера не записывает видео.
                                              camera1.videoRecorder.outputLocation = "C:/Users/admin/Desktop/lab3";
                                              camera1.videoRecorder.record() // начать запись
                                          }
                                          else
                                              camera1.videoRecorder.stop() // остановить
                                      }
                                  }
                              }

                              visible: { //отображение страницы, когда кнопка видео не нажата
                                  if(video.checked == false){
                                      return true
                                  }
                                  else
                                      return false
                              }
                          }

                      }
                  }
             }
