import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../Items"


Item {
    id: base
    property alias listView: listView
    width: 400
    height: 400

    SkrPane {
        id: pane
        clip: true
        anchors.fill: parent
        padding: 0
        ColumnLayout {
            id: columnLayout
            anchors.fill: parent

            ScrollView {
                focusPolicy: Qt.WheelFocus
                Layout.fillWidth: true
                Layout.fillHeight: true
                focus: true

                ListView {
                    id: listView
                    anchors.fill: parent
                    focus: true
                }
            }
        }
    }
}
