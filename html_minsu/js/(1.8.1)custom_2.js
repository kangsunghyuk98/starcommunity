/*const showValue = (target) => {
    const value = target.value;
    const text =  target.options[target.selectedIndex].text;
    
    console.log(value, text);
  }
*/

function handleOnChange0(e) {
  // 선택된 데이터의 텍스트값 가져오기
  const text = e.options[e.selectedIndex].text;
    
  console.log(e.options);
    
  // 선택한 텍스트 출력
  document.getElementById('result0').innerText
  = text;
}

function handleOnChange1(e) {
  const text = e.options[e.selectedIndex].text;  
  console.log(e.options);

  document.getElementById('result1').innerText = text;
}

function handleOnChange2(e) {
  const text = e.options[e.selectedIndex].text;  
  console.log(e.options);

  document.getElementById('result2').innerText = text;
}

function handleOnChange3(e) {
  const text = e.options[e.selectedIndex].text;  
  console.log(e.options);

  document.getElementById('result3').innerText = text;
}

function handleOnChange4(e) {
  const text = e.options[e.selectedIndex].text;  
  console.log(e.options);

  document.getElementById('result4').innerText = text;
}

function handleOnChange5(e) {
  const text = e.options[e.selectedIndex].text;  
  console.log(e.options);

  document.getElementById('result5').innerText = text;
}