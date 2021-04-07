#ifndef WEBAPPCONTROLLER_H
#define WEBAPPCONTROLLER_H
#include <QNetworkAccessManager>
#include <QObject>
#include <QJsonArray>

class WebAppController : public QObject
{
    Q_OBJECT
public:
    explicit WebAppController(QObject *parent = nullptr);
    QNetworkAccessManager *temp; //определяем переменную nam



signals:
public slots:
    void onPageInfo(QNetworkReply *reply); //определяем функцию onPageInfo
    void getPageInfo();//определяем функцию getPageInfo
         bool failed (QString add);
         bool cancel (QString add);


protected:
    QObject *pocaz;

};

#endif // WEBAPPCONTROLLER_H
/* Директива #ifndef проверяет, определено ли имя WEBAPPCONTROLLER_H, если нет, то управление передаётся директиве #define
 * и определяется интерфейс класса. Если же имя WEBAPPCONTROLLER_H уже определено,
 * управление передаётся директиве #endif. Таким образом, исключается возможность многократного определения класса WEBAPPCONTROLLER_H.
 *
 */
