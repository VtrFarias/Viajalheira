 $(document).ready(function(){
    $("#cadastrousuario").validate({
        rules: {
        	nome: {
                required: true
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
    			required: true
    		},
    		confirmarSenha: {
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
    			required: true
    		},
    		pais: {
    			required: true
    		}
            
        },
        messages: {
        	nome: {
                required: "Campo obrigatório"
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
    			required: "Campo obrigatorio"
    		},
    		confirmarSenha: {
    			required: "Campo obrigatorio"
    		},
    		sexo: {
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
    			required: "Campo obrigatorio"
    		},
    		pais: {
    			required: "Campo obrigatorio"
    		}
            
            
        }
    });
}); 