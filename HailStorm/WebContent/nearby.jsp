
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta name="robots" content="noindex, nofollow">
  <meta name="googlebot" content="noindex, nofollow">
  <script type="text/javascript" src="/js/lib/dummy.js"></script>
<link rel="stylesheet" type="text/css" href="/css/result-light.css">
  <style type="text/css">
    /* Always set the map height explicitly to define the size of the div
 * element that contains the map. */

#map {
  height: 100%;
width:75%;
}


/* Optional: Makes the sample page fill the window. */

html,
body {
  height: 100%;
  margin: 0;
  padding: 0;
}

#right-panel {
  font-family: 'Roboto', 'sans-serif';
  line-height: 30px;
  width: 100%;
  height: 100%;
  margin-right: -4px;
}

#right-panel select,
#right-panel input {
  font-size: 15px;
}

#right-panel select {
  width: 100%;
}

#right-panel i {
  font-size: 12px;
}

#right-panel {
  font-family: Arial, Helvetica, sans-serif;
  position: absolute;
  right: 5px;
  top: 60%;
  margin-top: -240px;
  height: 390px;
  width: 198px;
  padding-right:1px;
  padding: 5px;
  z-index: 5;
  border: 1px solid #999;
  background: #fff;
}

h2 {
  font-size: 22px;
  margin: 0 0 5px 0;
}

ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
  height: 271px;
  width: 200px;
  overflow-y: scroll;
}

li {
  background-color: #f1f1f1;
  padding: 10px;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}

li:nth-child(odd) {
  background-color: #fcfcfc;
}

#more {
  width: 100%;
  margin: 5px 0 0 0;
}

  </style>

  <title>Place search </title>

  
</head>

<body>
  <div id="map" "></div>
<div id="right-panel">
  <h2>Results</h2>
  <ul id="places"></ul>
  <button id="more">More results</button>
</div>
<!-- Replace the value of the key parameter with your own API key. -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRNm8LFyiWvakckA-fG9Au0WznGHudiyY&libraries=places&callback=initMap" async defer></script>
<script type='text/javascript'>//<![CDATA[

// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

var map;

function initMap() {
  var pyrmont = {
    lat: 17.4401,
    lng: 78.3489
  };

  map = new google.maps.Map(document.getElementById('map'), {
    center: pyrmont,
    zoom: 17
  });

  var service = new google.maps.places.PlacesService(map);
  service.nearbySearch({
    location: pyrmont,
    radius: 1000,
    type: ['parking']
  }, processResults);
  
}

function processResults(results, status, pagination) {
  if (status !== google.maps.places.PlacesServiceStatus.OK) {
    return;
  } else {
    createMarkers(results);

    if (pagination.hasNextPage) {
      var moreButton = document.getElementById('more');

      moreButton.disabled = false;

      moreButton.addEventListener('click', function() {
        moreButton.disabled = true;
        pagination.nextPage();
      });
    }
  }
}

function createMarkers(places) {
  var bounds = new google.maps.LatLngBounds();
  var placesList = document.getElementById('places');
 
  
  for (var i = 0, place; place = places[i]; i++) {
    var image = {
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(25, 25)
    };

    var marker = new google.maps.Marker({
      map: map,
      icon: image,
      title: place.name,
      position: place.geometry.location
    });
	
	var placeLat = place.geometry.location.lat();
	var placeLng = place.geometry.location.lng();
    placesList.innerHTML += '<button style="width:100%;" onclick="maloc('+placeLat+','+placeLng+')">' + place.name + '</button>';
	
	
	
    bounds.extend(place.geometry.location);
    

  }
  map.fitBounds(bounds);
}
function maloc(lat,lng)
{
	
	localStorage.setItem("lat", lat);
	localStorage.setItem("lng", lng);
	window.location.href="direction.jsp";
	

	
}


//]]> 

</script>

</body>


</html>
