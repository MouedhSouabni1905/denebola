import Quickshell
import QtQuick
import qs.themes
import Quickshell.Wayland

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
                        // ==================== BAR SHADOW ====================
                                Loader {
                                          sourceComponent: WlrLayershell {
                                                    id: barShadow
                                                    margins { 
                                                      top: 2
                                                      left: 2
                                                      right: 2
                                                      bottom:2
                                                    }
                                                    anchors { top: true; left: true; right: true; }
                                                    layer: WlrLayer.Bottom
                                                    width: bar.width + 8
                                                    height: bar.height + 10
                                                    color: "transparent"
                                                    Repeater {
                                                      model: [
                                                        { size: 0, opacity: 0.3, radius: 8 },
                                                        { size: 2, opacity: 0.33, radius: 8 },
                                                        { size: 4, opacity: 0.4, radius: 8 }
                                                      ]
                                                      Rectangle {

                                                        anchors.centerIn: parent
                                                        width: parent.width
                                                        height: 30
                                                        color: Theme.outerBorders
                                                        opacity: 0.5
                                                        radius: 10
                                                      }
                                                    }
                                          }
                                }
                                Rectangle {
                                          height: 28
                                          anchors {
                                                    topMargin: 2
                                                    leftMargin: 2
                                                    rightMargin: 2
                                                    bottomMargin: 2
                                          }
                                          radius: 10
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
