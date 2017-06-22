function ExecuteScript(strId)
{
  switch (strId)
  {
      case "6ABHHOP1Z6k":
        Script1();
        break;
      case "68vWfb9jbjF":
        Script2();
        break;
      case "6B6ACpt6Fkb":
        Script3();
        break;
  }
}

function Script1()
{
  var currentTime = new Date()
var month = currentTime.getMonth() + 1
var day = currentTime.getDate()
var year = currentTime.getFullYear()
var dateString=month + "/" + day + "/" + year
var player = GetPlayer();
player.SetVar("SystemDate",dateString);
}

function Script2()
{
      var player = GetPlayer();
    var vnumber = player.GetVar("ViolationNumber");
    window.location.href = "../../reducePenalty/" + vnumber;

}

function Script3()
{
  if (document.location.href.indexOf('html5') < 0) {
GetPlayer().printSlide()
} else {
if(!window.hasPrintStyle){
window.hasPrintStyle = true;
var css = '@media print {body * {visibility: hidden;}#slidecontainer, #slidecontainer * {visibility: visible;}#slidecontainer {position: absolute;left: 0;top: 0; }#slideframe {overflow: visible;}}',
head = document.head || document.getElementsByTagName('head')[0],
style = document.createElement('style');
style.type = 'text/css';
if (style.styleSheet){
style.styleSheet.cssText = css;
} else {
style.appendChild(document.createTextNode(css));
}
head.appendChild(style);
}
var whereNow = $("#slidecontainer").offset();
$("#slidecontainer").offset({top:0,left:0});
window.print();
$("#slidecontainer").offset(whereNow);
}
}

