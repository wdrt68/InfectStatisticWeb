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
        //var time = new Date();
        //var day = ("0" + time.getDate()).slice(-2);
        //var month = ("0" + (time.getMonth() + 1)).slice(-2);
    
        //dataDate.value = time.getFullYear() + "-" + month + "-" + day;
        dataDate.value = "2020-03-12";
    }
    else {
        dataDate.value = url.split("=")[1];
    }

    
}

function dateChanged() {
    var url = "indexServlet";
    location.replace(url + "?dataDate=" + dataDate.value);

}
