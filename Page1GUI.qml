import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick 2.12

Page {
      id:page1GUI
      header : ToolBar{ //создание панели
          background: Rectangle { //создание фона
              id:rec1
              color: "#001624"}
                              GridLayout{
                              id:layout1
                              anchors.fill:parent //по ширине родителя
                              columns:2
                              rows: 1
                                        Label {
                                               Layout.row:0
                                               Layout.column:1
                                               id: lab1
                                               text: "Лабораторная работа №1"
                                               color: "#83bbde"
                                               anchors.verticalCenter: header.verticalCenter
                                               font.weight: Font.Medium
                                               font.pointSize: 15
                                               font.family: "Arial"
                                        }
                                               Image {
                                               id: imag
                                               Layout.row:0
                                               Layout.column:0
                                               source: "qrc:/image/imgonline-com-ua-Resize-xQETFjaEy3.png"
                                               anchors.left:parent.left //привязка справа от родителя
                                               anchors.leftMargin: 5
                                               }

                                        }

                            }

            GridLayout{
                      anchors.fill:parent
                      anchors.margins: 10



                                            Label {
                                                id: inputname
                                                text: qsTr("Введите ваше имя:")
                                                color: "#83bbde"
                                                Layout.row: 0
                                                Layout.column: 0
                                                font.pointSize: 12
                                                font.family: "Arial"
                                            }

                                                TextArea {
                                                    id: entername
                                                    Layout.row: 0
                                                    Layout.column: 1
                                                    Layout.fillWidth: true
                                                    Layout.fillHeight: true
                                                    placeholderText: qsTr("Введите имя")
                                                    background: Rectangle {
                                                        implicitWidth: 50
                                                        implicitHeight: 20
                                                        border.color: entername.enabled ? "#001624" : "transparent"
                                                    }


                                                }


                                            Text {
                                                id: choosebright
                                                text: qsTr("Выберите яркость:")
                                                color: "#83bbde"
                                                Layout.row: 1
                                                Layout.column: 0
                                                font.pointSize: 12
                                                font.family: "Arial"

                                            }
                                            RangeSlider {
                                                id: bright
                                                first.value: 0.25
                                                second.value: 0.75
                                                Layout.row: 1
                                                Layout.column: 1
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true
                                                background: Rectangle {
                                                    x: bright.leftPadding
                                                    y: bright.topPadding + bright.availableHeight / 2 - height / 2
                                                    implicitWidth: 200
                                                    implicitHeight: 4
                                                    width: bright.availableWidth
                                                    height: implicitHeight
                                                    radius: 2
                                                    color: "#bdbebf"

                                                    Rectangle {
                                                        x: bright.first.visualPosition * parent.width
                                                        width: bright.second.visualPosition * parent.width - x
                                                        height: parent.height
                                                        color: "#83bbde"
                                                        radius: 2
                                                    }
                                                }

                                                first.handle: Rectangle {
                                                    x: bright.leftPadding + bright.first.visualPosition * (bright.availableWidth - width)
                                                    y: bright.topPadding + bright.availableHeight / 2 - height / 2
                                                    implicitWidth: 26
                                                    implicitHeight: 26
                                                    radius: 13
                                                    color: bright.first.pressed ? "#83bbde" : "#83bbde"
                                                    border.color: "#83bbde"
                                                }

                                                second.handle: Rectangle {
                                                    x: bright.leftPadding + bright.second.visualPosition * (bright.availableWidth - width)
                                                    y: bright.topPadding + bright.availableHeight / 2 - height / 2
                                                    implicitWidth: 26
                                                    implicitHeight: 26
                                                    radius: 13
                                                    color: bright.second.pressed ? "#83bbde" : "#83bbde"
                                                    border.color: "#83bbde"
                                                }


                                            }



                                            Tumbler {
                                                id: tumblr
                                                Layout.row: 2
                                                Layout.column: 0
                                                Layout.rowSpan: 2
                                                model: 31 // количество записей
                                                anchors.horizontalCenter: selectdata.horizontalCenter
                                                background: Item {
                                                    Rectangle {
                                                        opacity: tumblr.enabled ? 0.2 : 0.1
                                                        border.color: "#83bbde"
                                                        width: parent.width
                                                        height: 1
                                                        anchors.top: parent.top
                                                    }

                                                    Rectangle {
                                                        opacity: tumblr.enabled ? 0.2 : 0.1
                                                        border.color: "#83bbde"
                                                        width: parent.width
                                                        height: 1
                                                        anchors.bottom: parent.bottom
                                                    }
                                                }

                                                delegate: Text {
                                                    text: qsTr("Item %1").arg(modelData + 1)
                                                    font: tumblr.font
                                                    horizontalAlignment: Text.AlignHCenter
                                                    verticalAlignment: Text.AlignVCenter
                                                    opacity: 1.0 - Math.abs(Tumbler.displacement) / (tumblr.visibleItemCount / 2)
                                                }

                                                Rectangle {
                                                    anchors.horizontalCenter: tumblr.horizontalCenter
                                                    y: tumblr.height * 0.4
                                                    width: 40
                                                    height: 1
                                                    color: "#83bbde"
                                                }

                                                Rectangle {
                                                    anchors.horizontalCenter: tumblr.horizontalCenter
                                                    y: tumblr.height * 0.6
                                                    width: 40
                                                    height: 1
                                                    color: "#83bbde"
                                                }

                                            }
                                            BusyIndicator {
                                                id: indic
                                                Layout.row: 2
                                                Layout.column: 1
                                               Layout.alignment: Qt.AlignCenter

                                                contentItem: Item {
                                                    implicitWidth: 64
                                                    implicitHeight: 64

                                                    Item {
                                                        id: item
                                                        x: parent.width / 2 - 32
                                                        y: parent.height / 2 - 32
                                                        width: 64
                                                        height: 64
                                                        opacity: indic.running ? 1 : 0

                                                        Behavior on opacity {
                                                            OpacityAnimator {
                                                                duration: 250
                                                            }
                                                        }

                                                        RotationAnimator {
                                                            target: item
                                                            running: indic.visible && indic.running
                                                            from: 0
                                                            to: 360
                                                            loops: Animation.Infinite
                                                            duration: 1250
                                                        }

                                                        Repeater {
                                                            id: repeater
                                                            model: 6

                                                            Rectangle {
                                                                x: item.width / 2 - width / 2
                                                                y: item.height / 2 - height / 2
                                                                implicitWidth: 10
                                                                implicitHeight: 10
                                                                radius: 5
                                                                color: "#83bbde"
                                                                transform: [
                                                                    Translate {
                                                                        y: -Math.min(item.width, item.height) * 0.5 + 5
                                                                    },
                                                                    Rotation {
                                                                        angle: index / repeater.count * 360
                                                                        origin.x: 5
                                                                        origin.y: 5
                                                                    }
                                                                ]
                                                            }
                                                        }
                                                    }
                                                }
                                            }

                                            Button {
                                                id: but

                                                Layout.row: 4
                                                Layout.column: 1
                                                anchors.top: indic.bottom
                                                anchors.horizontalCenter: indic.horizontalCenter

                                                text: qsTr("Отправить")

                                                contentItem: Text {
                                                    text: but.text
                                                    font: but.font
                                                    opacity: enabled ? 1.0 : 0.3
                                                    color: but.down ? "#001624" : "#83bbde"
                                                    horizontalAlignment: Text.AlignHCenter
                                                    verticalAlignment: Text.AlignVCenter
                                                    elide: Text.ElideRight
                                                }
                                                background: Rectangle {
                                                      implicitWidth: 100
                                                      implicitHeight: 40
                                                      opacity: enabled ? 1 : 0.3
                                                      border.color: but.down ? "#83bbde" : "#001624"
                                                      border.width: 1
                                                      radius: 2
                                                  }
                                              }
                                            }
}










