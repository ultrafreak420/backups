import Quickshell
import QtQuick


//as i said before in the comments this text was a bit problematic lol 
Text {
	//here what we're doing is describing the relationship between the status of the hoverometer and the text   
	anchors.top: parent.top  
	anchors.horizontalCenter: parent.horizontalCenter   
	anchors.topMargin: 12    
	text: {Qt.formatDateTime(sysclock.date, "         hh:mm:ss ap\n\ndd/MM/yyyy | ddd MMM")}
	font.bold: true
    	font.pixelSize: 15    
	color: "#D6296B"

	SystemClock {
		id: sysclock
		precision: SystemClock.Seconds
	}
}
