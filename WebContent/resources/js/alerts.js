
function senhas() {
var confirmarSenha = document.getElementById('confirmarSenha');
var senha = document.getElementById('senha');
	if(senha.value != confirmarSenha.value){
	Swal.fire({
		type : 'error',
		title : 'As senhas não correspondem...',
		text : 'Tente novamente.'
		
	})
	senha.value = "";
	confirmarSenha.value = "";
	}
}

function cadastroComSucesso(){
	
	Swal.fire(
			  'Usuário Cadastrado com sucesso!',
			  'Aproveite a viagem!',
			  'success'
			)
}

function enviarCertificado(){
	Swal.fire(
			  'Pronto!',
			  'Certificado enviado por email.',
			  'success'
			)
}