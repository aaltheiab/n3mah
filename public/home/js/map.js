var map;

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 14,
        center: new google.maps.LatLng(21.357831, 39.983886),
        mapTypeId: 'roadmap'

    });
    var iconBase = '/../home/img/';
    var icons = {
        pickUp: {
            icon: iconBase + 'a-pin.png'
        },
        dropOff: {
            icon: iconBase + 'b-pin.png'
        }
    };

    var features = [ {
        position: new google.maps.LatLng(21.357841, 39.971886),
        type: 'pickUp'
    }, {
        position: new google.maps.LatLng(21.354831, 39.983886),
        type: 'dropOff'
    }
    ];

    // Create markers.
    features.forEach(function(feature) {
        var marker = new google.maps.Marker({
            position: feature.position,
            icon: icons[feature.type].icon,
            map: map
        });
    });
}