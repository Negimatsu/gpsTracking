// Global Variable
var markers = [];
var kasetsart = new google.maps.LatLng(13.8480, 100.5730);
var marker;
var currentMarker = null;
var map;
//

function setStationsMarker(map){

    $.ajax({
        url: "/data/data_stations",

        success: function( data ) {
            console.log(data);
            $.each( data, function( index, st ){
                var myLatLng = new google.maps.LatLng(st.lat, st.lng);

                if(st.station_pic.thumb.url != null){
                    var image = { url: st.station_pic.thumb.url,
                        size: new google.maps.Size(20, 32),
                        // The origin for this image is 0,0.
                        origin: new google.maps.Point(0,0),
                        // The anchor for this image is the base of the flagpole at 0,32.
                        anchor: new google.maps.Point(0, 32)
                        };
                }

                var marker = new google.maps.Marker({
                    map: map,
                    position: myLatLng,
                    title: st.name,
                    zIndex: st.station,
                    icon: image,
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

function setCurrentMarker(map){

    $.ajax({
        url: "/data/data_current",

        success: function( data ) {
            var myLatLng = new google.maps.LatLng(data.lat, data.long);
//            console.log(data);
            if (currentMarker) {
                // Marker already created - Move it
              currentMarker.setPosition(myLatLng);
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
    setInterval(setCurrentMarker, 3000);
}

function toggleBounce() {

    if (marker.getAnimation() != null) {
        marker.setAnimation(null);
    } else {
        marker.setAnimation(google.maps.Animation.BOUNCE);
    }
}

google.maps.event.addDomListener(window, 'load', initialize);


function detectBrowser() {
    var useragent = navigator.userAgent;
    var mapdiv = document.getElementById("map-canvas");

    if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1 ) {
        mapdiv.style.width = '95%';
        mapdiv.style.height = '90%';

        mapOptions = {
            center: kasetsart,
            zoom: 15,
            scale: 5,
            disableDefaultUI: false ,
            disableDoubleClickZoom: true,
            draggable: false,
            panControl: false,
            zoomControl: true
        };
    } else {
        mapdiv.style.width = '100%';
        mapdiv.style.height = '100%';
    }
}

var mapOptions;
function initialize() {

    mapOptions = {
        center: kasetsart,
        zoom: 16,
        scale: 4,
        disableDefaultUI: false,
        disableDoubleClickZoom: true,
        scrollwheel:false,
        draggable: false,
        panControl: false,
        zoomControl: false,
        scaleControl: false
    };

    detectBrowser();
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    setMarker(map);
    google.maps.event.addListener(marker, 'click', toggleBounce);
}

function setMarker(map){
    setStationsMarker(map)
    setCurrentMarker(map);
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