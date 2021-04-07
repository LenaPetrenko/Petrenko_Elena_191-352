#include "WebAppController.h"
#include <QNetworkRequest> // запрос
#include <QNetworkReply> // ответ
#include <QEventLoop> // (вырезка обработки сигнала по месту действия)
#include <QDebug>
#include <QString>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QNetworkAccessManager>
#include <QUrl>



WebAppController::WebAppController(QObject *QMLObject) : pocaz(QMLObject)
{
   temp = new QNetworkAccessManager(this);//создание менеджмент
   connect(temp, &QNetworkAccessManager::finished,
           this, &WebAppController::onPageInfo); //создание соединения сигнала о завершении запроса со слотом
}
void WebAppController::getPageInfo()
{

    QNetworkRequest request; //создание запроса
    request.setUrl(QUrl("https://finance.rambler.ru/currencies/")); //адрес
    qDebug() << request.url();
    QEventLoop evntLoop; //средства входа и выхода в цикл событий
    connect(temp, &QNetworkAccessManager::finished, &evntLoop, &QEventLoop::quit);//создание соединения сигнала о выходе из цикла событий
    QNetworkReply * reply;
    reply = temp->get(request);//получаем возвращаемые данные и записываем их в reply
    evntLoop.exec();//завершение цикла

}
void WebAppController::onPageInfo(QNetworkReply *reply)
{
    QString str = reply->readAll(); // записываем в str сайт
    QObject* moneyd = pocaz->findChild<QObject*>("moneyd"); // ищем элемент
    QObject* moneye = pocaz->findChild<QObject*>("moneye");
    QObject* content = pocaz->findChild<QObject*>("content"); // ищем элемент content, откуда будем брать

    content->setProperty("text", str); // задаем параметр "текст"

    int j = 0;

     if((j = str.indexOf("currency-block__marketplace-value", j)) != -1) // ищем индекс этого тега в тексте
     {
        moneyd->setProperty("text", str.mid( j + 418,7)); // берем 418 символ после тега и 7 символов выводим и записываем в money
        moneye->setProperty("text", str.mid( j + 2250 ,7));
     }

}
bool WebAppController::failed (QString add){

    qDebug() <<  "failed";
    if(add.indexOf("st._hi=") != -1)
    {
        QString pop;
        pop = add.split("st._hi=")[1].split(" ")[0];
          return 1;
    }
    else {
          return 0;
    }
     return 0;
}

bool WebAppController::cancel (QString add){
qDebug() <<  "failedcancel";
    if(add.indexOf("error=") != -1)
    {
      QString pop;
        pop = add.split("error=")[1].split(" ")[0];

       return 1;
    }
    else {
        return 0;
    }
   return 0;
}
