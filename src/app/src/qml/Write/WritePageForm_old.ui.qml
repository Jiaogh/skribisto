import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    id: base
    property alias writingZone: writingZone
    property alias base: base
    property alias pane: pane
    width: 1000
    height: 600
    property alias leftDock: leftDock
    property alias resizeHandle: resizeHandle
    property alias resizeHandleMouseArea: resizeHandleMouseArea

    Pane {
        id: pane
        padding: 3
        anchors.fill: parent

        RowLayout {
            id: rowLayout
            spacing: 0
            anchors.fill: parent

            WritingZone {
                id: writingZone
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }

        WriteLeftDock {
            id: leftDock
            z: 1
            anchors.right: parent.left
            //anchors.bottom: leftDock.folded ? parent.bottom : undefined
            anchors.left: parent.left
            anchors.top: parent.top
        }

        Rectangle {
            id: resizeHandle
            color: "transparent"
            z: 1
            anchors.leftMargin: writingZone.textAreaLeftPos - 3
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.rightMargin: -writingZone.textAreaLeftPos
            anchors.right: parent.left

            MouseArea {
                id: resizeHandleMouseArea
                anchors.fill: parent
                hoverEnabled: true
            }
        }
    }
}












/*##^## Designer {
    D{i:9;anchors_height:200;anchors_width:200}D{i:8;anchors_height:200;anchors_width:200}
}
 ##^##*/
