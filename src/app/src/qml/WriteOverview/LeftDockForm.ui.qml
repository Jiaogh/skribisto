import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import ".."
import "../Commons"
import "../Items"

Item {
    id: base
    //implicitWidth: 300
    property int fixedWidth: 300
    //property alias dockPane: dockPane
    property alias splitView: splitView
    property alias documentFrame: documentFrame
    property alias documentView: documentView
    property alias navigationFrame: navigationFrame
    property alias navigation: navigation

    SkrPane {
        id: dockPane
        anchors.fill: parent

        ColumnLayout {
            id: columnLayout2
            spacing: 0
            anchors.fill: parent
            Item {
                id: scrollViewBase
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Item {
                    id: foldableScrollViewBase
                    clip: true
                    anchors.fill: parent

                    ScrollView {
                        id: scrollView
                        anchors.fill: parent

                        ScrollBar.vertical.policy: ScrollBar.AlwaysOff


                        Flickable {
                            boundsBehavior: Flickable.StopAtBounds
                            contentWidth: splitView.width
                            contentHeight: splitView.height

                            SplitView {
                                id: splitView
                                orientation: Qt.Vertical
                                implicitWidth: scrollView.width
                                implicitHeight: base.height > 1000 ?  base.height : 1000

                                width: scrollView.width

                                ToolFrame {
                                    id: navigationFrame
                                    folded: false
                                    title: qsTr("Navigation")
                                    edge: Qt.LeftEdge

                                    SplitView.preferredHeight: folded ? dynamicHeight : 500
                                    SplitView.minimumHeight: folded ? dynamicHeight : 400


                                    minimumContentHeight: SplitView.minimumHeight
                                    contentHeight: SplitView.preferredHeight
                                    maximumContentHeight: SplitView.maximumHeight

                                    Layout.minimumWidth: 100

                                    Navigation {
                                        id: navigation
                                        clip: true
                                    }
                                }
                                ToolFrame {
                                    id: documentFrame
                                    folded: true
                                    title: qsTr("Opened documents")
                                    edge: Qt.LeftEdge

                                    SplitView.preferredHeight: folded ? dynamicHeight : 500
                                    SplitView.minimumHeight: folded ? dynamicHeight : 400


                                    minimumContentHeight: SplitView.minimumHeight
                                    contentHeight: SplitView.preferredHeight
                                    maximumContentHeight: SplitView.maximumHeight



                                    DocumentListView {
                                        id: documentView
                                        clip: true
                                    }
                                }

                                //                            Loader{
                                //                                id: writeTreeViewHeader
                                //                                sourceComponent: toolHeaderComp
                                //                                width: scrollview.contentWidth
                                //                                property string headerText: qsTr("Navigation")

                                //                            }
                                //                            WriteTreeView {
                                //                                id: writeTreeView
                                //                                width: scrollview.contentWidth
                                //                                height: 600

                                //                            }
                                //                            Loader{
                                //                                id: toolsHeader
                                //                                sourceComponent: toolHeaderComp
                                //                                width: scrollview.contentWidth
                                //                                property string headerText: qsTr("Tools")

                                //                            }
                                //                            Flow{
                                //                                width: scrollview.contentWidth

                                //                                SkrToolButton {
                                //                                    flat: true
                                //                                    action: fullscreenAction

                                //                                }
                                //                                SkrToolButton {
                                //                                    flat: true
                                //                                    action: fullscreenAction
                                //                                }
                                //                                SkrToolButton {
                                //                                    flat: true
                                //                                    action: fullscreenAction
                                //                                }
                                //                                SkrToolButton {
                                //                                    flat: true
                                //                                    action: fullscreenAction
                                //                                }
                                //                            }
                            }
                            //contentWidth: width

                            //                    ColumnLayout {
                            //                        id: columnLayout
                            //                        //width: scrollview.contentWidth

                            //                        Component{
                            //                            id: toolHeaderComp
                            //                            RowLayout {

                            //                                Text{
                            //                                    id: headerText

                            //                                }
                            //                            }

                            //                        }
                            //                        Loader{
                            //                            id: writeTreeViewHeader
                            //                            sourceComponent: toolHeaderComp
                            //                            //Layout.fillWidth: true
                            //                            property string headerText: qsTr("Navigation")

                            //                        }
                            //                        WriteTreeView {
                            //                            Layout.fillWidth: true
                            //                            Layout.fillHeight: true

                            //                        }

                            //                    }

                            //                    //                        Rectangle {
                            //                    //                            id: rectangle
                            //                    //                            width: 200
                            //                    //                            height: 200
                            //                    //                            color: "#ff1b1b"
                            //                    //                            Layout.fillWidth: true
                            //                    //                        }

                            //                }
                        }
                    }
                }
            }
        }
    }

    states: [
        State {
            name: "dockFolded"

            PropertyChanges {
                target: base
                implicitWidth: 0
            }
            //            PropertyChanges {
            //                restoreEntryValues: true
            //                target: base
            //                implicitWidth: 0

            //            }
        },
        State {
            name: "dockUnfolded"

            PropertyChanges {
                target: base
                implicitWidth: fixedWidth
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

