import QtQuick
import Quickshell

Rectangle {
	//id: button
	anchors.top: parent.top
	anchors.horizontalCenter: parent.horizontalCenter
	//anchors.right: parent.right
	anchors.topMargin: 100
	//anchors.rightMargin: 10
	implicitWidth: 45
	implicitHeight: 30
	radius: height / 2
	border.width: 2
	border.color: "#D6296B"
	color: "#631222"
	Text {
		anchors.centerIn: parent
		text: "VOL"
		color: "#D6296B"
		font.bold: true
		font.pixelSize: 15
	}
	MouseArea {
		anchors.fill: parent
		cursorShape: Qt.PointingHandCursor
		enabled: true
		onClicked: {			
			if (mix.state == "state2")
			mix.state = "state1"
			else mix.state = "state2"	       
		}
	}
}
