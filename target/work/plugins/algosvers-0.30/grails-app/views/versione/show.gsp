
<%@ page import="it.algos.algosvers.Versione" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'versione.label', default: 'Versione')}" />
        <title><g:message code="versione.show.label" args="[entityName]" default="Mostra"/></title>
	</head>
	<body>
		<a href="#show-versione" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" default="Home"/></a></li>
				<li><g:link class="list" action="list"><g:message code="versione.list.label" args="[entityName]" default="Elenco"/></g:link></li>
				<li><g:link class="create" action="create"><g:message code="versione.new.label" args="[entityName]" default="Nuovo"/></g:link></li>
			</ul>
		</div>
		<div id="show-versione" class="content scaffold-show" role="main">
            <h1><g:message code="versione.show.label" args="[entityName]" default="Mostra"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list versione">
			
				<g:if test="${versioneInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="versione.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${versioneInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${versioneInstance?.giorno}">
				<li class="fieldcontain">
					<span id="giorno-label" class="property-label"><g:message code="versione.giorno.label" default="Giorno" /></span>
					
						<span class="property-value" aria-labelledby="giorno-label"><g:formatDate date="${versioneInstance?.giorno}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${versioneInstance?.titolo}">
				<li class="fieldcontain">
					<span id="titolo-label" class="property-label"><g:message code="versione.titolo.label" default="Titolo" /></span>
					
						<span class="property-value" aria-labelledby="titolo-label"><g:fieldValue bean="${versioneInstance}" field="titolo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${versioneInstance?.descrizione}">
				<li class="fieldcontain">
					<span id="descrizione-label" class="property-label"><g:message code="versione.descrizione.label" default="Descrizione" /></span>
					
						<span class="property-value" aria-labelledby="descrizione-label"><g:fieldValue bean="${versioneInstance}" field="descrizione"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${versioneInstance?.id}" />
					<g:link class="edit" action="edit" id="${versioneInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
