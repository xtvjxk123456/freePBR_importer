import QtQuick 2.7
import QtQuick.Layouts 1.3
import AlgWidgets 1.0


AlgWindow{
                id:importer
                title:"freePBR-importer"
                modality:Qt.ApplicationModal
                ColumnLayout{
                    id:mainLayout
                    anchors.fill:parent
                    spacing:2

                    AlgButton{
                        id:somename
                        text:"importer"
                        Layout.fillWidth: true
                    }
                    AlgButton{
                        id:useless
                        text:"ffff"
                        Layout.fillWidth: true
                    }
                    Item {
                        // spacer item

                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Rectangle { anchors.fill: parent;
                                    color: "#000000"

                                    opacity:0.1} // to visualize the spacer
                            }
        }
    }