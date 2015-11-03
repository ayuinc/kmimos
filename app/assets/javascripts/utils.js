Array.prototype.chunk = function(chunkSize) {
    var array=this;
    return [].concat.apply([],
        array.map(function(elem,i) {
            return i%chunkSize ? [] : [array.slice(i,i+chunkSize)];
        })
    );
}

var uniqueItems = function (data, key) {
    var result = [];

    for (var i = 0; i < data.length; i++) {
        var value = data[i][key];

        if (result.indexOf(value) == -1) {
            result.push(value);
        }

    }
    return result;
};


function groupBy( array , f )
{
  var groups = {};
  array.forEach( function( o )
  {
    var group = JSON.stringify( f(o) );
    groups[group] = groups[group] || [];
    groups[group].push( o );
  });
  return Object.keys(groups).map( function( group )
  {
    return groups[group];
  })
}

function get_score(score, el){
  $(el).val(score);
  console.log(score);
  return score;
}


var paint_ratings = function(){
     $(".ratingStars").raty({
        score: function() {
          var el = $(this).attr('el');
          $(el).val($(this).attr('score'));
          $(el).hide();
          return $(this).attr('score');
        },
        readOnly: $(this).attr('readOnly'),
        click: function(score, evt) {
          var el = $(this).attr('el');
          $(el).val(score);
        },
        starOff : '/assets/icono-hueso-gris.svg',
        starOn  : '/assets/icono-hueso-verde.svg'
      });
};


$(".ratingStars").ready(function(){
  paint_ratings();
});



var paint_pretty_uploads = function(){

$(".pretty_upload_input").on('click', function(){
  $($(this).attr('el')).click();
});

$(".pretty_upload_input").on('change', function(){
  $($(this).attr('display')).val("Archivo elegido: " + $($(this).attr('el').val().replace(/^.*[\\\/]/, '')));
});

};


$(".pretty_upload_input").ready(function(){
  paint_pretty_uploads();
});



var maps=[];

function initMap(mapName, mapId) {

    var latitude = $("#" + mapId).attr('latitude');
    var longitude = $("#" + mapId).attr('longitude');
    var zoom = $("#" + mapId).attr('zoom');
    
    console.log(latitude);
    console.log(longitude);

    var tempItem={};

    var map_component = $("#" + mapId);

    var markers = $(".marker");

    // Search for markers

    var map = new google.maps.Map(document.getElementById(mapId), {
      center: {lat: parseFloat(latitude), lng: parseFloat(longitude)},
      zoom: parseInt(zoom)
    });

    markers.each(function(){ 
        
            var itemLatLng = {lat: parseFloat($(this).attr('latitude')), lng: parseFloat($(this).attr('longitude'))};

            var marker = new google.maps.Marker({
                position: itemLatLng,
                map: map
                });
    });
        

    tempItem[mapName] = map;

    maps.push(tempItem);
    
    return map;

}
 


var players=[];

function load_player(playerName, playerId){
  var tempPlayer={};

  player = new YT.Player(playerId, {
    height: '315',
    width: '560',
    videoId: '_08UJ0aYDCk',
    playerVars: {
        'autoplay': 0,
        'rel': 0,
        'showinfo': 0,
        'autohide': 1,
        'modestbranding': 1,
        'controls': 0
    },
    events: {
      'onError': catchError
    }
  });

  tempPlayer[playerName]=player;
  players.push(tempPlayer);
}

function initPlayer(playerName, playerId){
  if (typeof(YT) == 'undefined' || typeof(YT.Player) == 'undefined') {
    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    window.onYouTubePlayerAPIReady = function() {
      load_player(playerName, playerId);
    };
  } else {
    load_player(playerName, playerId);
  }



}

function catchError(event)
{
  if(event.data == 100) console.log("De video bestaat niet meer");
}
