













<%@ page import="it.algos.algosdroid.Activation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'activation.label', default: 'Activation')}"/>
    <title><g:message code="activation.list.label" args="[entityName]" default="Elenco"/></title>
</head>

<body>
<a href="#list-activation" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label" default="Home"/></a></li>
        <li><g:link class="create" action="create"><g:message code="activation.new.label"
                                                              args="[entityName]" default="Nuovo"/></g:link></li>
        <g:if test="${menuExtra}">
            <algos:menuExtra menuExtra="${menuExtra}"> </algos:menuExtra>
        </g:if>
    </ul>
</div>

<div id="list-activation" class="content scaffold-list" role="main">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${flash.error}">
        <div class="errors" role="status">${flash.error}</div>
    </g:if>
    <g:if test="${flash.messages}">
        <g:each in="${flash.messages}" status="i" var="singoloMessaggio">
            <div class="message" role="status">${singoloMessaggio}</div>
        </g:each>
    </g:if>
    <g:if test="${flash.errors}">
        <g:each in="${flash.errors}" status="i" var="singoloErrore">
            <div class="errors" role="status">${singoloErrore}</div>
        </g:each>
    </g:if>

    <g:if test="${titoloLista}">
        <h1>${titoloLista}</h1>
    </g:if>
    <g:else>
        <h1><g:message code="activation.list.label" args="[entityName]" default="Elenco"/></h1>
    </g:else>

    <table>
        <thead>
        <g:if test="${campiLista}">
            <algos:titoliLista campiLista="${campiLista}"></algos:titoliLista>
        </g:if>
        <g:else>
            <tr>
                
                <g:sortableColumn property="activationCode"
                                  title="${message(code: 'activation.activationCode.label', default: 'Activation Code')}"/>
                
                <g:sortableColumn property="active"
                                  title="${message(code: 'activation.active.label', default: 'Active')}"/>
                
                <g:sortableColumn property="amount"
                                  title="${message(code: 'activation.amount.label', default: 'Amount')}"/>
                
                <g:sortableColumn property="appName"
                                  title="${message(code: 'activation.appName.label', default: 'App Name')}"/>
                
                <g:sortableColumn property="expiration"
                                  title="${message(code: 'activation.expiration.label', default: 'Expiration')}"/>
                
                <g:sortableColumn property="language"
                                  title="${message(code: 'activation.language.label', default: 'Language')}"/>
                
                <g:sortableColumn property="lastActivation"
                                  title="${message(code: 'activation.lastActivation.label', default: 'Last Activation')}"/>
                
                <g:sortableColumn property="lastUpdate"
                                  title="${message(code: 'activation.lastUpdate.label', default: 'Last Update')}"/>
                
            </tr>
        </g:else>
        </thead>
        <tbody>
        <g:if test="${campiLista}">
            <g:each in="${activationInstanceList}" status="i" var="activationInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <algos:rigaLista campiLista="${campiLista}" rec="${activationInstance}"></algos:rigaLista>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <g:each in="${activationInstanceList}" status="i" var="activationInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                    <td><g:link action="show"
                                id="${activationInstance.id}">${fieldValue(bean: activationInstance, field: "activationCode")}</g:link></td>
                    
                    <td><g:formatBoolean boolean="${activationInstance.active}"/></td>
                    
                    <td><g:link action="show"
                                id="${activationInstance.id}">${fieldValue(bean: activationInstance, field: "amount")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${activationInstance.id}">${fieldValue(bean: activationInstance, field: "appName")}</g:link></td>
                    
                    <td><g:formatDate date="${activationInstance.expiration}"/></td>
                    
                    <td><g:link action="show"
                                id="${activationInstance.id}">${fieldValue(bean: activationInstance, field: "language")}</g:link></td>
                    
                    <td><g:formatDate date="${activationInstance.lastActivation}"/></td>
                    
                    <td><g:formatDate date="${activationInstance.lastUpdate}"/></td>
                    
                </tr>
            </g:each>
        </g:else>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${activationInstanceTotal}"/>
    </div>
    <g:if test="${application.usaExport}">
        <div class="buttons">
            <export:formats/>
        </div>
    </g:if>
</div>
</body>
</html>
