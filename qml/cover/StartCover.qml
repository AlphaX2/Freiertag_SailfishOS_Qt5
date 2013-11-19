import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id: coverPage
    anchors.fill: parent
    color: Theme.secondaryHighlightColor

    property alias bland: bland.text
    property alias blandFontSize: bland.font.pixelSize
    property alias jahr: jahr.text
    property alias jahrFontSize: jahr.font.pixelSize
    property alias type: type.text
    property alias typeFontSize: type.font.pixelSize

    PageHeader {
        title: "Freiertag"
    }

    Column {
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        spacing: Theme.paddingLarge

        Label {
            id: bland
            x: Theme.paddingMedium
            text: "Baden-Württemberg"
            font.pixelSize: Theme.fontSizeExtraSmall-7
        }
        Label {
            id: jahr
            x: Theme.paddingMedium
            text: "2013"
            font.pixelSize: Theme.fontSizeExtraSmall
        }
        Label {
            id: type
            x: Theme.paddingMedium
            text: "Schulferien"
            font.pixelSize: Theme.fontSizeExtraSmall
        }
    }
}


