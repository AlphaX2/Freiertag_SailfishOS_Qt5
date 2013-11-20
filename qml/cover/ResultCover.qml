import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id: resultCoverPage
    anchors.fill: parent
    color: Theme.secondaryHighlightColor

    property int currentIndex: 0

    function updateCoverText() {
        event.text = freiModel.getResult(currentIndex)[1]
        date.text = freiModel.getResult(currentIndex)[0]
    }

    CoverActionList {
        id: coverEventSwitcher

        CoverAction {
            iconSource:"image://theme/icon-l-left"
            onTriggered: {
                if(currentIndex>0){currentIndex -= 1; updateCoverText()}
            }
        }

        CoverAction {
            iconSource: "image://theme/icon-l-right"
            onTriggered: {
                /*
                Subtract -1 from countRows() because counted rows are 6, but as always:
                counting in the dev world is starting with 0. That means, that currentIndex
                have to be smaller than 5, because the max. is 5!
                */
                if(currentIndex < freiModel.countRows()-1){currentIndex += 1; updateCoverText()}
            }
        }
    }

    PageHeader {
        title: "Freiertag"
    }

    Column {
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        spacing: Theme.paddingMedium

        Label {
            id: event
            x: Theme.paddingSmall
            text: freiModel.getResult(currentIndex)[1]
            font.pixelSize: Theme.fontSizeSmall-5
        }
        Label {
            id: date
            x: Theme.paddingSmall
            text: freiModel.getResult(currentIndex)[0]
            font.pixelSize: Theme.fontSizeExtraSmall-5
        }
    }
}


