import qs.vertical_bar
import qs.horizontal_bar
import Quickshell

ShellRoot {

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


  TopBar {}
  VertBar {}
}
