import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import "dockcomponents"

ClippingRectangle {
	id: floating
	anchors.left: parent.left
	anchors.top: parent.top
	anchors.topMargin: 350
	anchors.leftMargin: -10
	radius: 15
	border.width: 2
	border.color: "#D6296B" 
	color: "#1A0713"

	state: "state1"

	states: [ 
		State {
			name: "state1"
			PropertyChanges { target: floating; implicitWidth: 1; implicitHeight: 350 }
		},
		State {
			name: "state2"
			PropertyChanges { target: floating; implicitWidth: 1110; implicitHeight: 350 }
		}
	]
	transitions: Transition {
        NumberAnimation { properties: "implicitWidth"; easing.type: Easing.InBack; duration: 750 }
}

	ScrollView {
		anchors.fill: parent	
		contentWidth: availableWidth
		anchors.leftMargin: 10
		ColumnLayout {	
			anchors.fill: parent	
			anchors.margins: 10	
			// get a list of nodes that output to the default sink	
			PwNodeLinkTracker {		
				id: linkTracker				
				node: Pipewire.defaultAudioSink
			}
			Rectangle {
				Layout.fillWidth: parent
				implicitHeight: 20
				color: "#1A0713"
			}
		
			MixerEntry {		
				node: Pipewire.defaultAudioSink		
			}
		
			Rectangle {		
				Layout.fillWidth: true	
				color: palette.active.text		
				implicitHeight: 1	
			}
		
			Repeater {			
				model: linkTracker.linkGroups
			
				MixerEntry {			
					required property PwLinkGroup modelData			
					// Each link group contains a source and a target.
					// Since the target is the default sink, we want the source.
					node: modelData.source			
				}		
			}
			Rectangle {			
				anchors.top: parent.top
				anchors.right: parent.right
				anchors.rightMargin: 10
				anchors.topMargin: 1 
				implicitWidth: 30
				implicitHeight: 30			
				radius: height / 2		
				border.width: 2		
				border.color: "#D6296B"		
				color: "#631222"		
				Text {		
					anchors.centerIn: parent		
					text: "X"		
					color: "#D6296B"		
					font.bold: true		
					font.pixelSize: 15		
				}
				MouseArea {
					anchors.fill: parent			
					cursorShape: Qt.PointingHandCursor			
					enabled: true			
					onClicked: floating.state = "state1"		
				}		
			}
		}
	}
}

