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
                signal getedFolder(string folder)

                minimumWidth: 400
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

                    RowLayout {
                                id:base
                              spacing: 6

                              AlgLabel{
                                text:"Base color"
                                font.family:fontFamily
                                font.pixelSize: fontSize
                                }

                              AlgComboBox {
                                id: baseColorList
//                                textRole: "key"
//                                Layout.minimumWidth: 150

                                Layout.fillWidth: true
//                                Layout.fillHeight: true

                                model:null
                                function reload() {
//                                    getTextureFiles(path.text)
                                }
                                Component.onCompleted: {
                                  reload()
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
//                nameFilters: [ "Photoshop files (*.exe *.app)", "All files (*)" ]
//                selectedNameFilter: "Executable files (*)"
                selectFolder : true
                onAccepted: {
                  path.text = alg.fileIO.urlToLocalFile(fileUrl.toString())
                    importer.getedFolder(path.text)
                    }
                }

                function getTextureFiles(dir){
                        alg.log.info(dir)

//                    result = alg.subprocess.check_output("dir {}".format(dir))

//                        alg.log.info(result)
//                        if (typeof result =="null"){
//                            alg.log.warn("{} 内容为空".format(dir))
                    }
                Component.onCompleted: {
                importer.getedFolder.connect(getTextureFiles)

                }


    }