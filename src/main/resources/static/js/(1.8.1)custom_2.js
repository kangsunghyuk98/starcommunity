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
  text1 = e.options[e.selectedIndex].text + " 추가해 주세요";   
  /*console.log(e.options);*/

  document.getElementById('result1').innerText = text1;
  return text1;
}

function handleOnChange2(e) {
  text2 = "시럽은 " + e.options[e.selectedIndex].text + " 으로 변경해 주세요";  
  /*console.log(e.options);*/

  document.getElementById('result2').innerText = text2;
  return text2;
}

function handleOnChange3(e) {
  text3 = "우유는 " + e.options[e.selectedIndex].text + " 으로 변경해 주세요";;  
  /*console.log(e.options);*/

  document.getElementById('result3').innerText = text3;
  return text3;
}

function handleOnChange4(e) {
  text4 = "얼음은 " + e.options[e.selectedIndex].text + "주세요";  
  /*console.log(e.options);*/

  document.getElementById('result4').innerText = text4;
  return text4;
}

function handleOnChange5(e) {
  text5 = "그리고 휘핑 크림은 " + e.options[e.selectedIndex].text + "주세요";  
  /*console.log(e.options);*/

  document.getElementById('result5').innerText = text5;
  return text5;
}

function recipe_txt_func() {
	recipe_txt = text0 + " " + text1 + " " + text2 + " " + text3 + " " + text4 + " " + text5;
	/*console.log(txt);*/
	return recipe_txt;
}