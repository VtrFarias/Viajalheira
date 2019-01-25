
$( "#nome" ).validate({
   debug: true,
   rules: {
	   
     nome: {
       required: true
               
     	},

   }
   });

$( "#cpfCnpj" ).validate({
   debug: true,
   rules: {
	   
     
	 cpfCnpj: {
       required: true,
       rangelength: [11, 14]

     }

   }
   });
var n = document.getElementById('cpfCnpj').value;

if (11 < n < 14){
	alert("Número inválido. Digite ao menos 11 números para CPF ou 14 para CNPJ.");
} else {
	alert("CPF/CNPJ guardado com sucesso.")
}

$( "#email" ).validate({
	   debug: true,
	   rules: {
		   
	     email: {
	       required: true,
	       email: true        
	     	},

	   }
	   });
$( "#email" ).validate({
	   debug: true,
	   rules: {
		   
	     email: {
	       required: true,
	       email: true        
	     	},

	   }
	   });

$('#sexo :selected').text();

$('input[type=checkbox]').prop('checked');

$( "#inputDescricao" ).validate({
	   debug: true,
	   rules: {
		   
   inputDescricao: {
	       required: true
	               
	     	}
	   }
});

$( "#rua" ).validate({
	   debug: true,
	   rules: {
		   
		 rua: {
	       required: true
	               
	     	}
	   }
});

$( "#numero" ).validate({
	   debug: true,
	   rules: {
		   
	numero: {
	       required: true
	              
	     	}
	   }
});

$( "#complemento" ).validate({
	   debug: true,
	   rules: {
		   
	complemento: {
	       required: true
	               
	     	}
	   }
});

$( "#bairro" ).validate({
	   debug: true,
	   rules: {
		   
	bairro: {
	       required: true
	               
	     	}
	   }
});

$( "#cidade" ).validate({
	   debug: true,
	   rules: {
		   
	cidade: {
	       required: true
	               
	     	}
	   }
});

$( "#estado" ).validate({
	   debug: true,
	   rules: {
		   
	estado: {
	       required: true
	               
	     	}
	   }
});

$('#pais :selected').text();
	  