
<%@ page import="it.algos.algoslogo.Logo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'logo.label', default: 'Logo')}"/>
    <title><g:message code="logo.list.label" args="[entityName]" default="Elenco"/></title>
</head>

<body>
<a href="#list-logo" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" default="Home"/></a></li>
        <li><g:link class="create" action="create"><g:message code="logo.new.label"
                                                              args="[entityName]" default="Nuovo"/></g:link></li>
    </ul>
</div>

<div id="list-logo" class="content scaffold-list" role="main">
    <h1><g:message code="logo.list.label" args="[entityName]" default="Elenco"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            
            <g:sortableColumn property="time"
                              title="${message(code: 'logo.time.label', default: 'Time')}"/>
            
            <g:sortableColumn property="utente"
                              title="${message(code: 'logo.utente.label', default: 'Utente')}"/>
            
            <g:sortableColumn property="ruolo"
                              title="${message(code: 'logo.ruolo.label', default: 'Ruolo')}"/>
            
            <th><g:message code="logo.evento.label" default="Evento"/></th>
            
            <g:sortableColumn property="livello"
                              title="${message(code: 'logo.livello.label', default: 'Livello')}"/>
            
            <g:sortableColumn property="dettaglio"
                              title="${message(code: 'logo.dettaglio.label', default: 'Dettaglio')}"/>
            
            <g:sortableColumn property="ip"
                              title="${message(code: 'logo.ip.label', default: 'Ip')}"/>
            
        </tr>
        </thead>
        <tbody>
        <g:each in="${logoInstanceList}" status="i" var="logoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                
                <td><g:link action="show"
                            id="${logoInstance.id}">${fieldValue(bean: logoInstance, field: "time")}</g:link></td>
                
                <td><g:link action="show"
                            id="${logoInstance.id}">${fieldValue(bean: logoInstance, field: "utente")}</g:link></td>
                
                <td><g:link action="show"
                            id="${logoInstance.id}">${fieldValue(bean: logoInstance, field: "ruolo")}</g:link></td>
                
                <td><g:link action="show"
                            id="${logoInstance.id}">${fieldValue(bean: logoInstance, field: "evento")}</g:link></td>
                
                <td><g:link action="show"
                            id="${logoInstance.id}">${fieldValue(bean: logoInstance, field: "livello")}</g:link></td>
                
                <td><g:link action="show"
                            id="${logoInstance.id}">${fieldValue(bean: logoInstance, field: "dettaglio")}</g:link></td>
                
                <td><g:link action="show"
                            id="${logoInstance.id}">${fieldValue(bean: logoInstance, field: "ip")}</g:link></td>
                
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${logoInstanceTotal}"/>
    </div>
</div>
</body>
</html>
