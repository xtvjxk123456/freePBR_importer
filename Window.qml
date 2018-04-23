import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import AlgWidgets 1.0


AlgWindow{
                id:importer
                title:"freePBR-importer"
                modality:Qt.ApplicationModal
                property int fontSize:16
                property string fontFamily:"微软雅黑"

                minimumWidth: 350
                minimumHeight: 200


                ColumnLayout{
                    id:mainLayout
                    anchors.fill:parent
                    spacing:2

                    AlgLabel{
                        id:information
                        Layout.fillWidth: true
                        font.pixelSize: fontSize
//                        fontSizeMode:Text.Fit
                        text:"本工具将freePBR的贴图导入sp\n"
                        font.family:fontFamily

                    }
                    RowLayout {
                        spacing: 6
                        AlgLabel{
                            text:"贴图目录:"
                            font.family:fontFamily
                            font.pixelSize: fontSize
                        }
                        AlgTextEdit {
                          id: path
                          font.family:fontFamily
                          borderActivated: true
                          wrapMode: TextEdit.Wrap
                          readOnly: true
                          Layout.fillWidth: true

                          function reload() {
//                            text = alg.settings.value("photoshopPath", "...")
                          }

                          Component.onCompleted: {
                            reload()
                          }
                        }

                        AlgButton {
                          id: searchPathButton
                          text: "浏览"
                          font.family:fontFamily
                          implicitHeight: 30
                          font.pointSize: fontSize
                          onClicked: {
                            // open the search path dialog
                            searchPathDialog.open()
                          }
                        }
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

                FileDialog {
                id: searchPathDialog
                title: "选择某材质贴图所在目录..."
                nameFilters: [ "Photoshop files (*.exe *.app)", "All files (*)" ]
                selectedNameFilter: "Executable files (*)"
                onAccepted: {
                  path.text = alg.fileIO.urlToLocalFile(fileUrl.toString())
                    }
                }
    }