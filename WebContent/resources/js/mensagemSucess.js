(function() {
			  'use strict';
			  var snackbarContainer = document.querySelector('#demo-snackbar-example');
			  var formulario = document.querySelector('#formulario');
			  
			  formulario.addEventListener('submit', function() {
				 
					'use strict';
			    
				    var data = {
				      message: 'Usuário cadastrado com sucesso',
				      timeout: 2000
				    
			    };
			    snackbarContainer.MaterialSnackbar.showSnackbar(data);
				  
				});
			}());
