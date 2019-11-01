
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
      <header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
        <div class="mdl-layout__header-row">
          <a class="color-text--brown-500" href="/viajalheira/home"><span class="mdl-layout-title">Home</span></a>
          <div class="mdl-layout-spacer"></div>
          
		  <i class="material-icons" id="searchButton">search</i>
		  
          <form action="/viajalheira/hospedagem/filter" id="formFilter">
            <div class="mdl-textfield__expandable">
              <input class="mdl-textfield__input" type="text" id="searchHospedagem" name="titulo" placeholder="Buscar por hospedagem" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Buscar por hospedagem'">
              <label class="mdl-textfield__label" for="titulo"></label>
            </div> 
            <div class="mdl-textfield__expandable">
            	<select class="form-control" id="tipovaga" name="tipovaga">
					<option value=0>Buscar por tipo da Vaga</option>
					<c:forEach var="tipoVaga" items="${listaTipoVaga}">
						<option value="${tipoVaga.id}">${tipoVaga.descricao}</option>
					</c:forEach>
				</select>
            </div>
            <div class="mdl-textfield__expandable">
              <input class="buttonFilter" type="submit" value="Pesquisar">
            </div>
          </form>
          
          <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
            <i class="material-icons">more_vert</i>
          </button>
          <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
           
            <li class="mdl-menu__item"><a href="/viajalheira/logout">Sair</a></li>
          </ul>
        </div>
      </header>
      <div class=" mdl-layout__drawer mdl-color--amber-400 mdl-color-text--grey-900">
        <header class=" ">
         
	         <div class="header-avatar">
	       <c:choose>
				<c:when test="${not empty usuarioLogado.imagem}">
					<img src="<%=request.getContextPath()%>/resources/img/${usuarioLogado.imagem}" class="avatarPerfil">
				</c:when>
				<c:otherwise>
					<img src="<%=request.getContextPath()%>/resources/img/avatar.jpg" class="avatarPerfil" alt="..." id="FotoPerfil">
				</c:otherwise>
			</c:choose>
	          
	        </div>
	       
	     
          <div class="infoUsuarioPerfil">
            <strong>${usuarioLogado.nome}</strong>
            <div class="mdl-layout-spacer">${usuarioLogado.email}</div>
          </div>
      
        
        </header>
        <nav class="demo-navigation mdl-navigation mdl-color--amber-600">
          <a class="mdl-navigation__link mdl-color-text--brown-500" href="/viajalheira/perfil?id=${usuarioLogado.id}"><i class="mdl-color-text--brown-800 material-icons" role="presentation">account_circle</i>Minha Conta</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href="/viajalheira/hospedagem/novoCadastro"><i class="mdl-color-text--brown-500 material-icons" role="presentation">home</i>Nova Hospedagem</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href="/viajalheira/hospedagem/notificacoes"><i class="mdl-color-text--brown-500 material-icons" role="presentation">announcement</i>Notificações</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href="/viajalheira/usuario/certificados"><i class="mdl-color-text--brown-500 material-icons" role="presentation">description</i>Certificados</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href="/viajalheira/usuario/pacotes"><i class="mdl-color-text--brown-500 material-icons" role="presentation">card_giftcard</i>Pacotes de uso</a>
          

          <!-- 
          <a class="mdl-navigation__link mdl-color-text--brown-500" href=""><i class="mdl-color-text--brown-500 material-icons" role="presentation">flag</i>Updates</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href=""><i class="mdl-color-text--brown-500 material-icons" role="presentation">local_offer</i>Promos</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href=""><i class="mdl-color-text--brown-500 material-icons" role="presentation">shopping_cart</i>Purchases</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href=""><i class="mdl-color-text--brown-500 material-icons" role="presentation">people</i>Social</a>
          <div class="mdl-layout-spacer"></div>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--amber-900 material-icons" role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
           -->
         
        </nav>
      </div>
      <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content">