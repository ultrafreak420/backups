import Quickshell
import QtQuick
import Quickshell.Widgets
import "dockcomponents"

//this clipping rectangle is very important without it the text would apear as soon as you hover it
//and then for the duration of the animation it would exist partially outside the bounds of the rectangle 
ClippingRectangle {
	id: rect
	anchors.top: parent.top
	anchors.topMargin: 10
	anchors.horizontalCenter: parent.horizontalCenter
	    //hear we want the height to change if it's being hovered over
	    implicitWidth: 500
	    implicitHeight: hoverometer.containsMouse ? 145 : 45
	    radius: 45 / 2
	    color: "#1A0713"
	    //this is to animate the change in height
	    Behavior on implicitHeight {
		    NumberAnimation {
			    duration: 250
			    easing.type: Easing.InOutQuad
		    }
	    }
    MouseArea {
	    id: hoverometer
	    anchors.fill: parent
	    hoverEnabled: true
    }
    Clock {}
    Mixerbutton {}
}
