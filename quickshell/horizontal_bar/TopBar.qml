import Quickshell
import QtQuick
import "../themes"

Scope {
        id: root
        property bool onDate : false

        Time {
                id: timeSource
        }

        Variants {
                model: Quickshell.screens

                PanelWindow {
                        required property var modelData
                        screen: modelData
                        color: "transparent"
                        implicitHeight: 30
                        anchors {
                                top: true
                                left: true
                                right: true
                        }
                        margins {
                                top: 2
                                left: 2
                                right: 2
                                bottom: 2
                        }
                        Rectangle {
                                border {
                                      color: Theme.outerBorders
                                      width: 2
                                }
                                radius: 10
                                width: 500
                                color: Theme.topBarBg
                                anchors.fill: parent
                                Clock {
                                  anchors.centerIn: parent
                                  time: root.onDate ? timeSource.date : timeSource.time
                                  onClicked: root.onDate = !root.onDate
                                }
                        }
                }

        }

}
