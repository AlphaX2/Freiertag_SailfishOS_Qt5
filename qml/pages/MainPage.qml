import QtQuick 2.0
import Sailfish.Silica 1.0
import "../cover"

Page {
    id: pageMain

    Component.onCompleted: {

        //////// TODO //////////////
        //Save last selection and set loaded values here!

        // for bundeslandSelect it throws an error msg but still works as expected
        startCover.bland = bundeslandSelect.model.get(bundeslandSelect.currentIndex).name
        startCover.jahr = jahrSelect.model.get(jahrSelect.currentIndex).name
        startCover.type = typeSelect.model.get(typeSelect.currentIndex).name
    }

    onStatusChanged: {
        if(status === PageStatus.Active){mainApplicationWindow.cover = startCover}
    }
    
    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent
        
        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "Über"
                onClicked: pageStack.push("AboutDialog.qml")
            }
            MenuItem {
                text: "Suchen"
                onClicked: {
                    // get the selected values
                    var bland = bundeslandSelect.value
                    var jahr = jahrSelect.value
                    var type = typeSelect.value

                    /*
                    you have to replace ü and - here in QML,
                    if you pass them to Qt/C++, it's much
                    harder to replace them correctly.
                     */
                    bland = bland.replace("ü","ue")
                    bland = bland.replace("-","_")

                    // parses the results and populates the model
                    // it's true if everything went fine, also it's finished when true
                    var ret = frei.suche(bland, jahr, type)

                    // if true the model is ready - now you can push to resultPage without any doubts
                    if(ret){
                        resultPage.headerTitle = jahrSelect.value+" | "+bundeslandSelect.value
                        pageStack.push(resultPage)
                        mainApplicationWindow.cover = Qt.resolvedUrl("/usr/share/Freiertag/qml/cover/ResultCover.qml")
                    }
                }
            }
        }
        
        // Tell SilicaFlickable the height of its content.
        contentHeight: childrenRect.height
        
        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            width: pageMain.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Freiertag"
            }

            ComboBox {
                id: bundeslandSelect

                width: parent.width
                label: "Bundesland:"

                menu: ContextMenu {
                    MenuItem {
                        text: "Baden-Württemberg"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall-7
                        }
                    }
                    MenuItem {
                        text: "Bayern"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Berlin"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Brandenburg"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Bremen"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Hamburg"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Hessen"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Mecklenburg-Vorpommern"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall-10
                        }
                    }
                    MenuItem {
                        text: "Niedersachsen"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Nordrhein-Westfalen"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Rheinland-Pfalz"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Saarland"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Sachsen"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Sachsen-Anhalt"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Schleswig-Holstein"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "Thüringen"
                        onClicked: {
                            startCover.bland = text
                            startCover.blandFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                }
            }

            ComboBox {
                id: jahrSelect

                label: "Jahr:"

                menu: ContextMenu {
                    MenuItem {
                        text: "2013"
                        onClicked: {startCover.jahr = text}
                    }
                    MenuItem {
                        text: "2014"
                        onClicked: {startCover.jahr = text}
                    }
                    MenuItem {
                        text: "2015"
                        onClicked: {startCover.jahr = text}
                    }
                }
            }

            ComboBox {
                id: typeSelect
                label: "Ferien:"
                menu: ContextMenu {
                    MenuItem {
                        text: "Schulferien"
                        onClicked: {
                            startCover.type = text
                            startCover.typeFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "alle Feiertage"
                        onClicked: {
                            startCover.type = text
                            startCover.typeFontSize = Theme.fontSizeExtraSmall
                        }
                    }
                    MenuItem {
                        text: "gesetzliche Feiertage"
                        onClicked: {
                            startCover.type = text
                            startCover.typeFontSize = Theme.fontSizeExtraSmall-5
                        }
                    }
                }
            }
        }
    }
}


