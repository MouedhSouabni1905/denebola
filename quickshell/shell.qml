import Quickshell
import "horizontal_bar"
import "vertical_bar"
import QtQuick.Shapes
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Io
import Quickshell.Hyprland
import Qt5Compat.GraphicalEffects
import Quickshell.Widgets
import Quickshell.Wayland
import QtQuick.Window
import Quickshell.Services.UPower
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire
import Quickshell.Services.Mpris

ShellRoot {
  // ==================== BAR SHADOW ====================
  Loader {
    sourceComponent: WlrLayershell {
      id: barShadow
      margins { 
        top: 2
        left: 2
        right: 2
        bottom: 2
      }
      anchors { top: true; left: true; right:true; }
      layer: WlrLayer.Bottom
      height: 30
      color: "transparent"
      // ignore this, it just does smth cool
      Repeater {
        model: [
          { size: 0, opacity: 0.3, radius: 8 },
          { size: 2, opacity: 0.33, radius: 8 },
          { size: 4, opacity: 0.4, radius: 8 }
        ]
        // ===============================       
        Rectangle {

          anchors.centerIn: parent
          width: parent.width
          height: parent.height
          opacity: 0.2
          radius: 10
        }
      }
    }
  }
  TopBar {}
  VertBar {}
}
