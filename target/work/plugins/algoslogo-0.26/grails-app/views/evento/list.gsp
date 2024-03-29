
<%@ page import="it.algos.algoslogo.Evento" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}"/>
    <title><g:message code="evento.list.label" args="[entityName]" default="Elenco"/></title>
</head>

<body>
<a href="#list-evento" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" default="Home"/></a></li>
        <li><g:link class="create" action="create"><g:message code="evento.new.label"
                                                              args="[entityName]" default="Nuovo"/></g:link></li>
    </ul>
</div>

<div id="list-evento" class="content scaffold-list" role="main">
    <h1><g:message code="evento.list.label" args="[entityName]" default="Elenco [entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            
            <g:sortableColumn property="nome"
                              title="${message(code: 'evento.nome.label', default: 'Nome')}"/>
            
        </tr>
        </thead>
        <tbody>
        <g:each in="${eventoInstanceList}" status="i" var="eventoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                
                <td><g:link action="show"
                            id="${eventoInstance.id}">${fieldValue(bean: eventoInstance, field: "nome")}</g:link></td>
                
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${eventoInstanceTotal}"/>
    </div>
</div>
</body>
</html>
