import Quickshell
import QtQuick
import qs.themes

Scope {
        id: barScope

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
                                      color: "red"
                                      width: 1
                                }
                                radius: 10
                                width: 500
                                color: "transparent"
                                anchors.fill: parent
                        }
                }

        }

}
