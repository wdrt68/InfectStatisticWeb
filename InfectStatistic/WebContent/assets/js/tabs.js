var buttons;
var maps;

window.onload = initialize;

function initialize()
{
    buttons = document.getElementById('buttons').getElementsByTagName('button');
    maps = document.getElementById('mapArea').getElementsByTagName('div');
    changeTab();
}

function changeTab() {
    for(var i=0; i<buttons.length; i++) 
        buttons[i].onclick = showTab;
}

function showTab() {
    for(var i = 0; i<buttons.length; i++) {
        if(buttons[i] === event.srcElement) {
            maps[i].className = 'showed';
        } 
        else {
            maps[i].className = '';
        }
    }
}
