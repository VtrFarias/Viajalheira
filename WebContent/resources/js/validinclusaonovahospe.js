$(document).ready(function(){
    $("#formulariohos").validate({
        rules: {
        	tipovaga: {
                required: true
            },
            titulo: {
            	required: true,
    			minlength: 5,
    			maxlength: 100
            },
            descricao: {
    			required: true,
    			minlength: 5,
    			maxlength: 250
    		},
    		beneficio: {
    			required: true
    		
    		},
    		tempoMinimoSemanas: {
    			required: true,

    		},
    		tempoMaximoSemanas: {
    			required: true,

    		},
    		horasTrabalhoSemanal: {
    			required: true,
    			minlength: 1,
    			maxlength: 2
    		},
    		rua: {
    			required: true,
    			minlength: 2,
    			maxlength: 150
    		},
    		numerocasa: {
    			required: true,
    			minlength: 2,
    			maxlength: 150
    		},
    		bairro: {
    			required: true,
    			minlength: 2,
    			maxlength: 150
    		},
    		complemento: {
    			required: true,
    			minlength: 2,
    			maxlength: 150
    		},
    		cidade: {
    			required: true,
    			minlength: 2,
    			maxlength: 150
    		},
    		estado: {
    			required: true,
    			minlength: 2,
    			maxlength: 2
    		},
    		pais: {
    			required: true
    		}
            
        },
        messages: {
        	tipovaga: {
                required: "Campo obrigatório"
            },
            titulo:{
				required:"Campo obrigatorio",
				minlength:"Mínimo de 5 Digitos",
				maxlength:"Máximo de 100 Digitos"
			},
			descricao: {
				required: "Campo obrigatório",
				minlength:"Mínimo de 5 Digitos",
				maxlength:"Máximo de 250 Digitos"
			},
			beneficio:{
    			required: "Campo obrigatorio",
    		},
    		tempoMinimoSemanas: {
    			required: "Campo obrigatorio",
    		},
    		tempoMaximoSemanas: {
    			required: "Campo obrigatorio",
    		},
    		horasTrabalhoSemanal: {
    			required: "Campo obrigatorio",
    			minlength:"Mínimo de 1 Digitos",
    			maxlength:"Máximo de 2 Digitos"
    		},
    		rua: {
    			required: "Campo obrigatorio",
    			minlength: "Mínimo 2 Caracteres",
    			maxlength: "Apenas 150 Caracteres"
    		},
    		numerocasa: {
    			required: "Campo obrigatorio",
    			minlength: "Mínimo 2 Caracteres",
    			maxlength: "Máximo 150 Caracteres"
    		},
    		bairro: {
    			required: "Campo obrigatorio",
    			minlength: "Mínimo 2 Caracteres",
    			maxlength: "Máximo 150 Caracteres"
    		},
    		complemento: {
    			required: "Campo obrigatorio",
    			minlength: "Mínimo 2 Caracteres",
    			maxlength: "Máximo 150 Caracteres"
    		},
    		cidade: {
    			required: "Campo obrigatorio",
    			minlength: "Mínimo 2 Caracteres",
    			maxlength: "Máximo 150 Caracteres"
    		},
    		estado: {
    			required: "Campo obrigatorio",
    			minlength: "Apenas 2 Caracteres",
    			maxlength: "Apenas 2 Caracteres"
    		},
    		pais: {
    			required: "Campo obrigatorio"
    		}
            
            
        }
    });
}); 

