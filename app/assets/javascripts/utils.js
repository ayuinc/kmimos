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


$(".ratingStars").ready(function(){
    
 
    var get_score = function(n){
      
      if (isNaN(parseInt(n))){  
         
          $(origin).val(4);
          return 4;  
        
      } else { 
        return n; 
      }
        
    }
  
    $(".ratingStars").raty({
      score: parseInt($(this).attr("score")), 
      click: function(score, evt) { 
        var el = c
        $(el).val(score); 
      },
      starOff : '/assets/icono-hueso-gris.svg',
      starOn  : '/assets/icono-hueso-verde.svg'
    });
   
 
   
});
  
  
  
  
  
  
  
  
  