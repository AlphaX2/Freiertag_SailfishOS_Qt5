# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed

TARGET = harbour-freiertag

#CONFIG += sailfishapp

# Start of temporary fix for the icon for the Nov 2013 harbour requirements
QT += quick qml

target.path = /usr/bin

qml.files = qml
qml.path = /usr/share/$${TARGET}

desktop.files = $${TARGET}.desktop
desktop.path = /usr/share/applications

icon.files = $${TARGET}.png
icon.path = /usr/share/icons/hicolor/86x86/apps

INSTALLS += target qml desktop icon

CONFIG += link_pkgconfig
PKGCONFIG += sailfishapp
INCLUDEPATH += /usr/include/sailfishapp

OTHER_FILES += $$files(rpm/*)
# End of nov 2013 fix

HEADERS += \
    src/FreiListModel.hpp \
    src/FreiertagCom.hpp

SOURCES += \
    src/FreiListModel.cpp \
    src/FreiertagCom.cpp \
    src/harbour-freiertag.cpp

OTHER_FILES += \
    qml/pages/ResultPage.qml \
    qml/pages/MainPage.qml \
    qml/pages/AboutDialog.qml \
    data/2013/ferien/* \
    data/2013/feiertage/* \
    data/2014/ferien/* \
    data/2014/feiertage/* \
    data/2015/ferien/* \
    data/2015/feiertage/* \
    qml/cover/ResultCover.qml \
    qml/cover/StartCover.qml \
    qml/harbour-freiertag.qml \
    harbour-freiertag.desktop \
    rpm/harbour-freiertag.yaml \
    rpm/harbour-freiertag.spec

# define data for 2013
ferien2013.path = /usr/share/harbour-freiertag/data/2013/ferien
ferien2013.files += data/2013/ferien/*.ics
feiertage2013.path = /usr/share/harbour-freiertag/data/2013/feiertage
feiertage2013.files += data/2013/feiertage/*.ics

# define data for 2014
ferien2014.path = /usr/share/harbour-freiertag/data/2014/ferien
ferien2014.files += data/2014/ferien/*.ics
feiertage2014.path = /usr/share/harbour-freiertag/data/2014/feiertage
feiertage2014.files += data/2014/feiertage/*.ics

# define data for 2015
ferien2015.path = /usr/share/harbour-freiertag/data/2015/ferien
ferien2015.files += data/2015/ferien/*.ics
feiertage2015.path = /usr/share/harbour-freiertag/data/2015/feiertage
feiertage2015.files += data/2015/feiertage/*.ics

INSTALLS += ferien2013
INSTALLS += feiertage2013

INSTALLS += ferien2014
INSTALLS += feiertage2014

INSTALLS += ferien2015
INSTALLS += feiertage2015

