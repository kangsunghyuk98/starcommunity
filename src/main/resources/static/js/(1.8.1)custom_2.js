/*const showValue = (target) => {
    const value = target.value;
    const text =  target.options[target.selectedIndex].text;
    
    console.log(value, text);
  }
*/
let text0 = "";
let text1 = "";
let text2 = "";
let text3 = "";
let text4 = "";
let text5 = "";
let text6 = "";
let text7 = "";
let text8 = "";
let text9 = "";
let text10 = "";
let text11 = "";
let text12 = "";
let text13 = "";
let text14 = "";
let text15 = "";
let text16 = "";
let text17 = "";
let text18 = "";
let text19 = "";
let text20 = "";
let recipe_txt = "";

function handleOnChange0(e) {
  // 선택된 데이터의 텍스트값 가져오기
  text0 = "사이즈는 " +  e.options[e.selectedIndex].text + "로 주시구요" ;
    
  /*console.log(e.options);*/
    
  // 선택한 텍스트 출력
  document.getElementById('result0').innerText
  = text0;
}

function handleOnChange1(e) {
  text1 ="커피는 " + e.options[e.selectedIndex].text + "(을)를 " ;   
  /*console.log(e.options);*/

  document.getElementById('result1').innerText = text1;
  return text1;
}

function handleOnChange2(e) {

  text2 =  e.options[e.selectedIndex].text + " 샷 추가해 주세요";  
  
  /*console.log(e.options);*/

  document.getElementById('result2').innerText = text2;
  return text2;
}

function handleOnChange3(e) {
  text3 ="프라푸치노 시럽은 " + e.options[e.selectedIndex].text + " (으)로 추가하겠습니다";  
  /*console.log(e.options);*/

  document.getElementById('result3').innerText = text3;
  return text3;
}
function handleOnChange4(e) {
  text4 = "시럽은 " + e.options[e.selectedIndex].text  ;  
  /*console.log(e.options);*/

  document.getElementById('result4').innerText = text4;
  return text4;
}

function handleOnChange5(e) {
if(e.options[e.selectedIndex].text=="없이"){
	text5 =" (은)는 빼고 주세요"; 
}else{
 	 text5 =e.options[e.selectedIndex].text + " 추가해 주세요";  
}
  /*console.log(e.options);*/

  document.getElementById('result5').innerText = text5;
  return text5;
}

function handleOnChange6(e) {
  text6 = "그리고  " + e.options[e.selectedIndex].text + " 도 "  ;  
  /*console.log(e.options);*/

  document.getElementById('result6').innerText = text6;
  return text6;
}

function handleOnChange7(e) {
  text7 = e.options[e.selectedIndex].text + " 추가해주세요"  ;  
  /*console.log(e.options);*/

  document.getElementById('result7').innerText = text7;
  return text7;
}


function handleOnChange8(e) {
  text8 ="티는 " + e.options[e.selectedIndex].text + " (으)로 할게요";  
  /*console.log(e.options);*/

  document.getElementById('result8').innerText = text8;
  return text8;
}

function handleOnChange9(e) {
if(e.options[e.selectedIndex].text=="없이"){
	text9 = "그리고 우유는 선택하지 않을게요";
}else{

  text9 = "그리고 우유는 " + e.options[e.selectedIndex].text + "(으)로 하겠습니다"; 
 }  
  /*console.log(e.options);*/

  document.getElementById('result9').innerText = text9;
  return text9;
}

function handleOnChange10(e) {
  text10 = "얼음은 " + e.options[e.selectedIndex].text + "(으로) 주세요";  
  /*console.log(e.options);*/

  document.getElementById('result10').innerText = text10;
  return text10;
}

function handleOnChange11(e) {
  text11 = "자바칩은 " + e.options[e.selectedIndex].text  ;  
  /*console.log(e.options);*/

  document.getElementById('result11').innerText = text11;
  return text11;
}

function handleOnChange12(e) {

  text12 = e.options[e.selectedIndex].text + " 추가하는 걸로 할게요";  
  /*console.log(e.options);*/

  document.getElementById('result12').innerText = text12;
  return text12;
}

function handleOnChange13(e) {
  text13 = "휘핑크림은 " + e.options[e.selectedIndex].text + "을";  
  /*console.log(e.options);*/

  document.getElementById('result13').innerText = text13;
  return text13;
}

function handleOnChange14(e) {
  text14 =" "+ e.options[e.selectedIndex].text + " (으)로 하겠습니다";  
  /*console.log(e.options);*/

  document.getElementById('result14').innerText = text14;
  return text14;
}

function handleOnChange15(e) {
  text15 = "카라멜 드리즐은 " + e.options[e.selectedIndex].text + "(으로) 주세요";  
  /*console.log(e.options);*/

  document.getElementById('result15').innerText = text15;
  return text15;
}

function handleOnChange16(e) {
  text16 = "그리고 초콜릿 드리즐은 "+ e.options[e.selectedIndex].text + " (으)로 선택할게요";  
  /*console.log(e.options);*/

  document.getElementById('result16').innerText = text16;
  return text16;
}

function handleOnChange17(e) {
  text17 = "추가로 민트 초콜릿 칩 파우더는 " + e.options[e.selectedIndex].text + " (으로) 주세요";  
  /*console.log(e.options);*/

  document.getElementById('result17').innerText = text17;
  return text17;
}

function handleOnChange18(e) {
  text18 = "추가로 망고 주스는 " + e.options[e.selectedIndex].text + " (으로) 주세요";  
  /*console.log(e.options);*/

  document.getElementById('result18').innerText = text18;
  return text18;
}

function handleOnChange19(e) {
  text19 = "그리고 유기농 말차는 " + e.options[e.selectedIndex].text + " 추가해 주세요 ";  
  /*console.log(e.options);*/

  document.getElementById('result19').innerText = text19;
  return text19;
}

function handleOnChange20(e) {
  text20 = "그리고 에스프레소 칩 토핑은 " + e.options[e.selectedIndex].text + " (으로) 주세요";  
  /*console.log(e.options);*/

  document.getElementById('result20').innerText = text20;
  return text20;
}

function recipe_txt_func() {
	recipe_txt = text0 + " " + text1 + " " + text2 + " " + text3 + " " + text4 + " " + text5 + " " + text6 + " " + text7 + " " + text8 + " " + text9 + " " + text10 + " " + text11 + " " + text12 + " " + text13 + " " + text14 + " " + text15 + " " + text16 + " " + text17 + " " + text18 + " " + text19 + " " + text20 ;
	console.log(recipe_txt);
	return recipe_txt;
}