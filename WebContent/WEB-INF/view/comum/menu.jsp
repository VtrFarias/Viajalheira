
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
      <header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
        <div class="mdl-layout__header-row">
          <a class="color-text--brown-500" href="/viajalheira/home"><span class="mdl-layout-title">Home</span></a>
          <div class="mdl-layout-spacer"></div>
          <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
            <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
              <i class="material-icons">search</i>
            </label>
            <div class="mdl-textfield__expandable-holder">
              <input class="mdl-textfield__input" type="text" id="search">
              <label class="mdl-textfield__label" for="search">Que tipo de oportunidade voc� procura?</label>
            </div>
          </div>
          <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
            <i class="material-icons">more_vert</i>
          </button>
          <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
           
            <a href="/viajalheira/logout"><li class="mdl-menu__item">Sair</li></a>
          </ul>
        </div>
      </header>
      <div class=" mdl-layout__drawer mdl-color--amber-400 mdl-color-text--grey-900">
        <header class=" ">
         
	         <div class="header-avatar">
	          <img src="<%=request.getContextPath()%>/resources/img/${usuarioLogado.imagem}" class="avatarPerfil">
	        </div>
	       
	     
          <div class="infoUsuarioPerfil">
            <strong>${usuarioLogado.nome}</strong>
            <div class="mdl-layout-spacer">${usuarioLogado.email}</div>
          </div>
      
        
        </header>
        <nav class="demo-navigation mdl-navigation mdl-color--amber-600">
          <a class="mdl-navigation__link mdl-color-text--brown-500" href="/viajalheira/perfil?id=${usuarioLogado.id}"><i class="mdl-color-text--brown-800 material-icons" role="presentation">account_circle</i>Minha Conta</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href="/viajalheira/hospedagem/novoCadastro"><i class="mdl-color-text--brown-500 material-icons" role="presentation">home</i>Nova Hospedagem</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href="/viajalheira/hospedagem/notificacoes"><i class="mdl-color-text--brown-500 material-icons" role="presentation">announcement</i>Notifica��es</a>

          <!-- 
          <a class="mdl-navigation__link mdl-color-text--brown-500" href=""><i class="mdl-color-text--brown-500 material-icons" role="presentation">report</i>Spam</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href=""><i class="mdl-color-text--brown-500 material-icons" role="presentation">forum</i>Forums</a>
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
         
<!-- fechamentos devem ficar na p�gina principal  -->
       
       
