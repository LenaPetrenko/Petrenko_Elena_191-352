import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Tabs")


    /* 1.1.объявить сигнал в qml проще всего в главном окне
    * 1.2. Оьъевить в некоторм классе с++ функцию-слот, которая вызывается в ответ на сигнал
    * 1.3 привязать слот к сгналу
    */



    SwipeView {
        id: swipeView //пишется с маленькой буквы
        anchors.fill: parent
        currentIndex: tabBar.currentIndex


        Page1GUI { //ЛР1 ознакомление

        }
        Page2GUI{ //ЛР2

        }
        Page3GUI{ //ЛР3

        }
        Page{

        }
}

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex


        TabButton { //создание кнопки lab1
            Text{
                                 text:"Lab1"
                                 color:"#83bbde"
                                 font.pixelSize: 17
                                 font.family: "Arial"
                                 anchors.horizontalCenter: parent.horizontalCenter
                                 anchors.verticalCenter: parent.verticalCenter
                             }
                             background: Rectangle {
                                 color: "#001624"

                                }

        }
        TabButton { //создание кнопки lab2
                          Text{
                              text:"Lab2"
                              color:"#83bbde"
                              font.family: "Arial"
                              font.pixelSize: 17
                              anchors.horizontalCenter: parent.horizontalCenter
                              anchors.verticalCenter: parent.verticalCenter
                          }
                          background: Rectangle {

                              color: "#001624"
                              }
                      }
        TabButton { //создание кнопки lab3
                           Text{
                               text:"Lab3"
                               color:"#83bbde"
                               font.family: "Arial"
                               font.pixelSize: 17
                               anchors.horizontalCenter: parent.horizontalCenter
                               anchors.verticalCenter: parent.verticalCenter
                           }
                           background: Rectangle {
                               color: "#001624"
                               }

                       }

    }
}
