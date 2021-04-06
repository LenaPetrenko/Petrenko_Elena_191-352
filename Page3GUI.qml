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


}
