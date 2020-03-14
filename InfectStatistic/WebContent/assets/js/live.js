init();

function init() {
    var imgs = document.getElementsByTagName("img");
    for(var i=0; i<imgs.length; i++) {
        imgs[i].onclick = clickEvents;
    }
}

var ids = ["frontline", "cctv" ,"hubei", "people"];
var urls = [
    "http://livechina.cctv.com/zby/index.shtml?spm=C04362.PAup3mg36SVX.ETYxjxdiAIXp.1&id=INTEMyrWwhSrJyHyuMmILpsz200129",
    "http://tv.cctv.com/live/",
    "http://tv.cntv.cn/live/hubei/",
    "http://live.weibo.com/show?id=1042152:f87ee766547f114d28b4f90b3d19a9c7"
]

function clickEvents() {
    var id = event.srcElement.id;
    for(var i=0; i< ids.length; i++) {
        if(id == ids[i]) {
            window.location.href = urls[i];
            return;
        }
    }
}