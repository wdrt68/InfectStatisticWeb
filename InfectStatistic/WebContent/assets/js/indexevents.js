/**
 * 
 */

var dataDate;

window.onload = initialize;

function initialize() {
    dataDate = document.getElementById("dataDate");
    dataDate.onchange = dateChanged;

    var url = window.location.search;
    if(url.indexOf("?") < 0) {
        dataDate.value = "2020-03-13";
    }
    else {
        dataDate.value = url.split("=")[1];
    }

    
}

function dateChanged() {
    var url = "indexServlet";
    location.replace(url + "?dataDate=" + dataDate.value);

}
