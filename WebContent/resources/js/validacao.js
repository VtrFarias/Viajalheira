$(document).ready(function(){
    $("#cadastrousuario").validate({
        rules: {
        	nome: {
                required: true,
                minlength: 3
            },
            cpfCnpj: {
            	required: true,
    			number: true,
    			minlength: 11,
    			maxlength: 14
            },
            email: {
    			required: true,
    			email: true
    		},
    		senha: {
    			required: true,
    			minlength: 6
    		},
    		confirmarSenha: {
    			required: true
    		},
    		idioma: {
    			required: true
    		},
    		sexo: {
    			required: true
    		},
    		rua: {
    			required: true
    		},
    		numerocasa: {
    			required: true
    		},
    		bairro: {
    			required: true
    		},
    		cidade: {
    			required: true
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
        	nome: {
                required: "Campo obrigatório",
                minlength: "Mínimo de 3 Caracteres"
            },
			cpfCnpj:{
				required:"Campo obrigatorio",
				number:"Deve ser um número",
				minlength:"Mínimo de 11 Digitos",
				maxlength:"Máximo de 14 Digitos"
			},
			email: {
				required: "Campo obrigatório",
				email: "Este endereço de email não é válido"
			},
			senha:{
    			required: "Campo obrigatorio",
    			minlength:"Mínimo de 6 Caracteres"
    		},
    		confirmarSenha: {
    			required: "Campo obrigatorio"
    		},
    		sexo: {
    			required: "Campo obrigatorio"
    		},
    		idioma: {
    			required: "Campo obrigatorio"
    		},
    		rua: {
    			required: "Campo obrigatorio"
    		},
    		numerocasa: {
    			required: "Campo obrigatorio"
    		},
    		bairro: {
    			required: "Campo obrigatorio"
    		},
    		cidade: {
    			required: "Campo obrigatorio"
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

