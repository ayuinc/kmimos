/*/// <reference path="google.maps.d.ts" />
 
class MapObject {
	
	currentMap: google.maps.Map;
	domElementMap: HTMLElement;
	markers: Array<google.maps.Marker>;
	
	mapData: google.maps.Data;
	
	constructor(idMap: string){
		
		this.domElementMap = document.getElementById(idMap);
		this.currentMap = new google.maps.Map(this.domElementMap);
		
		var latitude = this.domElementMap.getAttribute('latitude');
		var longitude = this.domElementMap.getAttribute('latitude');
		 
		
		//this.mapData = this.currentMap.data;
		
		//this.currentMap.setCenter(new google.maps.LatLng(-12.3214, -73.123123));
		
		var latLng = new google.maps.LatLng(52.201203, -1.724370),
			feature = new google.maps.Data.Feature(),
			geometry = new google.maps.Data.Geometry();
		
		var data = this.currentMap.data;
		
		data.add(feature);
		
		data.add({
			geometry: latLng,
			id: "Test feature",
			properties: {}
		});
		
		data.setMap(this.currentMap);

		//if (latitude != "" && longitude != "") {
		//	this.setLocation(parseFloat(latitude),parseFloat(longitude));
		//}
	}

	public setLocation(lat: number, lng: number): void {
		this.currentMap.setCenter(new google.maps.LatLng(lat,lng));
	}
 	
	public addMarker(lat: number, lng: number): void{ 
		var newMarker = new google.maps.Marker();
		newMarker.setPosition(new google.maps.LatLng(lat,lng)); 
		newMarker.setMap(this.currentMap);
		this.markers.push(newMarker);
	}
	
	
	
}*/