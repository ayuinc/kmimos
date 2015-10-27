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

$(this).attr('score')

$(".ratingStars").ready(function(){
     
    $(".ratingStars").raty({
      score: function() {
        var el = $(this).attr('el');
        $(el).val($(this).attr('score'));
        $(el).hide();
        return $(this).attr('score');
      }, 
      click: function(score, evt) {
        var el = $(this).attr('el');
        $(el).val(score);
      },
      starOff : '/assets/icono-hueso-gris.svg',
      starOn  : '/assets/icono-hueso-verde.svg'
    });
   
 
   
});
  
  
  
  
  
  
  
  
  