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

              GridLayout {
                  anchors.fill: parent
                  anchors.margins: 10
                  columns: 2


                  Button {
                      Layout.column: 0
                      Layout.row: 0
                      id: sent
                      text: qsTr("Отправить Запрос")
                      Layout.alignment: Qt.AlignCenter
                      Layout.columnSpan: 2
                      onClicked: {
                          _send.getPageInfo();
                      }

                      contentItem: Text {
                          text: sent.text
                          font: sent.font
                          opacity: enabled ? 1.0 : 0.3
                          color: sent.down ? "#001624" : "#83bbde"
                          horizontalAlignment: Text.AlignHCenter
                          verticalAlignment: Text.AlignVCenter
                          elide: Text.ElideRight
                      }

                      background: Rectangle {
                          implicitWidth: 100
                          implicitHeight: 40
                          opacity: enabled ? 1 : 0.3
                          border.color: sent.down ? "#83bbde" : "#001624"
                          border.width: 1
                          radius: 2
                      }
                  }


                  ScrollView {
                      Layout.fillHeight: true
                      Layout.columnSpan: 2
                      Layout.fillWidth: true
                      Layout.column: 0
                      Layout.row: 1

                      clip:  true
                      TextArea{
                          id: content
                          textFormat: Text.RichText //формат текста
                          objectName: "content"
                          readOnly: true//только чтение
                          anchors.fill: parent

                          background: Rectangle {
                              id: rectangle
                              anchors.fill: parent
                              Image {
                                  id: fonImage
                                  anchors.fill: parent
                                  source: "qrc:/image/new_fon1.jpg"

                              }
                          }
                      }
                  }

                  Label {
                      Layout.alignment: Qt.AlignCenter
                      Layout.column: 0
                      Layout.row: 2
                      text: "Текущий курс $:"
                      color: "#83bbde"
                  }
                  Label {
                      Layout.alignment: Qt.AlignCenter
                      Layout.column: 1
                      Layout.row: 2
                      text: "Текущий курс €:"
                      color: "#83bbde"
                  }

                      Label {
                          Layout.column: 0
                          Layout.row: 3
                          id: moneyd
                          objectName: "moneyd"
                          color: "#83bbde"
                          Layout.alignment: Qt.AlignCenter

                      }
                      Label {
                          id: moneye
                          Layout.column: 1
                          Layout.row: 3
                          objectName: "moneye"
                          color: "#83bbde"
                          Layout.alignment: Qt.AlignCenter
                      }
                  }



            }

