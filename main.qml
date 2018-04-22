import QtQuick 2.2
import Painter 1.0

PainterPlugin {

		Component.onCompleted: {
				// create toolbar buttons
//				var t = alg.ui.addToolBarWidget("UI.qml");
//				t.minHeight =20
//				t.rectangle.color = "blue"
//				t = alg.ui.addToolBarWidget("UI.qml");
//				t.rectangle.color = "green"
//				t = alg.ui.addToolBarWidget("UI.qml");
//				t.rectangle.color = "yellow"
//				t = alg.ui.addToolBarWidget("UI.qml");
//				t.rectangle.color = "purple"
//				// create a dock widget
				var t =alg.ui.addDockWidget("UI.qml");
                t.minHeight =20
		}

}
