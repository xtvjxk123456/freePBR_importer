import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import AlgWidgets 1.0

RowLayout{
    id: layout
    property var minHeight:null
    property var minWidth:null
//    implicitHeight: 10 不起作用
    Button{
        id:aButton
        implicitHeight: parent.minHeight
//        anchors.left: parent.left

        text: "fff"

        onClicked:{
        alg.log.warn("我没有设置任何的命令")
        }
        }
    Button{
        id:bButton
        implicitHeight: parent.minHeight //最小高度
//        anchors.left: aButton.right//不需要这样的定位，因为有layout
        text: "bb"
        onClicked:{
        alg.log.warn("我没有设置任何的命令")
        }
        }
}



