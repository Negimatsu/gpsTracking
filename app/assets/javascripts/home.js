// Global Variable
var markers = [];
//var kasetsart = google.maps.LatLng(13.8480, 100.5730);
var marker;
var currentMarker = null;
//var map;
//
var flag = true

$(document).ready(function () {
    $("#station_station_id").change(function () {
        var selected = $("#station_station_id").val();
        $.ajax({
            url: "/api/track/current_select/"+selected,
            success: function (time) {
                $('#time').text(Math.floor(time/60) + " : " + time%60 + " นาที");
            }
        });
    });
});


function setRoute(map){
    $.ajax({
        url: "/api/track/show_route",

        success: function(data){

            var current_loc =  new google.maps.LatLng(data.current.lat, data.current.lng);
            var next_loc =  new google.maps.LatLng(data.next.lat, data.next.lng);

            if(flag){
                var option = {  suppressMarkers: true,
                    polylineOptions: {
                        visible: true,
                        strokeColor: data.color,
                        strokeWeight:'5'
                    }
                }
                directionsDisplay = new google.maps.DirectionsRenderer(option);
                setDisplayCalcRoute(current_loc, next_loc,data.color);
                directionsDisplay.setMap(map);
                flag = false;
            }else{
                setDisplayCalcRoute(current_loc, next_loc,data.color);
                $("#name").text(data.current.name);
                $('#next_station').text(data.next.name);
                $('#time').text(Math.floor(data.time/60) + " : " + data.time%60 + " นาที");
            }

        },
        error: function (){
            console.trace();
        }
    });
}

function setDisplayCalcRoute(start, end, color) {

    var option = {
        visible: true,
        polylineOptions: {
            strokeColor: color,
            strokeWeight:'5'
        }
    }
    directionsDisplay.setOptions(option);

    var request = {
        origin: start,
        destination: end,
        travelMode: google.maps.TravelMode.WALKING
    };
    directionsService.route(request, function(response, status) {

        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setOptions({ preserveViewport: true });
            directionsDisplay.setDirections(response);
        }
    });

}

function setStationsMarker(map){

    $.ajax({
        url: "/data/data_stations",

        success: function( data ) {
            console.log(data+"xxx");
            $.each( data, function( index, st ){
                var myLatLng = new google.maps.LatLng(st.lat, st.lng);
                var marker = new google.maps.Marker({
                    map: map,
                    position: myLatLng,
                    title: st.name,
                    zIndex: st.id,
                    animation: google.maps.Animation.DROP
                });
                markers.push(marker);
            });
        },

        error: function (){
            console.trace();
        }
    });
}

function setIconMarkerStation(current_station, next_station){

    $.each( markers, function( index, station ){
        $.ajax({
            type: "GET",
            url: "/stations/json/" + station.zIndex,
            dataType: "json",
            success: function(data){
                if(current_station == station.zIndex){
                    var image = getImageIcon(data.station_current_pic.thumb.url);
                }
                else if(next_station.indexOf(station.zIndex) > -1){
                    var image = getImageIcon(data.station_next_pic.thumb.url);
                }else{
                    var image = getImageIcon(data.station_normal_pic.thumb.url);
                }
                station.setIcon(image);
            },
            error: function (){
                console.trace();
            }
        });

    });
}


function setCurrentMarker(map){

    $.ajax({
        url: "/data/data_current",

        success: function( data ) {
            var myLatLng = new google.maps.LatLng(data.lat, data.long);

            if (currentMarker) {
                // Marker already created - Move it
                currentMarker.setPosition(myLatLng);

                $.ajax({
                    url: "/api/track/next_station",

                    success: function(station_next){
                        setIconMarkerStation(data.station_id, station_next);
                    }
                });


            }else{
                currentMarker = new google.maps.Marker({
                    map: map,
                    position: myLatLng,
                    title: "current",
                    animation: google.maps.Animation.DROP
                });
                currentMarker.setMap(map);
            }
        },
        error: function (){
            console.trace();
        }
    });
    // Call the autoUpdate() function every 5 seconds
}

function recursive_data(map){
    setCurrentMarker(map);
    setInterval(setCurrentMarker, 5000);
    setRoute(map);
    setInterval(setRoute, 5000);
}

function toggleBounce() {

    if (marker.getAnimation() != null) {
        marker.setAnimation(null);
    } else {
        marker.setAnimation(google.maps.Animation.BOUNCE);
    }
}

function detectBrowser() {
    var useragent = navigator.userAgent;
    var mapdiv = document.getElementById("map-canvas");

    if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1 ) {
        mapdiv.style.width = '95%';
        mapdiv.style.height = '90%';

        mapOptions = {
            center: new google.maps.LatLng(13.8480, 100.5730),
            zoom: 15,
            scale: 5,
            disableDefaultUI: false ,
            disableDoubleClickZoom: true,
            draggable: false,
            panControl: false,
            scrollwheel: false,
            zoomControl: true
        };
    } else {
        mapdiv.style.width = '110%';
        mapdiv.style.height = '90%';
    }
}


var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
google.maps.event.addDomListener(window, 'load', init);
var mapOptions;

function init() {
    mapOptions = {
        center: new google.maps.LatLng(13.847807, 100.573710),
        zoom: 16,
        scale: 4,
        disableDefaultUI: false,
        disableDoubleClickZoom: true,
        keyboardShortcuts:false,
        draggable: false,
        panControl: false,
        zoomControl: false,
        scaleControl: false,
        scrollwheel: false
    };
    detectBrowser();
    var mapElement = document.getElementById('map-canvas');

    // Create the Google Map using out element and options defined above
    var map = new google.maps.Map(mapElement, mapOptions);

    setMarker(map);
    google.maps.event.addListener(marker, 'click', toggleBounce);

}

function setMarker(map){
    setStationsMarker(map)
   // setCurrentMarker(map);
    recursive_data(map);
    setAllMap(map) ;
}

// Sets the map on all markers in the array.
function setAllMap(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
    setAllMap(null);
}

function getImageIcon(url){
    if (url == null){
        return null
    }else{
        var image = {
            url: url,
            size: new google.maps.Size(35,48),
            origin: new google.maps.Point(0,0),
            anchor: new google.maps.Point(0, 32)
        }
        return image;
    }
}

