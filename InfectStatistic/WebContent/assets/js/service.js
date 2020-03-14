init();

function init() {
    var imgs = document.getElementsByTagName("img");
    for(var i=0; i<imgs.length; i++) {
        imgs[i].onclick = clickEvents;
    }
}

var ids = ["hanhong", "hubeired" ,"chinared", "backwork", "family", "temperature", "mental"];
var urls = [
    "http://www.hhax.org/",
    "http://www.hbsredcross.org.cn/",
    "https://www.redcross.org.cn/",
    "https://expert.baidu.com/med/template/#/pages/speTopic/activity/detail/index?pd=med&openapi=1&from_sf=1&resource_id=5216&vn=med&title=%E6%97%A0%E7%97%87%E7%8A%B6%E9%A1%BB%E7%9F%A5%E7%AF%87&people=normal&tab=18&tabname=%E8%BF%94%E5%B7%A5%E5%92%8C%E8%BF%94%E7%A8%8B%E7%9A%84%E5%BA%94%E5%AF%B9%E9%94%A6%E5%9B%8A&atn=saripeople&lid=2015526289&referlid=3373922387&_=jir6yaik52",
    "https://expert.baidu.com/med/template/#/pages/speTopic/activity/detail/index?pd=med&openapi=1&from_sf=1&resource_id=5216&vn=med&title=%E6%97%A0%E7%97%87%E7%8A%B6%E9%A1%BB%E7%9F%A5%E7%AF%87&people=normal&tabname=%E9%85%92%E7%B2%BE%E5%92%8C%E6%B6%88%E6%AF%92%E6%B6%B2%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95%E9%9B%86%E8%AE%AD%E8%90%A5&tab=17&atn=saripeople&lid=2015526289&referlid=3440273285&_=rco98fgo3dd",
    "https://expert.baidu.com/med/template/#/pages/speTopic/activity/detail/index?pd=med&openapi=1&from_sf=1&resource_id=5216&vn=med&title=%E5%AF%86%E6%8E%A5%E8%80%85%E8%87%AA%E6%9F%A5%E7%AF%87&people=touch&tabname=%E4%BD%93%E6%B8%A9%E6%B5%8B%E9%87%8F%E5%B0%8F%E8%B4%B4%E5%A3%AB&tab=5&atn=saripeople&lid=2015526289&referlid=3448210247&_=71c4td3fry3",
    "https://expert.baidu.com/med/template/#/pages/speTopic/activity/detail/index?pd=med&openapi=1&from_sf=1&resource_id=5216&vn=med&title=%E7%96%91%E4%BC%BC%E8%80%85%E6%8C%87%E5%8D%97%E7%AF%87&people=doubt&tabname=%E5%BF%83%E7%90%86%E8%87%AA%E5%8A%A9%E6%89%8B%E5%86%8C&tab=6&atn=saripeople&lid=2015526289&referlid=3450697552&_=x1w69lklnpn"
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