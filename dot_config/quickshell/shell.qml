//@ pragma UseQApplication
import QtQuick
import Quickshell // for PanelWindow
import "modules/bar"

ShellRoot {
    id: root

    Loader {
        active: true
        sourceComponent: Bar {}
    }
}
