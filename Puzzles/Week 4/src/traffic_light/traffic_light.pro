TEMPLATE = app

QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
    traffic_light.cpp \
    light.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    traffic_light.h \
    light.h
