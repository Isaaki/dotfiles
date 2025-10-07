import QtQuick
import Quickshell // for PanelWindow
import Quickshell.Hyprland // for PanelWindow

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            required property var modelData

            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }
            margins {
                top: 0
                left: 0
                right: 0
            }

            implicitHeight: 20
            color: "#1a1a1a"

            ClockWidget {
                anchors.centerIn: parent
                color: "#DDD"
            }

            Workspaces {}
        }
    }
}
