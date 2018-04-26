import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQml 2.2
import AlgWidgets 1.0

AlgWindow{
                id:importer
                title:"freePBR-importer"
                modality:Qt.ApplicationModal
                property int fontSize:18
                property string fontFamily:"微软雅黑"
                property var files:null
                signal getedFolder(string folder)

                minimumWidth: 400
                minimumHeight: 250


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
                                text:"Base Color"
                                font.family:fontFamily
                                font.pixelSize: fontSize
                                }

                              AlgComboBox {
                                id: baseColorList
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
                    RowLayout {
                                id:metal
                              spacing: 6

                              AlgLabel{
                                text:"Metal Color"
                                font.family:fontFamily
                                font.pixelSize: fontSize
                                }

                              AlgComboBox {
                                id: metalColorList
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
                    RowLayout {
                                id:rough
                              spacing: 6

                              AlgLabel{
                                text:"Rough Color"
                                font.family:fontFamily
                                font.pixelSize: fontSize
                                }

                              AlgComboBox {
                                id: roughColorList
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
                    RowLayout {
                                id:normal
                              spacing: 6

                              AlgLabel{
                                text:"Normal Color"
                                font.family:fontFamily
                                font.pixelSize: fontSize
                                }

                              AlgComboBox {
                                id: normalColorList
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
                    RowLayout {
                                id:height
                              spacing: 6

                              AlgLabel{
                                text:"Height Color"
                                font.family:fontFamily
                                font.pixelSize: fontSize
                                }

                              AlgComboBox {
                                id: heightColorList
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


                Component.onCompleted: {
                importer.getedFolder.connect(getTextureFiles)

                }

                function getTextureFiles(dir){
                        alg.log.info(dir)
                    var result = ""
                    result = alg.subprocess.check_output([alg.plugin_root_directory+"getInfo.exe","-tex",dir])
                    var files = result.trim().split("\r\n");
                    if(files.length !=0){
                        updateList(files)
                        result = alg.subprocess.check_output([alg.plugin_root_directory+"getInfo.exe","-f",dir])
                        files = result.trim().split("\r\n");
                        importer.files = files;

                    }

                }

                function updateList(files){
                    baseColorList.model = files;
                    metalColorList.model = files;
                    roughColorList.model = files;
                    normalColorList.model = files;
                    heightColorList.model = files;

                }
                function getPath(filename,fileDatas){
                    if(fileDatas.length!=0){
                        for(var f in fileDatas){
                            var result = f.match("/(.*)"+filename+"/g")
                            if(result !=null){
                                return f;
                            }
                        }
                    }
                    else{
                        return null;
                    }
                }

    }