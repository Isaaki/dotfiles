import QtQuick
import Quickshell
import Quickshell.Hyprland // for PanelWindow

Row {
    id: workspacesRow

    property string textColor: "#aaa"
    property string backgroundColor: bar.color

    anchors {
        left: parent.left
        verticalCenter: parent.verticalCenter
        leftMargin: 0
    }

    spacing: 2

    Repeater {
        model: Hyprland.workspaces

        Rectangle {
            anchors {
                verticalCenter: parent.verticalCenter
            }

            width: 24
            height: 32

            radius: 12
            color: modelData.focused ? "#444" : backgroundColor

            MouseArea {
                hoverEnabled: true
                anchors.fill: parent
                onClicked: Hyprland.dispatch(`workspace ${modelData.id}`)
                onEntered: {
                    parent.color = "#222";
                    workspaceText.color = "#fff";
                }
                onExited: {
                    parent.color = modelData.focused ? "#444" : bar.color;
                    workspaceText.color = "#aaa";
                }
                cursorShape: Qt.PointingHandCursor
            }

            Text {
                id: workspaceText
                text: modelData.id
                color: textColor
                font.pixelSize: 14

                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    Text {
        visible: Hyprland.workspaces.length === 0
        text: "No workspaces"
        color: "#fff"
        font.pixelSize: 14
    }
}
