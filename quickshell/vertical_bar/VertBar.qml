import Quickshell
import QtQuick
import "../themes"

Scope {
        id: root

        Variants {
                model: Quickshell.screens

                PanelWindow {
                        required property var modelData
                        screen: modelData
                        
                        color: "Transparent"

                        anchors {
                                top: true
                                left: true
                                right: false
                                bottom: true
                        }

                        margins {
                                top: 2
                                left: 2
                                right: 2
                                bottom: 2
                        }

                        implicitWidth: 50

                        Rectangle {
                                border {
                                      color: Theme.outerBorders
                                      width: 2
                                }
                                radius: 10
                                width: 500
                                color: Theme.topBarBg
                                anchors.fill: parent
                        }
                }

        }

}
