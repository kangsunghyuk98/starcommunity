
	
		
		var nameNow = window.location.search;
		const urlParams = new URLSearchParams(nameNow);
		const name1 = urlParams.get('name');
		console.log(name1);	
		//더블 에스프레소 칩 프라푸치노
		if(name1 =='민트 초콜릿 칩 블렌디드' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#syrupF_li').hide();				
				$("#syrupN_li option[value='whiteMocha']").prop('disabled',true).hide();
				$("#syrupN_li option[value='caramel']").prop('disabled',true).hide();
				$("#syrupN_li option[value='strawberry']").prop('disabled',true).hide();
				$("#syrupN_li option[value='classic']").prop('disabled',true).hide();
				$('#syrupN1_li').hide();
				$('#syrupA1_li').hide();
				$('#tea_li').hide();
				$("#milk_li option[value='none']").prop('disabled',true).hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();						
				$('#etc2_li').hide();
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result!==null){					
					$('#coffee2_li').show();					
				}			
			});
			
			$("#syrupN_li").change(function(){
				var result = $('#syrup_Nli option:selected').val();
				if(result!==null){
					$('#syrupN1_li').show();
				}
		    });
		    $("#syrupA_li").change(function(){
				var result = $('#syrupA_li option:selected').val();
				if(result!==null){
					$('#syrupA1_li').show();
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
			
			
	   }); 
			
	}
		if(name1 =='딸기 딜라이트 요거트 블렌디드' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#syrupF_li').hide();		
				$("#syrupN_li option[value='mocha']").prop('disabled',true).hide();
				$("#syrupN_li option[value='whiteMocha']").prop('disabled',true).hide();
				$("#syrupN_li option[value='caramel']").prop('disabled',true).hide();
				$("#syrupN_li option[value='classic']").prop('disabled',true).hide();
				$('#syrupN1_li').hide();
				$('#syrupA1_li').hide();
				$('#tea_li').hide();
				$('#milk_li').hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();				
				$('#etc1_li').hide();
				$('#etc2_li').hide();
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result!==null){					
					$('#coffee2_li').show();					
				}			
			});
			
			$("#syrupN_li").change(function(){
				var result = $('#syrupN_li option:selected').val();
				if(result!==null){
					$('#syrupN1_li').show();
				}
		    });
		    
		     $("#syrupA_li").change(function(){
				var result = $('#syrupA_li option:selected').val();
				if(result!==null){
					$('#syrupA1_li').show();
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
			
			
	   }); 
			
	}
		
		if(name1 =='망고 바나나 블렌디드' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();				
				$('#syrupF_li').hide();
				$('#syrupN_li').hide();
				$('#syrupN1_li').hide();
				$('#syrupA1_li').hide();
				$('#tea_li').hide();
				$('#whippedcream2_li').hide();				
				$('#etc1_li').hide();				
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result!==null){					
					$('#coffee2_li').show();					
				}			
			});
			
			$("#syrupA_li").change(function(){
				var result = $('#syrupA_li option:selected').val();
				if(result!==null){
					$('#syrupA1_li').show();
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
			
	   }); 
			
	}
		
		if(name1 =='망고 패션 프루트 블렌디드' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();				
				$('#syrupF_li').hide();
				$('#syrupN_li').hide();
				$('#syrupN1_li').hide();
				$('#syrupA1_li').hide();
				$('#milk_li').hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();				
				$('#etc1_li').hide();				
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result!==null){					
					$('#coffee2_li').show();					
				}			
			});
			
			$("#syrupA_li").change(function(){
				var result = $('#syrupA_li option:selected').val();
				if(result!==null){
					$('#syrupA1_li').show();
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
			
			
	   }); 
			
	}
		
		if(name1 =='더블 에스프레소 칩 프라푸치노' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();				
				$('#syrupN_li').hide();
				$('#syrupN1_li').hide();	
				$('#syrupA1_li').hide();				
				$('#tea_li').hide();
				$('#milk_li').hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();				
				$('#etc1_li').hide();	
				$('#etc2_li').hide();	
				$('#etc3_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result!==null){					
					$('#coffee2_li').show();					
				}			
			});
			
			$("#syrupA_li").change(function(){
				var result = $('#syrupA_li option:selected').val();
				if(result!==null){
					$('#syrupA1_li').show();
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
			
	   }); 
			
	}
		
		if(name1 =='제주 유기농 말차로 만든 크림 프라푸치노' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();				
				$('#syrupN1_li').hide();
				$('#syrupA1_li').hide();
				$("#syrupN_li option[value='mocha']").prop('disabled',true).hide();
				$("#syrupN_li option[value='whiteMocha']").prop('disabled',true).hide();				
				$("#syrupN_li option[value='dolce']").prop('disabled',true).hide();
				$("#syrupN_li option[value='caramel']").prop('disabled',true).hide();				
				$("#syrupN_li option[value='strawberry']").prop('disabled',true).hide();					
				$('#tea_li').hide();
				$("#milk_li option[value='none']").prop('disabled',true).hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();				
				$('#etc1_li').hide();				
				$('#etc2_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result!==null){					
					$('#coffee2_li').show();					
				}			
			});
			$("#syrupN_li").change(function(){
				var result = $('#syrupN_li option:selected').val();
				if(result!==null){
					$('#syrupN1_li').show();
				}
		    });
		    
		     $("#syrupA_li").change(function(){
				var result = $('#syrupA_li option:selected').val();
				if(result!==null){
					$('#syrupA1_li').show();
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
			
			
	   }); 
			
	}
		
		if(name1 =='자바 칩 프라푸치노'|| name1 =='초콜릿 크림 칩 프라푸치노'|| name1 =='모카 프라푸치노' ){
			$(document).ready(function() {			
				$('#coffee2_li').hide();				
				$('#syrupN1_li').hide();
				$('#syrupA1_li').hide();				
				$("#syrupN_li option[value='whiteMocha']").prop('disabled',true).hide();				
				$("#syrupN_li option[value='dolce']").prop('disabled',true).hide();
				$("#syrupN_li option[value='caramel']").prop('disabled',true).hide();
				$("#syrupN_li option[value='strawberry']").prop('disabled',true).hide();
				$("#syrupN_li option[value='classic']").prop('disabled',true).hide();
				$("#syrupN1_li option[value='0']").prop('disabled',true).hide();
				$('#tea_li').hide();
				$("#milk_li option[value='none']").prop('disabled',true).hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();				
				$('#etc1_li').hide();				
				$('#etc2_li').hide();
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result!==null){					
					$('#coffee2_li').show();					
				}			
			});
			
			$("#syrupN_li").change(function(){
				var result = $('#syrupN_li option:selected').val();
				if(result!==null){
					$('#syrupN1_li').show();
				}
		    });
		    
		     $("#syrupA_li").change(function(){
				var result = $('#syrupA_li option:selected').val();
				if(result!==null){
					$('#syrupA1_li').show();
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
				$('#syrupN1_li').hide();
				$('#syrupA1_li').hide();				
				$("#syrupN_li option[value='mocha']").prop('disabled',true).hide();				
				$("#syrupN_li option[value='dolce']").prop('disabled',true).hide();
				$("#syrupN_li option[value='caramel']").prop('disabled',true).hide();
				$("#syrupN_li option[value='strawberry']").prop('disabled',true).hide();
				$("#syrupN_li option[value='classic']").prop('disabled',true).hide();
				$("#syrupN1_li option[value='0']").prop('disabled',true).hide();
				$('#tea_li').hide();
				$("#milk_li option[value='none']").prop('disabled',true).hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();				
				$('#etc1_li').hide();				
				$('#etc2_li').hide();
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result!==null){					
					$('#coffee2_li').show();					
				}			
			});
			
			$("#syrupN_li").change(function(){
				var result = $('#syrupN_li option:selected').val();
				if(result!==null){
					$('#syrupN1_li').show();
				}
		    });
		    
		     $("#syrupA_li").change(function(){
				var result = $('#syrupA_li option:selected').val();
				if(result!==null){
					$('#syrupA1_li').show();
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
			
	   }); 
			
	}
		
		if(name1 =='카라멜 프라푸치노'){
			$(document).ready(function() {			
				$('#coffee2_li').hide();				
				$('#syrupN1_li').hide();
				$('#syrupA1_li').hide();			
				$("#syrupN_li option[value='mocha']").prop('disabled',true).hide();	
				$("#syrupN_li option[value='whiteMocha']").prop('disabled',true).hide();				
				$("#syrupN_li option[value='dolce']").prop('disabled',true).hide();
				$("#syrupN_li option[value='strawberry']").prop('disabled',true).hide();
				$("#syrupN_li option[value='classic']").prop('disabled',true).hide();
				$("#syrupN1_li option[value='0']").prop('disabled',true).hide();				
				$("#syrupA_li option[value='caramel']").prop('disabled',true).hide();
				$('#tea_li').hide();
				$("#milk_li option[value='none']").prop('disabled',true).hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();				
				$('#etc1_li').hide();				
				$('#etc2_li').hide();
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result!==null){					
					$('#coffee2_li').show();					
				}			
			});
			
			$("#syrupN_li").change(function(){
				var result = $('#syrupN_li option:selected').val();
				if(result!==null){
					$('#syrupN1_li').show();
				}
		    });
		    
		     $("#syrupA_li").change(function(){
				var result = $('#syrupA_li option:selected').val();
				if(result!==null){
					$('#syrupA1_li').show();
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
			
			
	   }); 
			
	}
	
	if(name1 =='에스프레소 프라푸치노'){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#syrupN_li').hide();				
				$('#syrupN1_li').hide();
				$('#syrupA1_li').hide();				
				$('#tea_li').hide();
				$("#milk_li option[value='none']").prop('disabled',true).hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();				
				$('#etc1_li').hide();				
				$('#etc2_li').hide();
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result!==null){					
					$('#coffee2_li').show();					
				}			
			});
			
			$("#syrupN_li").change(function(){
				var result = $('#syrupN_li option:selected').val();
				if(result!==null){
					$('#syrupN1_li').show();
				}
		    });
		    
		     $("#syrupA_li").change(function(){
				var result = $('#syrupA_li option:selected').val();
				if(result!==null){
					$('#syrupA1_li').show();
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
			
			
	   }); 
			
	}
	
	if(name1 =='바닐라 크림 프라푸치노'){
			$(document).ready(function() {			
				$('#coffee2_li').hide();
				$('#syrupN_li').hide();	
				$('#syrupN1_li').hide();
				$('#syrupA1_li').hide();				
				$('#tea_li').hide();
				$("#milk_li option[value='none']").prop('disabled',true).hide();
				$('#java_chip2_li').hide();
				$('#whippedcream2_li').hide();				
				$('#etc1_li').hide();				
				$('#etc2_li').hide();
				$('#etc3_li').hide();
				$('#topping_li').hide();
				
			$("#coffee1_li").change(function(){
				var result = $('#coffee1 option:selected').val();
				if(result!==null){					
					$('#coffee2_li').show();					
				}			
			});		    
		     $("#syrupA_li").change(function(){
				var result = $('#syrupA_li option:selected').val();
				if(result!==null){
					$('#syrupA1_li').show();
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
			
			
	   }); 
			
	}
	
	
