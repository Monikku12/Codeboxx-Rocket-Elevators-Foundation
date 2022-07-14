let map;
console.log(initMap)
function initMap() {
	map = new google.maps.Map(document.getElementById("map"), {
		center: { lat: 46.835836227441523, lng: -71.29183850182048 },
		zoom: 8,
	});  
	console.log(initMap)

	var marker = new google.maps.Marker({
		position: { lat: 46.835836227441523, lng: -71.29183850182048 },
		map: map,
		title: 'Codeboxx, Inc.'
		});


	var marker2 = new google.maps.Marker( {
		position: { lat: 46.80161, lng: -71.21739 },
		map: map,
		title: 'Marshmallow Demers',
	});
	
}

window.initMap = initMap;

// var map2 = new Map({
// 	div: 'map',
// 	lat: 46.835836227441523,
// 	lng: -71.29183850182048,
// 	scrollwheel: false
// });

// var marker = map2.addMarker({
// 	lat: 46.835836227441526,
// 	lng: -71.29183850182048,
// 	title: 'Codeboxx, Inc.'
// });