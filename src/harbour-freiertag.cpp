#include <QtQuick>
#include <sailfishapp.h>
#include "FreiertagCom.hpp"
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication *app = SailfishApp::application(argc, argv);
    QQuickView *view = SailfishApp::createView();

    //create a new ListModel for the results
    FreiListModel *freiModel = new FreiListModel();
    //create a new instance of our object that is doing the most work
    FreiertagCom *frei = new FreiertagCom(freiModel);

    view->rootContext()->setContextProperty("frei", frei);
    view->rootContext()->setContextProperty("freiModel", freiModel);
    view->setSource(SailfishApp::pathTo("qml/harbour-freiertag.qml"));
    view->showFullScreen();

    return app->exec();
}


