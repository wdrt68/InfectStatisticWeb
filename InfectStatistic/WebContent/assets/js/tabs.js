var buttons;
var tabs;

initialize();

function initialize()
{
    buttons = document.getElementById('buttons').getElementsByTagName('button');
    tabs = document.getElementById('mapArea').getElementsByClassName('tab');
    tabs[0].className = 'showed';
    changeTab();
}

function changeTab() {
    for(var i=0; i<buttons.length; i++) 
        buttons[i].onclick = showTab;
}

function showTab() {
    for(var i = 0; i<buttons.length; i++) {
        if(buttons[i] === event.srcElement) {
            tabs[i].className = 'showed';
        } 
        else {
            tabs[i].className = 'tab';
        }
    }
}
