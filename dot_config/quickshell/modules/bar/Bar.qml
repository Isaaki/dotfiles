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

            implicitHeight: 26
            color: "#1a1a1a"

            ClockWidget {
                anchors.centerIn: parent
                color: "#DDD"
            }

            Workspaces {}

            WLogout {
                LogoutButton {
                    command: "loginctl lock-session"
                    keybind: Qt.Key_K
                    text: "Lock"
                    icon: "lock"
                }

                LogoutButton {
                    command: "loginctl terminate-user $USER"
                    keybind: Qt.Key_E
                    text: "Logout"
                    icon: "logout"
                }

                LogoutButton {
                    command: "systemctl suspend"
                    keybind: Qt.Key_U
                    text: "Suspend"
                    icon: "suspend"
                }

                LogoutButton {
                    command: "systemctl hibernate"
                    keybind: Qt.Key_H
                    text: "Hibernate"
                    icon: "hibernate"
                }

                LogoutButton {
                    command: "systemctl poweroff"
                    keybind: Qt.Key_K
                    text: "Shutdown"
                    icon: "shutdown"
                }

                LogoutButton {
                    command: "systemctl reboot"
                    keybind: Qt.Key_R
                    text: "Reboot"
                    icon: "reboot"
                }
            }
        }
    }
}
