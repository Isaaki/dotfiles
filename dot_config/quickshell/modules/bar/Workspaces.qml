import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland // for PanelWindow

RowLayout {
    id: row

    anchors {
        left: parent.left
        verticalCenter: parent.verticalCenter
        // fill: parent
    }

    spacing: 0

    Repeater {
        id: workspaceRepeater
        model: Hyprland.workspaces

        Layout.fillHeight: true
        Layout.maximumWidth: 40

        Rectangle {
            id: workspaceButton

            Layout.alignment: Qt.AlignVCenter

            implicitHeight: bar.height
            implicitWidth: bar.height
            radius: 4

            property bool hovered: false

            color: hovered ? Qt.lighter(modelData.id === Hyprland.focusedWorkspace.id ? "#444" : bar.color, 1.4) : modelData.id === Hyprland.focusedWorkspace.id ? "#444" : bar.color

            MouseArea {
                hoverEnabled: true
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onClicked: modelData.activate()
                onEntered: workspaceButton.hovered = true
                onExited: workspaceButton.hovered = false
            }

            Text {
                id: workspaceText
                text: modelData.id
                color: "#aaa"
                font.pixelSize: 14
                font.family: "JetBrainsMonoNL Nerd Font"
                font.styleName: "SemiBold"

                // height: bar.height * 2

                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    // Connections {
    //     target: Hyprland
    //     property string strId: ""

    //     function onRawEvent(event) {
    //         if (event.name === "workspace" || event.name === "focusedmon") {
    //             Hyprland.refreshWorkspaces();
    //         }
    //     }
    // }
}
