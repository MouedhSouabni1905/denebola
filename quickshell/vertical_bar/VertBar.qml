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
                                // remove this later ======================

                                Column {
                                  anchors.horizontalCenter: parent.horizontalCenter
                                  anchors.verticalCenter: parent.verticalCenter
                                  spacing: 10
                                  Text {
                                    text: "Sidebar"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.italic: true     
                                    color: "red"
                                    font.pixelSize: 10
                                    font.bold: true
                                  }
                                  Text {
                                    text: "is left"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.italic: true     
                                    color: "red"
                                    font.pixelSize: 10
                                    font.bold: true
                                  }
                                  Text {
                                    text: "as an"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.italic: true     
                                    color: "red"
                                    font.pixelSize: 10
                                    font.bold: true
                                  }
                                  Text {
                                    text: "exercise"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.italic: true     
                                    color: "red"
                                    font.pixelSize: 10
                                    font.bold: true
                                  }
                                  Text {
                                    text: "for the"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.italic: true     
                                    color: "red"
                                    font.pixelSize: 10
                                    font.bold: true
                                  }
                                  Text {
                                    text: "student"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.italic: true     
                                    color: "red"
                                    font.pixelSize: 10
                                    font.bold: true
                                  }
                                }
                                // =============================
                                radius: 10
                                width: 500
                                color: "transparent"
                                anchors.fill: parent
                        }
                }

        }

}
