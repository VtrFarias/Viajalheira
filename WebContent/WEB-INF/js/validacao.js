$("#cadastrousuario").validate({
	debug: true,
	rules: {
		nome:{
			required: true,
			minlength: 5

		},
		cpfCnpj:{
			required: true,
			number: true,
			rangelength: [11, 14]
		},
		email:{
			required: true,
			maxlength: 100
		},
		senha:{
			required: true,
			password: true
		},
		confirmarSenha:{
				required: true,
				password: true
		},
		messages:{
			email:{
				required:"Campo E-mail é Obrigatorio.",
				maxlength:"Informe no maximo 100 caracteres"
			},
			cpfCnpj:{
				required:"Campo CPF/CNPJ é Obrigatorio.",
				number:"Este Campo é numerico.",
				rangelength:"Informe no maximo 14 Digitos"
			},
			nome:{
				required:"Campo Nome é Obrigatorio.",
			},
			pais:{
			required: true,
			
		},
		estado:{
				required: true,
				minlength: 3,
				maxlength: 19
			},
			cidade:{
				required: true,
				minlength: 3
			},
			bairro:{
				required: true,
				minlength: 3
			},
			rua:{
				required: true,
				minlength: 3
			},
			numero:{
				required: true
			},
			complemento:{
				required: true,
				maxlength: 250

			}
		}
	}
});
