import QtQuick 2.9
import QtQuick.Dialogs 1.2
import eu.skribisto.projecthub 1.0

WelcomePageForm {

//    Connections {
//        target: plmData.projectHub()
//        onProjectLoaded: console.log("loaded !!")
//    }


    function init(){
        //leftBase.onBaseWidthChanged.connect(changeLeftBaseWidth)
        //rightBase.onBaseWidthChanged.connect(changeRightBaseWidth)
        var error = plmData.projectHub().loadProject("/home/cyril/Devel/skribisto/skribisto/resources/test/skribisto_test_project.sqlite");
        console.log("project loaded : " + error.success);
//        if (!error.success) {
//            messageDialog.title = qsTr("")
//            messageDialog.text = qsTr("")
//            messageDialog.informativeText = "inf"
//            messageDialog.detailedText = "det"
//            messageDialog.visible = true
//        }

    }

    Component.onCompleted: init()


    MessageDialog {
        id: messageDialog
        title: ""
        onAccepted: {
            visible = false
        }
    }


}
