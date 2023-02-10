
	
		
		var nameNow = window.location.search;
		const urlParams = new URLSearchParams(nameNow);
		const name1 = urlParams.get('name');
		console.log(name1);	
		//더블 에스프레소 칩 프라푸치노
		if(name1 =='민트 초콜릿 칩 블렌디드' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#coffee3_li').hide();
				$("#syrup_li option[value='strawberry']").prop('disabled',true).hide();
				$("#syrup_li option[value='frappuccino']").prop('disabled',true).hide();
				$("#syrup_li option[value='whiteMocha']").prop('disabled',true).hide();
				$("#syrup_li option[value='classic']").prop('disabled',true).hide();
				$('#syrup2_li').hide();
				$('#syrup3_li').hide();
				$('#tea_li').hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();
				$('#drizzle2_li').hide();		
				$('#etc2_li').hide();
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result =='1' || result =='3'){
					$("#coffee1_li option[value='2']").prop('disabled',true).hide();
					$('#coffee2_li').prop('disabled',true).hide();
					$('#coffee3_li').show();
				}else if(result=='2'){
				$("#coffee1_li option[value='1']").prop('disabled',true).hide();
				$("#coffee1_li option[value='3']").prop('disabled',true).hide();
					$('#coffee2_li').show();
					$('#coffee3_li').prop('disabled',true).hide();
				}
			
			});
			
			$("#syrup_li").change(function(){
				var result = $('#syrup_li option:selected').val();
				if(result!==null){
					$('#syrup2_li').show();
				}
		    });
			$("#java_chip1_li").change(function(){
				var result = $('#sjava_chip1_li option:selected').val();
				if(result!==null){
					$('#java_chip2_li').show();
				}
			});
			$("#whippedcream1_li").change(function(){
				var result = $('#whippedcream1_li option:selected').val();
				if(result!==null){
					$('#whippedcream2_li').show();
				}
			});
			$("#drizzle1_li").change(function(){
				var result = $('#drizzle1_li option:selected').val();
				if(result!==null){
					$('#drizzle2_li').show();
				}
			});
			
	   }); 
			
	}
		if(name1 =='딸기 딜라이트 요거트 블렌디드' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#coffee3_li').hide();
				$('#syrup2_li').hide();
				$('#syrup3_li').hide();
				$("#syrup_li option[value='mocha']").prop('disabled',true).hide();
				$("#syrup_li option[value='whiteMocha']").prop('disabled',true).hide();
				$("#syrup_li option[value='frappuccino']").prop('disabled',true).hide();
				$("#syrup_li option[value='classic']").prop('disabled',true).hide();
				$('#tea_li').hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();
				$('#drizzle2_li').hide();	
				$('#etc1_li').hide();
				$('#etc2_li').hide();
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result =='1' || result =='3'){
					$("#coffee1_li option[value='2']").prop('disabled',true).hide();
					$('#coffee2_li').prop('disabled',true).hide();
					$('#coffee3_li').show();
				}else if(result=='2'){
				$("#coffee1_li option[value='1']").prop('disabled',true).hide();
				$("#coffee1_li option[value='3']").prop('disabled',true).hide();
					$('#coffee2_li').show();
					$('#coffee3_li').prop('disabled',true).hide();
				}
			
			});
			
			$("#syrup_li").change(function(){
				var result = $('#syrup_li option:selected').val();
				if(result!==null){
					$('#syrup2_li').show();
				}
		    });
			$("#java_chip1_li").change(function(){
				var result = $('#sjava_chip1_li option:selected').val();
				if(result!==null){
					$('#java_chip2_li').show();
				}
			});
			$("#whippedcream1_li").change(function(){
				var result = $('#whippedcream1_li option:selected').val();
				if(result!==null){
					$('#whippedcream2_li').show();
				}
			});
			$("#drizzle1_li").change(function(){
				var result = $('#drizzle1_li option:selected').val();
				if(result!==null){
					$('#drizzle2_li').show();
				}
			});
			
	   }); 
			
	}
		
		if(name1 =='망고 바나나 블렌디드' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#coffee3_li').hide();
				$('#syrup2_li').hide();
				$('#syrup3_li').hide();
				$("#syrup_li option[value='mocha']").prop('disabled',true).hide();
				$("#syrup_li option[value='whiteMocha']").prop('disabled',true).hide();
				$("#syrup_li option[value='frappuccino']").prop('disabled',true).hide();
				$("#syrup_li option[value='dolce']").prop('disabled',true).hide();
				$("#syrup_li option[value='strawberry']").prop('disabled',true).hide();
				$("#syrup_li option[value='classic']").prop('disabled',true).hide();
				$('#tea_li').hide();
				$('#whippedcream2_li').hide();
				$('#drizzle2_li').hide();	
				$('#etc1_li').hide();				
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result =='1' || result =='3'){
					$("#coffee1_li option[value='2']").prop('disabled',true).hide();
					$('#coffee2_li').prop('disabled',true).hide();
					$('#coffee3_li').show();
				}else if(result=='2'){
				$("#coffee1_li option[value='1']").prop('disabled',true).hide();
				$("#coffee1_li option[value='3']").prop('disabled',true).hide();
					$('#coffee2_li').show();
					$('#coffee3_li').prop('disabled',true).hide();
				}
			
			});
			
			$("#syrup_li").change(function(){
				var result = $('#syrup_li option:selected').val();
				if(result!==null){
					$('#syrup2_li').show();
				}
		    });
			$("#java_chip1_li").change(function(){
				var result = $('#sjava_chip1_li option:selected').val();
				if(result!==null){
					$('#java_chip2_li').show();
				}
			});
			$("#whippedcream1_li").change(function(){
				var result = $('#whippedcream1_li option:selected').val();
				if(result!==null){
					$('#whippedcream2_li').show();
				}
			});
			$("#drizzle1_li").change(function(){
				var result = $('#drizzle1_li option:selected').val();
				if(result!==null){
					$('#drizzle2_li').show();
				}
			});
			
	   }); 
			
	}
		
		if(name1 =='망고 패션 프루트 블렌디드' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#coffee3_li').hide();
				$('#syrup2_li').hide();
				$('#syrup3_li').hide();
				$("#syrup_li option[value='mocha']").prop('disabled',true).hide();
				$("#syrup_li option[value='whiteMocha']").prop('disabled',true).hide();
				$("#syrup_li option[value='frappuccino']").prop('disabled',true).hide();
				$("#syrup_li option[value='dolce']").prop('disabled',true).hide();
				$("#syrup_li option[value='strawberry']").prop('disabled',true).hide();
				$("#syrup_li option[value='classic']").prop('disabled',true).hide();				
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();
				$('#drizzle2_li').hide();	
				$('#etc1_li').hide();				
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result =='1' || result =='3'){
					$("#coffee1_li option[value='2']").prop('disabled',true).hide();
					$('#coffee2_li').prop('disabled',true).hide();
					$('#coffee3_li').show();
				}else if(result=='2'){
				$("#coffee1_li option[value='1']").prop('disabled',true).hide();
				$("#coffee1_li option[value='3']").prop('disabled',true).hide();
					$('#coffee2_li').show();
					$('#coffee3_li').prop('disabled',true).hide();
				}
			
			});
			
			$("#syrup_li").change(function(){
				var result = $('#syrup_li option:selected').val();
				if(result!==null){
					$('#syrup2_li').show();
				}
		    });
			$("#java_chip1_li").change(function(){
				var result = $('#sjava_chip1_li option:selected').val();
				if(result!==null){
					$('#java_chip2_li').show();
				}
			});
			$("#whippedcream1_li").change(function(){
				var result = $('#whippedcream1_li option:selected').val();
				if(result!==null){
					$('#whippedcream2_li').show();
				}
			});
			$("#drizzle1_li").change(function(){
				var result = $('#drizzle1_li option:selected').val();
				if(result!==null){
					$('#drizzle2_li').show();
				}
			});
			
	   }); 
			
	}
		
		if(name1 =='더블 에스프레소 칩 프라푸치노' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#coffee3_li').hide();
				$('#syrup2_li').hide();
				$('#syrup3_li').hide();
				$("#syrup_li option[value='mocha']").prop('disabled',true).hide();
				$("#syrup_li option[value='whiteMocha']").prop('disabled',true).hide();				
				$("#syrup_li option[value='dolce']").prop('disabled',true).hide();
				$("#syrup_li option[value='strawberry']").prop('disabled',true).hide();
				$("#syrup_li option[value='classic']").prop('disabled',true).hide();
				$('#tea_li').hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();
				$('#drizzle2_li').hide();	
				$('#etc1_li').hide();	
				$('#etc2_li').hide();	
				$('#etc3_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result =='1' || result =='3'){
					$("#coffee1_li option[value='2']").prop('disabled',true).hide();
					$('#coffee2_li').prop('disabled',true).hide();
					$('#coffee3_li').show();
				}else if(result=='2'){
				$("#coffee1_li option[value='1']").prop('disabled',true).hide();
				$("#coffee1_li option[value='3']").prop('disabled',true).hide();
					$('#coffee2_li').show();
					$('#coffee3_li').prop('disabled',true).hide();
				}
			
			});
			
			$("#syrup_li").change(function(){
				var result = $('#syrup_li option:selected').val();
				if(result=='frappuccino'){
					$("#syrup_li option").prop('selected',false).hide();
					$('#syrup3_li').show();
					$('#syrup2_li').hide();
				}else{
					$("#syrup_li option[value='frappuccino']").prop('disabled',true).hide();
					$('#syrup2_li').show();
					$('#syrup3_li').hide();
				}
		    });
			$("#java_chip1_li").change(function(){
				var result = $('#sjava_chip1_li option:selected').val();
				if(result!==null){
					$('#java_chip2_li').show();
				}
			});
			$("#whippedcream1_li").change(function(){
				var result = $('#whippedcream1_li option:selected').val();
				if(result!==null){
					$('#whippedcream2_li').show();
				}
			});
			$("#drizzle1_li").change(function(){
				var result = $('#drizzle1_li option:selected').val();
				if(result!==null){
					$('#drizzle2_li').show();
				}
			});
			
	   }); 
			
	}
		
		if(name1 =='제주 유기농 말차로 만든 크림 프라푸치노' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#coffee3_li').hide();
				$('#syrup2_li').hide();
				$('#syrup3_li').hide();
				$("#syrup_li option[value='mocha']").prop('disabled',true).hide();
				$("#syrup_li option[value='whiteMocha']").prop('disabled',true).hide();				
				$("#syrup_li option[value='dolce']").prop('disabled',true).hide();
				$("#syrup_li option[value='strawberry']").prop('disabled',true).hide();				
				$('#tea_li').hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();
				$('#drizzle2_li').hide();	
				$('#etc1_li').hide();				
				$('#etc2_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result =='1' || result =='3'){
					$("#coffee1_li option[value='2']").prop('disabled',true).hide();
					$('#coffee2_li').prop('disabled',true).hide();
					$('#coffee3_li').show();
				}else if(result=='2'){
				$("#coffee1_li option[value='1']").prop('disabled',true).hide();
				$("#coffee1_li option[value='3']").prop('disabled',true).hide();
					$('#coffee2_li').show();
					$('#coffee3_li').prop('disabled',true).hide();
				}
			
			});
			
			$("#syrup_li").change(function(){
				var result = $('#syrup_li option:selected').val();
				if(result=='frappuccino'){
					$("#syrup_li option").prop('selected',false).hide();
					$('#syrup3_li').show();
					$('#syrup2_li').hide();
				}else{
					$("#syrup_li option[value='frappuccino']").prop('disabled',true).hide();
					$('#syrup2_li').show();
					$('#syrup3_li').hide();
				}
		    });
			$("#java_chip1_li").change(function(){
				var result = $('#sjava_chip1_li option:selected').val();
				if(result!==null){
					$('#java_chip2_li').show();
				}
			});
			$("#whippedcream1_li").change(function(){
				var result = $('#whippedcream1_li option:selected').val();
				if(result!==null){
					$('#whippedcream2_li').show();
				}
			});
			$("#drizzle1_li").change(function(){
				var result = $('#drizzle1_li option:selected').val();
				if(result!==null){
					$('#drizzle2_li').show();
				}
			});
			
	   }); 
			
	}
		
		if(name1 =='자바 칩 프라푸치노'|| name1 =='초콜릿 크림 칩 프라푸치노'|| name1 =='모카 프라푸치노' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#coffee3_li').hide();
				$('#syrup2_li').hide();
				$('#syrup3_li').hide();				
				$("#syrup_li option[value='whiteMocha']").prop('disabled',true).hide();				
				$("#syrup_li option[value='dolce']").prop('disabled',true).hide();
				$("#syrup_li option[value='strawberry']").prop('disabled',true).hide();
				$("#syrup_li option[value='classic']").prop('disabled',true).hide();
				$('#tea_li').hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();
				$('#drizzle2_li').hide();	
				$('#etc1_li').hide();				
				$('#etc2_li').hide();
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result =='1' || result =='3'){
					$("#coffee1_li option[value='2']").prop('disabled',true).hide();
					$('#coffee2_li').prop('disabled',true).hide();
					$('#coffee3_li').show();
				}else if(result=='2'){
				$("#coffee1_li option[value='1']").prop('disabled',true).hide();
				$("#coffee1_li option[value='3']").prop('disabled',true).hide();
					$('#coffee2_li').show();
					$('#coffee3_li').prop('disabled',true).hide();
				}
			
			});
			
			$("#syrup_li").change(function(){
				var result = $('#syrup_li option:selected').val();
				if(result=='frappuccino'){
					$("#syrup_li option").prop('selected',false).hide();
					$('#syrup3_li').show();
					$('#syrup2_li').hide();
				}else{
					$("#syrup_li option[value='frappuccino']").prop('disabled',true).hide();
					$('#syrup2_li').show();
					$('#syrup3_li').hide();
				}
		    });
			$("#java_chip1_li").change(function(){
				var result = $('#sjava_chip1_li option:selected').val();
				if(result!==null){
					$('#java_chip2_li').show();
				}
			});
			$("#whippedcream1_li").change(function(){
				var result = $('#whippedcream1_li option:selected').val();
				if(result!==null){
					$('#whippedcream2_li').show();
				}
			});
			$("#drizzle1_li").change(function(){
				var result = $('#drizzle1_li option:selected').val();
				if(result!==null){
					$('#drizzle2_li').show();
				}
			});
			
	   }); 
			
	}
		
		if(name1 =='화이트 초콜릿 모카 프라푸치노' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#coffee3_li').hide();
				$('#syrup2_li').hide();
				$('#syrup3_li').hide();				
				$("#syrup_li option[value='mocha']").prop('disabled',true).hide();				
				$("#syrup_li option[value='dolce']").prop('disabled',true).hide();
				$("#syrup_li option[value='strawberry']").prop('disabled',true).hide();
				$("#syrup_li option[value='classic']").prop('disabled',true).hide();
				$('#tea_li').hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();
				$('#drizzle2_li').hide();	
				$('#etc1_li').hide();				
				$('#etc2_li').hide();
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result =='1' || result =='3'){
					$("#coffee1_li option[value='2']").prop('disabled',true).hide();
					$('#coffee2_li').prop('disabled',true).hide();
					$('#coffee3_li').show();
				}else if(result=='2'){
				$("#coffee1_li option[value='1']").prop('disabled',true).hide();
				$("#coffee1_li option[value='3']").prop('disabled',true).hide();
					$('#coffee2_li').show();
					$('#coffee3_li').prop('disabled',true).hide();
				}
			
			});
			
			$("#syrup_li").change(function(){
				var result = $('#syrup_li option:selected').val();
				if(result=='frappuccino'){
					$("#syrup_li option").prop('selected',false).hide();
					$('#syrup3_li').show();
					$('#syrup2_li').hide();
				}else{
					$("#syrup_li option[value='frappuccino']").prop('disabled',true).hide();
					$('#syrup2_li').show();
					$('#syrup3_li').hide();
				}
		    });
			$("#java_chip1_li").change(function(){
				var result = $('#sjava_chip1_li option:selected').val();
				if(result!==null){
					$('#java_chip2_li').show();
				}
			});
			$("#whippedcream1_li").change(function(){
				var result = $('#whippedcream1_li option:selected').val();
				if(result!==null){
					$('#whippedcream2_li').show();
				}
			});
			$("#drizzle1_li").change(function(){
				var result = $('#drizzle1_li option:selected').val();
				if(result!==null){
					$('#drizzle2_li').show();
				}
			});
			
	   }); 
			
	}
		
		if(name1 =='카라멜 프라푸치노' || name1 =='에스프레소 프라푸치노' || name1 =='바닐라 크림 프라푸치노' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#coffee3_li').hide();
				$('#syrup2_li').hide();
				$('#syrup3_li').hide();			
				$("#syrup_li option[value='mocha']").prop('disabled',true).hide();	
				$("#syrup_li option[value='whiteMocha']").prop('disabled',true).hide();				
				$("#syrup_li option[value='dolce']").prop('disabled',true).hide();
				$("#syrup_li option[value='strawberry']").prop('disabled',true).hide();
				$("#syrup_li option[value='classic']").prop('disabled',true).hide();
				$('#tea_li').hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();
				$('#drizzle2_li').hide();	
				$('#etc1_li').hide();				
				$('#etc2_li').hide();
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result =='1' || result =='3'){
					$("#coffee1_li option[value='2']").prop('disabled',true).hide();
					$('#coffee2_li').prop('disabled',true).hide();
					$('#coffee3_li').show();
				}else if(result=='2'){
				$("#coffee1_li option[value='1']").prop('disabled',true).hide();
				$("#coffee1_li option[value='3']").prop('disabled',true).hide();
					$('#coffee2_li').show();
					$('#coffee3_li').prop('disabled',true).hide();
				}
			
			});
			
			$("#syrup_li").change(function(){
				var result = $('#syrup_li option:selected').val();
				if(result=='frappuccino'){
					$("#syrup_li option").prop('selected',false).hide();
					$('#syrup3_li').show();
					$('#syrup2_li').hide();
				}else{
					$("#syrup_li option[value='frappuccino']").prop('disabled',true).hide();
					$('#syrup2_li').show();
					$('#syrup3_li').hide();
				}
		    });
			$("#java_chip1_li").change(function(){
				var result = $('#sjava_chip1_li option:selected').val();
				if(result!==null){
					$('#java_chip2_li').show();
				}
			});
			$("#whippedcream1_li").change(function(){
				var result = $('#whippedcream1_li option:selected').val();
				if(result!==null){
					$('#whippedcream2_li').show();
				}
			});
			$("#drizzle1_li").change(function(){
				var result = $('#drizzle1_li option:selected').val();
				if(result!==null){
					$('#drizzle2_li').show();
				}
			});
			
	   }); 
			
	}
