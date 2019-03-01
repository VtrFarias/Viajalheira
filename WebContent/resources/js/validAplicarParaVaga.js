$(document).ready(function(){
    $("#aplicarVaga").validate({
        rules: {
        	dataIdaa: {
                required: true
            },
            dataVolt: {
            	required: true
            }
        },
        messages: {
        	dataIdaa: {
                required: "Campo obrigatório"
            },
            dataVolt:{
				required:"Campo obrigatorio"
			}
        }
    });
}); 

	$(document).ready(function(){
	    var agora = new Date();
	    var ano = agora.getFullYear();
	    var anoMax = agora.getFullYear()+1;
	    var mes = agora.getMonth()+1;
	    var data = agora.getDate();
	    
	    
	    if(mes < 10) {
	        mes = "0"+mes;
	    }
	    if(data < 10) {
	        data = "0"+data;
	    }
		
	    var hoje = ano+"-"+mes+"-"+data;
	    var dataMax = anoMax+"-"+mes+"-"+data;

	    $("#dataIda").attr("min",hoje);
	    $("#dataIda").attr("max",dataMax);
	    $("#dataVolta").attr("min",hoje);
	    
	    $("#dataIda, #dataVolta").change(function(){
			var dataIdaConfirmada = $("#dataIda").val();
			if(dataIdaConfirmada != null && dataIdaConfirmada != "") {
				var dataIdaConfirmadaDate = new Date(dataIdaConfirmada);
				/////////////////////////DEFININDO 1 SEMANA COMO VALOR MINIMO DE VOLTA, DE ACORDO COM O VALOR INFORMADO DA IDA.
				
				var DataMinVolta = new Date(dataIdaConfirmadaDate.getTime());
				DataMinVolta.setDate(dataIdaConfirmadaDate.getDate() + 7);
				
				var anoMinVoltaConfirmado = DataMinVolta.getFullYear();
				var mesMinVoltaConfirmado = DataMinVolta.getMonth()+1;
				var diaMinVoltaConfirmado = DataMinVolta.getDate();
				
				if(mesMinVoltaConfirmado < 10) {
					mesMinVoltaConfirmado = "0"+mesMinVoltaConfirmado;
				}
				if(diaMinVoltaConfirmado < 10) {
					diaMinVoltaConfirmado = "0"+diaMinVoltaConfirmado;
				}
				
				var minVolta = anoMinVoltaConfirmado+"-"+mesMinVoltaConfirmado+"-"+diaMinVoltaConfirmado;
				
				$("#dataVolta").attr("min",minVolta);

				// END - DEFININDO 1 SEMANA COMO VALOR MINIMO DE VOLTA, DE ACORDO COM O VALOR INFORMADO DA IDA.
				
				///////////////////////////DEFININDO 3 MESES COMO VALOR MAXIM0 DE VOLTA, DE ACORDO COM O VALOR INFORMADO DA IDA.
				var anoConfirmado = dataIdaConfirmadaDate.getFullYear();
				var mesConfirmado = dataIdaConfirmadaDate.getMonth()+1;
				var meslimite = dataIdaConfirmadaDate.getMonth()+4;
				var diaConfirmado = dataIdaConfirmadaDate.getDate();
				
				if(meslimite > 12) {
					anoConfirmado++;
					meslimite = meslimite-12;
				}
				if(meslimite < 10) {
					meslimite = "0"+meslimite;
				}
				if(diaConfirmado < 10) {
					diaConfirmado = "0"+diaConfirmado;
				}
				
				var maxVolta = anoConfirmado+"-"+meslimite+"-"+diaConfirmado;
				
				$("#dataVolta").attr("max",maxVolta);
				// END - DEFININDO 3 MESES COMO VALOR MAXIM0 DE VOLTA, DE ACORDO COM O VALOR INFORMADO DA IDA.
			} 
		});
	});