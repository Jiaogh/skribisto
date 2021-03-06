import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../Commons"
import "../Items"
import ".."

Item {

    property alias saveDial: saveDial
    property alias saveSpinBox: saveSpinBox
    property alias saveEveryCheckBox: saveEveryCheckBox
    property alias backUpEveryCheckBox: backUpEveryCheckBox
    property alias backupHoursSpinBox: backupHoursSpinBox
    property alias backupHoursDial: backupHoursDial

    property alias accessibilityGroupBox: accessibilityGroupBox

    property alias menuButtonsInStatusBarSwitch: menuButtonsInStatusBarSwitch
    property alias showMenuBarCheckBox: showMenuBarCheckBox
    property alias backUpOnceADayCheckBox: backUpOnceADayCheckBox
    property alias backupPathListView: backupPathListView
    property alias removeBackupPathButton: removeBackupPathButton
    property alias addBackupPathButton: addBackupPathButton
    property alias showPropertiesCheckBox: showPropertiesCheckBox
    property alias resetDockConfButton: resetDockConfButton
    property alias allowSwipeBetweenTabsCheckBox: allowSwipeBetweenTabsCheckBox
    property alias setTextCursorUnblinkingCheckBox: setTextCursorUnblinkingCheckBox
    readonly property int columnWidth: 550
    property alias langComboBox: langComboBox
    property alias checkSpellingCheckBox: checkSpellingCheckBox
    property alias checkSpellingComboBox: checkSpellingComboBox
    property alias openThemePageButton: openThemePageButton

    SkrPane {
        id: pane2
        anchors.fill: parent

        ScrollView {
            id: scrollView
            anchors.fill: parent
            clip: true

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AsNeeded
            contentWidth: pillarLayout.width
            contentHeight: pillarLayout.implicitHeight

            SKRPillarLayout {
                id: pillarLayout
                width: scrollView.width
                columns: ((pillarLayout.width / columnWidth) | 0 )
                maxColumns: 3

                SkrGroupBox {
                    id: accessibilityGroupBox
                    Layout.fillWidth: true
                    focusPolicy: Qt.TabFocus

                    title: qsTr("Accessibility")

                    ColumnLayout {
                        id: columnLayout3
                        anchors.fill: parent

                        SkrSwitch {
                            id: allowSwipeBetweenTabsCheckBox
                            text: qsTr("Allow swipe gesture between tabs")

                        }

                        SkrSwitch {
                            id: showMenuBarCheckBox
                            visible: false
                            text: qsTr("Show menu bar")

                        }
                    }
                }

                SkrGroupBox {
                    id: appearanceGroupBox
                    width: 200
                    height: 200
                    Layout.fillWidth: true
                    focusPolicy: Qt.TabFocus
                    title: qsTr("Appearance")

                    ColumnLayout {
                        id: columnLayout5
                        anchors.fill: parent

                        RowLayout {
                            id: rowLayout4
                            width: 100
                            height: 100

                            SkrLabel {
                                id: langLabel
                                text: qsTr("Interface language :")
                            }

                            SkrComboBox {
                                id: langComboBox
                                wheelEnabled: true
                            }
                        }
                        SkrSwitch {
                            id: menuButtonsInStatusBarSwitch
                            text: qsTr("Set main menu in status bar")

                        }

                        SkrButton {
                            id: openThemePageButton
                            text: qsTr("Manage themes")
                        }
                    }
                }

                SkrGroupBox {
                    id: spellCheckingGroupBox
                    width: 200
                    height: 200
                    Layout.fillWidth: true
                    focusPolicy: Qt.TabFocus
                    title: qsTr("Spell checking")

                    ColumnLayout {
                        id: columnLayout6
                        anchors.fill: parent

                        SkrSwitch {
                            id: checkSpellingCheckBox
                            text: qsTr("Check spelling")
                        }

                        RowLayout {
                            id: rowLayout5
                            width: 100
                            height: 100

                            SkrLabel {
                                id: label
                                text: qsTr("Default dictionary :")
                            }

                            SkrComboBox {
                                id: checkSpellingComboBox

                            }
                        }
                    }
                }

                SkrGroupBox {
                    id: backupGroupBox
                    Layout.rowSpan: 3
                    Layout.fillWidth: true
                    focusPolicy: Qt.TabFocus
                    title: qsTr("Backup")

                    ColumnLayout {
                        id: columnLayout
                        anchors.fill: parent

                        SkrGroupBox {
                            id: groupBox1
                            title: qsTr("Backup paths :")
                            focusPolicy: Qt.TabFocus

                            ColumnLayout {
                                id: columnLayout1
                                anchors.fill: parent
                                anchors.topMargin: 5

                                SkrToolBar {
                                    Layout.fillWidth: true

                                    RowLayout {
                                        id: rowLayout1
                                        spacing: 1
                                        anchors.fill: parent

                                        Item {
                                            id: stretcher
                                            Layout.fillHeight: true
                                            Layout.fillWidth: true
                                        }
                                        SkrToolButton {
                                            id: removeBackupPathButton
                                            flat: true
                                            display: AbstractButton.IconOnly
                                            icon.color: SkrTheme.buttonIcon
                                        }

                                        SkrToolButton {
                                            id: addBackupPathButton
                                            flat: true
                                            display: AbstractButton.IconOnly
                                            icon.color: SkrTheme.buttonIcon

                                        }
                                    }
                                }

                                ScrollView {
                                    id: backupPathScrollView
                                    focusPolicy: Qt.StrongFocus
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    Layout.preferredHeight: 200
                                    Layout.preferredWidth: 300
                                    clip: true
                                    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                                    ScrollBar.vertical.policy: ScrollBar.AsNeeded

                                    ListView {
                                        id: backupPathListView
                                        width: 110
                                        height: 160
                                        Layout.preferredHeight: 200
                                        Layout.preferredWidth: 300
                                        clip: true
                                        focus: true
                                        smooth: true
                                        boundsBehavior: Flickable.StopAtBounds
                                    }
                                }
                            }
                        }

                        RowLayout {
                            id: rowLayout

                            SkrSwitch {
                                id: backUpEveryCheckBox
                                text: qsTr("Back up every")
                            }

                            SkrSpinBox {
                                id: backupHoursSpinBox
                                wheelEnabled: true
                                editable: true

                                to: 60
                                from: 1

                            }

                            SkrLabel {
                                id: backupHours
                                text: qsTr("hours")

                            }

                            SkrDial {
                                id: backupHoursDial
                                wheelEnabled: true

                                to: 60
                                from: 1
                            }
                        }

                        SkrSwitch {
                            id: backUpOnceADayCheckBox
                            text: qsTr("Back up once a day")
                        }
                    }
                }


                SkrGroupBox {
                    id: saveGroupBox
                    Layout.rowSpan: 2
                    Layout.fillWidth: true
                    focusPolicy: Qt.TabFocus
                    title: qsTr("Save")

                    ColumnLayout {
                        id: columnLayout2
                        anchors.fill: parent

                        RowLayout {
                            id: rowLayout2
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            SkrSwitch {
                                id: saveEveryCheckBox
                                text: qsTr("Save every")

                            }

                            SkrSpinBox {
                                id: saveSpinBox

                            }

                            SkrLabel {
                                id: saveMinutes
                                text: qsTr("minutes")

                            }

                            SkrDial {
                                id: saveDial
                                to: 60
                                from: 1
                                wheelEnabled: true
                            }
                        }
                    }
                }


                SkrGroupBox {
                    id: specialEPaperGroupBox
                    width: 200
                    height: 200
                    Layout.fillWidth: true
                    focusPolicy: Qt.TabFocus
                    title: qsTr("Special E-Paper")

                    SkrSwitch {
                        id: setTextCursorUnblinkingCheckBox
                        text: qsTr("Set the text cursor unblinking")

                    }
                }


                SkrGroupBox {
                    id: advancedGroupBox
                    width: 200
                    height: 200
                    Layout.fillWidth: true
                    focusPolicy: Qt.TabFocus
                    title: qsTr("Advanced")

                    RowLayout {
                        id: rowLayout3
                        anchors.fill: parent

                        ColumnLayout {
                            id: columnLayout4
                            width: 100
                            height: 100

                            SkrSwitch {
                                id: showPropertiesCheckBox
                                text: qsTr("Show properties tool box")
                            }

                            SkrButton {
                                id: resetDockConfButton
                                text: qsTr("Reset dock configuration")
                            }
                        }
                    }
                }

            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:1500;width:600}
}
##^##*/

