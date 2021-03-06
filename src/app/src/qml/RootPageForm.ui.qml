import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

import "Items"
import "WriteOverview"
import "Welcome"
import "NoteOverview"
import "Gallery"
import "Projects"

//import "Write"
//import "Note"

//import QtGraphicalEffects 1.0
Item {
    id: rootPageBase
    //property variant window: none
    property alias rootPageBase: rootPageBase
    property alias notificationButton: notificationButton
    property alias rootSwipeView: rootSwipeView
    property alias rootTabBar: rootTabBar
    property alias welcomeTab: welcomeTab
    property alias writeOverviewTab: writeOverviewTab
    property alias projectTab: projectTab
    //NOTE: waiting to be implemented
    //property alias galleryTab: galleryTab
    property alias noteOverviewTab: noteOverviewTab
    property alias welcomePage: welcomePage
    property alias noteOverviewPage: noteOverviewPage
    //NOTE: waiting to be implemented
    //property alias galleryPage: galleryPage
    property alias projectsMainPage: projectsMainPage
    property alias writeOverviewPage: writeOverviewPage
    property alias saveButton: saveButton
    property alias tabBarRevealer: tabBarRevealer
    property alias mainMenuButton: mainMenuButton
    property alias showTabListButton: showTabListButton
    property alias headerRowLayout: headerRowLayout
    property alias statusLeftLabel: statusLeftLabel
    property alias statusRightLabel: statusRightLabel

    ColumnLayout {
        id: columnLayout
        spacing: 1
        anchors.fill: parent

        RowLayout {
            id: headerRowLayout
            width: 100
            height: 100
            spacing: 0
            Layout.preferredHeight: 30
            Layout.fillWidth: true


            SkrToolButton {
                id: mainMenuButton
                text: qsTr("Main menu")
                focusPolicy: Qt.NoFocus
                padding: 2
                display: AbstractButton.IconOnly
                Layout.preferredHeight: 30
                Layout.preferredWidth: 30
                checkable: true
                flat: true
            }




            TabBar {
                id: rootTabBar
                //Layout.preferredHeight: 40
                Layout.minimumHeight: 30
                Layout.fillWidth: true
                Material.background: SkrTheme.pageBackground

                Tab {
                    id: welcomeTab
                    closable: false
                    pageType: welcomePage.pageType
                    iconColor: "transparent"
                }
                Tab {
                    id: writeOverviewTab
                    closable: false
                    pageType: writeOverviewPage.pageType
                    iconColor:  SkrTheme.buttonIcon
                }
                Tab {
                    id: noteOverviewTab
                    closable: false
                    pageType: noteOverviewPage.pageType
                    iconColor:  SkrTheme.buttonIcon
                }
                //NOTE: waiting to be implemented
//                Tab {
//                    id: galleryTab
//                    closable: false
//                    pageType: galleryPage.pageType
//                    iconColor:  SkrTheme.buttonIcon
//              }
                Tab {
                    id: projectTab
                    closable: false
                    pageType: projectsMainPage.pageType
                    iconColor:  SkrTheme.buttonIcon
                }
            }


            SkrToolButton {
                id: showTabListButton
                text: qsTr("Show list of tabs")
                flat: true
                checkable: true
                focusPolicy: Qt.NoFocus
                padding: 2
                display: AbstractButton.IconOnly
                Layout.preferredHeight: 30
                Layout.preferredWidth: 30
            }
        }

        Item {
            id: tabBarRevealer
            visible: false
            Layout.minimumHeight: 5
            Layout.preferredHeight: 5
            Layout.fillWidth: true
        }

        RowLayout {
            id: rowLayout
            spacing: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true

                ColumnLayout {
                    z: 0
                    anchors.fill: parent

                    //                            TabBar {
                    //                                id: bar
                    //                                position: TabBar.Header
                    //                                wheelEnabled: true
                    //                                Layout.fillHeight: false
                    //                                Layout.fillWidth: true
                    //                                SkrTabButton {
                    //                                    text: qsTr("Welcome")
                    //                                    width: implicitWidth
                    //                                }
                    //                                SkrTabButton {
                    //                                    text: qsTr("Write")
                    //                                    width: implicitWidth
                    //                                }
                    //                                SkrTabButton {
                    //                                    text: qsTr("Note")
                    //                                    width: implicitWidth
                    //                                }
                    //                                SkrTabButton {
                    //                                    text: qsTr("Gallery")
                    //                                    width: implicitWidth
                    //                                }
                    //                                SkrTabButton {
                    //                                    text: qsTr("Informations")
                    //                                    width: implicitWidth
                    //                                }
                    //                            }
                    SwipeView {
                        id: rootSwipeView
                        clip: true
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        WelcomePage {
                            id: welcomePage
                        }

                        WriteOverviewPage {
                            id: writeOverviewPage
                            enabled: false
                        }

                        NoteOverviewPage {
                            id: noteOverviewPage
                            enabled: false
                        }

                        //NOTE: waiting to be implemented
//                        GalleryPage {
//                            id: galleryPage
//                            enabled: false
//                            visible: false
//                        }

                        ProjectsMainPage {
                            id: projectsMainPage
                            enabled: false
                        }

                        //                        WritePage {
                        //                            id: writePage
                        //                        }

                        //                                                NotePage {
                        //                                                    id: notePage

                        //                                                }
                    }
                    //        PageIndicator {
                    //            id: indicator
                    //                        Layout.fillHeight: false
                    //                        Layout.fillWidth: true
                    //            count: view.count
                    //            currentIndex: view.currentIndex

                    //        }
                }
            }

            //    Rectangle {
            //        color: "transparent"
            //        border.color: "darkorange"
            //        anchors.fill: parent
            //    }
        }

        SkrPane {
            id: statusBar
            Layout.preferredHeight: 30
            visible: true
            Layout.fillWidth: true
            padding: 0

            RowLayout {
                id: rowLayout1
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.topMargin: 0
                spacing: 0

                SkrToolButton {
                    id: saveButton
                    flat: true
                    text: qsTr("Save")
                    padding: 0
                    Layout.preferredHeight: 30
                    Layout.preferredWidth: 30
                    focusPolicy: Qt.NoFocus
                    display: AbstractButton.IconOnly
                    icon.color: SkrTheme.buttonIcon
                }

                SkrLabel {
                    id: statusLeftLabel
                    verticalAlignment: Text.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                SkrLabel {
                    id: statusRightLabel
                    text: qsTr("Label")
                    verticalAlignment: Text.AlignVCenter
                    Layout.fillHeight: true
                }

                SkrToolButton {
                    id: notificationButton
                    flat: true
                    Layout.preferredWidth: 40
                    Layout.fillHeight: true
                    padding: 0
                }
            }
        }
    }
    states: [
        State {
            name: "toolbar"

            PropertyChanges {
                target: pane
                visible: true
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

