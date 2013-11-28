import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "cover"

ApplicationWindow
{
    id: mainApplicationWindow

    MainPage {id: mainPage}
    StartCover {id: startCover}
    ResultPage {id: resultPage}

    initialPage: mainPage
    cover: startCover
}


