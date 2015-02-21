// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require foundation
//= require jquery_ujs
//= require_tree .

$(document).foundation();


// Note: This example requires that you consent to location sharing when
// prompted by your browser. If you see a blank space instead of the map, this
// is probably because you have denied permission for location sharing.
function go() {

    if(!!navigator.geolocation) {

        var map;

        var mapOptions = {
            zoom: 13,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

        navigator.geolocation.getCurrentPosition(function(position) {

            var geolocate = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

            var infowindow = new google.maps.InfoWindow({
                map: map,
                position: geolocate,
                content:
                    '<p>Your Location!</p>' +
                    '<p>Latitude: ' + position.coords.latitude + '</p>' +
                    '<p>Longitude: ' + position.coords.longitude + '</p>'
            });

            map.setCenter(geolocate);

        });

    } else {
        document.getElementById("map-canvas").innerHTML = 'No Geolocation Support.';
    }

}
