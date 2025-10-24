import qs.vertical_bar
import QtQuick.Shapes
import QtQuick
import qs.horizontal_bar
import Quickshell
import Quickshell.Wayland

import qs.vertical_bar
import qs.horizontal_bar
import Quickshell
import QtQuick
import qs.themes
import Quickshell.Wayland

ShellRoot {
  id: root
  TopBar {}
  VertBar {}
  //Loader {
            //active: true
//            sourceComponent: WlrLayershell {
//              id: barShadow
//
//                      margins { 
//                        top: -36
//                      }
//                      anchors {left: true; top: true; }
//                      layer: WlrLayer.Bottom
//                      // width: TopBar.width + 8 // hardcode for now
//                      // height: TopBar.height + 10
//                      height: 34    // tweak
//                      width: 1222  // tweak
//                      color: "transparent"
//                      Repeater {
//                        model: [
//                          { size: 0, opacity: 0.3, radius: 8 },
//                          { size: 2, opacity: 0.33, radius: 8 },
//                          { size: 4, opacity: 0.4, radius: 8 }
//                        ]
//                        Rectangle {
//                          width: parent.width
//                          height: parent.height
//                          anchors.centerIn: parent
//                          color: Theme.outerBorders
//                          opacity: 0.6
//                          radius: 10
//                        }
//                      }
//            }
//  }
//
//
}
