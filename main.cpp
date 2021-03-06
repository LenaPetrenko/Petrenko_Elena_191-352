#include <QGuiApplication>
#include <QNetworkReply>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include "WebAppController.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    WebAppController webappcontroller;
      QQmlApplicationEngine engine;
      const QUrl url(QStringLiteral("qrc:/main.qml"));

       QQmlContext *context = engine.rootContext();//Контексты позволяют предоставлять данные компонентам QML, созданным механизмом QML
      context->setContextProperty("httpController", &webappcontroller);


   engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
   if (engine.rootObjects().isEmpty())
       return -1;



   QObject::connect(engine.rootObjects().first(), SIGNAL(failed(QString)),
   &webappcontroller, SLOT(failed(QString)));


   QObject::connect(engine.rootObjects().first(), SIGNAL(cancel(QString)),
   &webappcontroller, SLOT(cancel(QString)));



   QObject* main = engine.rootObjects()[0];
    WebAppController sendtoqml(main);
   engine.rootContext()->setContextProperty("_send", &sendtoqml);

    return app.exec();
}



/*#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;                                               // создание объекта движка/интерпретатора QML
    const QUrl url(QStringLiteral("qrc:/main.qml"));                            // задание файла QML-разметки для стартовой страницы окна приложения
    qDebug() << "*** url = " << url;

    // конструкция ниже задаёт связь между событием "objectCreated" объекта "engine"
    // и коллбеком
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app,
                     [url](QObject *obj, const QUrl &objUrl)                    // коллбек, лямбда выражение, т.к. безымянная функция, объявленная по месту
                     {
                        if (!obj && url == objUrl) QCoreApplication::exit(-1);  // действия на случай ошибки внутри движка
                     }, Qt::QueuedConnection);

    engine.load(url);                                                           // загрузить файл стартовой страницы в движок

    return app.exec();                                                          // начало работы приложения, т.е. передача управления
                                                                                // от точки входа коду самого приложения (cpp и qml)
}
*/
/* строение проекта Qt QML:
*.pro - файл настроект системы сборки qmake,
*   - все файлы из дерева проекта
*   перечислены в *.pro, и при удалении из *.pro -файла удаляются из дерева
*   - внешние библиотеки (.lib и .h-файлы) подключаются через *.pro
*   - различие процесса сборки для ОС задаётся в *.pro
*
* main.cpp - точка входа в приложение. А в случае приложения QML в main создаётся
* объект движка-интерпретатора QML-разметки
*
* Как и в любом C++ приложении, в проекте могут быть другие cpp и h файлы
*
* Описание интерфейса приложения и простейших механик его логики содержится в
* файлах QML, которые выполняют роль фронтенда. QML - диалект JS + JSON
*
*
* Структура базовой функции main
*
* .qrc - файл ресурсов, туда помещаются любые некомпилируемые данные:
* изображения, 3D-сетки, аудио и т.д.
**/

/*
 * конфигурация release - только код приложения и ничего лишнего
 * сборка debug больше по объёму, чем release, так как содержит встроенную
 * информацию для привязки полученного машинного кода к исходным строкам кода
 * для возможности работать в отладчике именно с исходным кодом

 * сборка debug больше (в 3 раза и более), медленнее, а также содержит информацию
 * об исходном коде приложения, по которому злоумышненники могут провести реверс-
 * инжиниринг
*/

/*1
 * - отладка C++ кода производится обязателно в конфигурации debug и с запущенным отладчиком (F5 вместо Crtl+R)
 * - кроме того, отладка C++ может произовдиться печатью qDebug() << "Текст"; (не только в debug и не только под отладчиком)
 * отладка QML кода также производится либо отладочной печатью (быстрее) или под отладчиком (тоже конфигурация debug и запуск под F5)
*/

/*2 раскладка по Layouts и Anchors:
 *  если на странице графичеких элементом немного, то можно выравнивать каждый
 *  элемент по границам соседнего:
 *      button.bottom : label.top
 *      button.left : label.right
 *  если элементов больше, их проще расположить в Layout по логике таблицы. Layout
 *  имеет ячейки (GridLayout и по вертикали, и по горизонтали, ColumnLayout только
 *  по вертикали, а RowLayout только по горизонтали)
 *
 *  В компонентах, которые размещены в GridLayout, Rowlayout не работа.т anchors, width, height
 *
 *  можно выделить 4 типа взаимодействия с++ фронтэнда и qml бэкэнд:
 *  1. запуска кода с ++ по событию qml (например по нажатию кнопки)
 *  2. связь реакций qml с каким-либо кодом с++ (например отображение в qml полученного от сервера ответа)
 *  3. обращение к объектам и переменным объявленным в qml из с++
 *  4. обращение к объектам с++ из qml
 *
 *
 *
 *
 *  Для лаб 5
 *  в зоггловке объявл сигнал в разделе signals, котрорый имеет все необходимые параметры, который нужно отправить в qml
 *  предусматр вызов сигнала в нужном месте (например в цикле парсинга) через ключевое слово emit
 *  в qml используем класс connectiolns, прописыва
 *  ем в нет ф-цию обработчик сигнала onExampleCppSignal образована от названия сигнала в плюсах4
 *  в таргет ссылка на объект в которой происходит данный сигнал
 *  4. сделать объект прописанный в таргет который производит сигнал видимым в qml (помистить его в область видимости движка)
 *  для этого в main.cpp после создания движка и объекта до engine.load необходимо вписать
 *
 */
