import QtQuick 2.7
import QtQuick.Layouts 1.3
import AlgWidgets 1.0

RowLayout{
    id: layout
//    property var minHeight:null
//    property var minWidth:null
//    implicitHeight: 10 不起作用
    property var importWin:null
    AlgButton{
        id:aButton
        implicitHeight: 30
        implicitWidth: 50
//        anchors.left: parent.left

        text: "freePBR"
        onClicked:{
//        alg.log.info("我没有设置任何的命令")
            try{
                importWin.open()

            }
            catch(err){
                alg.log.exception(err)
            }

        }
        }

}



