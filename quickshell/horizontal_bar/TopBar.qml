import Quickshell
import QtQuick
import qs.themes
import Quickshell.Wayland

import Quickshell
import QtQuick
import qs.themes
import Quickshell.Wayland
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

Scope {
        id: root
        property bool onDate : false
//
        Time {
                id: timeSource
        }
//
        Variants {
                model: Quickshell.screens

                PanelWindow {
                        required property var modelData
                        screen: modelData
                        
                        color: "Transparent"

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

                        implicitHeight: 30

                        Rectangle {
                                border {
                                      color: Theme.outerBorders
                                      width: 1
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
        //WlrLayershell {
                        //id: bar
                        //layer: WlrLayer.Top
                        //color: "transparent"
                        //implicitHeight: 30
                        //anchors {
                                //top: true
                                //left: true
                                //right: true
                        //}
                        //margins {
                                //top: 4
                                //left: 2
                                //right: 6
                                //bottom: 4
                              //}


                              //Rectangle {
                                          //id: barRect
                                          //radius: 10
                                          //color: Theme.topBarBg
                                          ////anchors.fill: parent
                                          //anchors {
                                                  //top: true
                                                  //left: true
                                                  //right: true
                                          //}
                                          //Clock {
                                                    //anchors.centerIn: parent
                                                    //time: root.onDate ? timeSource.date : timeSource.time
                                                    //onClicked: root.onDate = !root.onDate
                                          //}
                                //}
                //}

}
