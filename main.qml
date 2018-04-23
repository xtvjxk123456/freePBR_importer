import Painter 1.0
import QtQuick 2.7
import AlgWidgets 1.0


PainterPlugin {
        Window{
        id:importer

        }


		Component.onCompleted: {
				// create toolbar buttons
				var t = alg.ui.addToolBarWidget("toolbar.qml");
                t.importWin = importer

//				t.rectangle.color = "blue"
//				t = alg.ui.addToolBarWidget("toolbar.qml");
//				t.rectangle.color = "green"
//				t = alg.ui.addToolBarWidget("toolbar.qml");
//				t.rectangle.color = "yellow"
//				t = alg.ui.addToolBarWidget("toolbar.qml");
//				t.rectangle.color = "purple"
//				// create a dock widget
//				var t =alg.ui.addDockWidget("toolbar.qml");
//                t.minHeight =20
		}

}
