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

Scope {

        
// ==================== BAR SHADOW ====================
  Loader {
    sourceComponent: WlrLayershell {
      id: barShadow
      margins { 
        top: barMarginTop + shadowOffsetY
        left: barMarginLeft + shadowOffsetX
      }
      anchors { top: true; left: true; right: true; }
      layer: WlrLayer.Bottom
      width: bar.width + 8
      height: bar.height + 10
      color: "transparent"
      TopBar {}
// ignore this, it just does smth cool
      //Repeater {
        //model: [
          //{ size: 0, opacity: 0.3, radius: 8 },
          //{ size: 2, opacity: 0.33, radius: 8 },
          //{ size: 4, opacity: 0.4, radius: 8 }
        //]
 // ===============================       
      //}
    }
  }

        VertBar {}

}
