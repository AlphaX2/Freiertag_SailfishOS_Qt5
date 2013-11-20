import QtQuick 2.0
import Sailfish.Silica 1.0
import "../cover"

Page {
    id: pageResult

    property string headerTitle
    property alias model: listView.model

    /*
    The model will be set from MainPage via property alias.
    Look there for some information about the reason.
    */
    SilicaListView {
        id: listView
        anchors.fill: parent
        spacing: Theme.paddingMedium
        header: PageHeader {
            title: headerTitle
        }

        VerticalScrollDecorator { flickable: listView }

        delegate: BackgroundItem {
            Column {
                width: pageResult.width
                height: childrenRect.height

                Label {
                    x: Theme.paddingMedium
                    color: Theme.highlightColor
                    text: holidayEvent
                    font.pixelSize: Theme.fontSizeSmall
                }
                Label {
                    x: Theme.paddingLarge
                    text: holidayDate
                }
                // just win some space
                Item {
                    x: Theme.paddingLarge
                    width: pageResult.width
                    height: 20
                }
            }
        }
    }    
}
