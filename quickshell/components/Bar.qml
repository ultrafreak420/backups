import Quickshell
import QtQuick
import Quickshell.Wayland
import "topbarcomponents"

//everythings in a scope so that the children propogate properly 
Scope {	
	//this panel is purely cosmetic nothing actually depends on this it's just to give the rest of the objects in the bar space visually,
	//and a blurred background
	PanelWindow {	
		id: bar	
		anchors {	
			top: true;
			left: true;	
			right: true;	
		}
		implicitHeight: 60	
		color: "transparent"	
		BackgroundEffect.blurRegion: Region { item: bar.contentItem }	
	}
	//this "Overlay" type is just a panel window that covers the whole screen to give all of the visual elements a place to live
	Overlay {
		//this mask is so that the overlay doesn't obstruct the rest of the windows behind it 
		mask:
		Region {		
			item: dock
			intersection: Intersection.Intersect							
			Region {					
				item: mix			
				intersection: Intersection.Combine
			}	
		}
		Dock {		
			//gotta give this dock an id so that the region can recognize it
			id: dock
		}
		Mixer {
			id: mix
		}
	}	
}
