
<%@ page import="it.algos.algosvers.Versione" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'versione.label', default: 'Versione')}"/>
    <title><g:message code="versione.list.label" args="[entityName]" default="Elenco"/></title>
</head>

<body>
<a href="#list-versione" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" default="Home"/></a></li>
        <li><g:link class="create" action="create"><g:message code="versione.new.label"
                                                              args="[entityName]" default="Nuovo"/></g:link></li>
    </ul>
</div>

<div id="list-versione" class="content scaffold-list" role="main">
    <h1><g:message code="versione.list.label" args="[entityName]" default="Elenco"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            
            <g:sortableColumn property="numero"
                              title="${message(code: 'versione.numero.label', default: 'Numero')}"/>
            
            <g:sortableColumn property="giorno"
                              title="${message(code: 'versione.giorno.label', default: 'Giorno')}"/>
            
            <g:sortableColumn property="titolo"
                              title="${message(code: 'versione.titolo.label', default: 'Titolo')}"/>
            
            <g:sortableColumn property="descrizione"
                              title="${message(code: 'versione.descrizione.label', default: 'Descrizione')}"/>
            
        </tr>
        </thead>
        <tbody>
        <g:each in="${versioneInstanceList}" status="i" var="versioneInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                
                <td><g:link action="show"
                            id="${versioneInstance.id}">${fieldValue(bean: versioneInstance, field: "numero")}</g:link></td>
                
                <td><g:formatDate date="${versioneInstance.giorno}"/></td>
                
                <td><g:link action="show"
                            id="${versioneInstance.id}">${fieldValue(bean: versioneInstance, field: "titolo")}</g:link></td>
                
                <td><g:link action="show"
                            id="${versioneInstance.id}">${fieldValue(bean: versioneInstance, field: "descrizione")}</g:link></td>
                
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${versioneInstanceTotal}"/>
    </div>
</div>
</body>
</html>
