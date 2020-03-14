/**
 * 
 */

var dataDate;
var name;

initialize();

function initialize() {
    dataDate = document.getElementById("dataDate");
    dataDate.onchange = dateChanged;
    
    if(getQueryVariable("dataDate") == false) {
    	dataDate.value = "2020-03-13";
    }
    else {
    	dataDate.value = getQueryVariable("dataDate");
    }
    
    name = getQueryVariable("name");
}

function dateChanged() {
    var url = "detialServlet";
    location.replace(url +"?name="+name + "&dataDate="+dataDate.value);
    
}


function getQueryVariable(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
}
