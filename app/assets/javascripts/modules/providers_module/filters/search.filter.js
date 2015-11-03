providers_module.filter('searchProvider', function(){
  return function (providers, filterData) {

    if(filterData == undefined){
      return providers;
    }

    var keys = Object.keys(filterData);
    var filtered = [];
    var isValid=true; 

    for (var i = 0; i < providers.length; i++) {

      var provider = providers[i];
      isValid = true;

      for(var j = 0; j < keys.length ; j++){ // Explorar los filtros
        
        // Si hay informacion en el filtro
        
        if(filterData[keys[j]] != undefined && String(filterData[keys[j]]) != "" ){
            if (keys[j]=='locations') {
                 isValid = isValid &&  contains(filterData[keys[j]], provider[keys[j]]);
            }

            if (keys[j]=='states') {
                 isValid = isValid &&  contains(filterData[keys[j]], provider[keys[j]]);
            }

            if (keys[j]=='sizes'){
                
                temp_valid = true;
                for(var i=0; i < filterData[keys[j]].length; i++){
                  temp_valid = temp_valid &&  (String(filterData[keys[j]]) == "");
                }
                
                if (temp_valid){
                  isValid = isValid && true;
                } else {
                  isValid = isValid &&  contains(filterData[keys[j]], provider[keys[j]]);
                }
              
                
            }

            if (keys[j] == 'price'){
                isValid = isValid &&  (parseFloat(provider[keys[j]]) > parseFloat(filterData[keys[j]].min) && parseFloat(provider[keys[j]]) < parseFloat(filterData[keys[j]].max));
            }

            if (keys[j] == 'number_of'){
                isValid = isValid &&  (parseFloat(provider[keys[j]]) > parseFloat(filterData[keys[j]]));
            }

            if (keys[j] == 'sel_service'){
                 isValid = isValid &&  contains(filterData[keys[j]], provider[keys[j]]);
            }

        }
      }

      if(isValid){
        //markersArray.push({latitude: provider.latitude, longitude: provider.longitude, id: provider.id, icon: 'assets/huella-mensaje-17-mini.png'});
        //console.log(markersArray);
        filtered.push(provider);
      }

    }
 
    return filtered;
  };
});


function contains(filterData, originData){
  var is_valid=false;
  for(var i=0; i < filterData.length; i++){
    item = filterData[i];
    for(var j=0; j < originData.length; j++){
      item_origin = originData[j];
      if (String(item_origin) == String(item)){
        is_valid = true;
      }
    }
  }
  return is_valid;
}
