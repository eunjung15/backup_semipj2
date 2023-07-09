
function taget15(){	
	$("#target15 table tbody tr").each(function(idx, item){
		var a=parseInt($(item).find("td").eq(0).text());
		var b=parseInt($(item).children("td").eq(2).text());
		$(item).children("td").eq(4).text(a+b);		
	});
}

function target17(){
	/*var count=1;
	setInterval(function(){
		var color=(count%2==0?"red":"yellow");
		$("#target17").css("background", color);
		count++;
	},1000);*/

	var bool=false;
	setInterval(function(){
		var color=bool?"red":"yellow";
		$("#target17").css("background", color);
		bool=!bool;
	},1000);
}

function target19(){
	$("#target19").empty();
}


function target16(){
	$("#target16 td").each(function(i){
	    var num=parseInt($(this).text());
	    if(num>10){
	         $(this).css("background","orange"); 
	    }
	});
}


function target18(){
	$("#target18").children(":contains(bold)").css("font-weight","bold");
}



function target20(){
	$("#target20 input:text").css("color","red").attr("readonly","readonly");
}