













<%@ page import="it.algos.algosdroid.Activation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'activation.label', default: 'Activation')}" />
    <title><g:message code="activation.show.label" args="[entityName]" default="Mostra"/></title>
</head>
<body>
<a href="#show-activation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" default="Home"/></a></li>
        <li><g:link class="list" action="list"><g:message code="activation.list.label" args="[entityName]" default="Elenco"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="activation.new.label" args="[entityName]" default="Nuovo"/></g:link></li>
    </ul>
</div>
<div id="show-activation" class="content scaffold-show" role="main">
    <h1><g:message code="activation.show.label" args="[entityName]" default="Mostra"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list activation">
        
        <g:if test="${activationInstance?.activationCode}">
            <li class="fieldcontain">
                <span id="activationCode-label" class="property-label"><g:message code="activation.activationCode.label" default="Activation Code" /></span>
                
                <span class="property-value" aria-labelledby="activationCode-label"><g:fieldValue bean="${activationInstance}" field="activationCode"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.active}">
            <li class="fieldcontain">
                <span id="active-label" class="property-label"><g:message code="activation.active.label" default="Active" /></span>
                
                <span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${activationInstance?.active}" /></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.amount}">
            <li class="fieldcontain">
                <span id="amount-label" class="property-label"><g:message code="activation.amount.label" default="Amount" /></span>
                
                <span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${activationInstance}" field="amount"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.appName}">
            <li class="fieldcontain">
                <span id="appName-label" class="property-label"><g:message code="activation.appName.label" default="App Name" /></span>
                
                <span class="property-value" aria-labelledby="appName-label"><g:fieldValue bean="${activationInstance}" field="appName"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.expiration}">
            <li class="fieldcontain">
                <span id="expiration-label" class="property-label"><g:message code="activation.expiration.label" default="Expiration" /></span>
                
                <span class="property-value" aria-labelledby="expiration-label"><g:formatDate date="${activationInstance?.expiration}" /></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.language}">
            <li class="fieldcontain">
                <span id="language-label" class="property-label"><g:message code="activation.language.label" default="Language" /></span>
                
                <span class="property-value" aria-labelledby="language-label"><g:fieldValue bean="${activationInstance}" field="language"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.lastActivation}">
            <li class="fieldcontain">
                <span id="lastActivation-label" class="property-label"><g:message code="activation.lastActivation.label" default="Last Activation" /></span>
                
                <span class="property-value" aria-labelledby="lastActivation-label"><g:formatDate date="${activationInstance?.lastActivation}" /></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.lastUpdate}">
            <li class="fieldcontain">
                <span id="lastUpdate-label" class="property-label"><g:message code="activation.lastUpdate.label" default="Last Update" /></span>
                
                <span class="property-value" aria-labelledby="lastUpdate-label"><g:formatDate date="${activationInstance?.lastUpdate}" /></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.level}">
            <li class="fieldcontain">
                <span id="level-label" class="property-label"><g:message code="activation.level.label" default="Level" /></span>
                
                <span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${activationInstance}" field="level"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.paid}">
            <li class="fieldcontain">
                <span id="paid-label" class="property-label"><g:message code="activation.paid.label" default="Paid" /></span>
                
                <span class="property-value" aria-labelledby="paid-label"><g:formatBoolean boolean="${activationInstance?.paid}" /></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.producerId}">
            <li class="fieldcontain">
                <span id="producerId-label" class="property-label"><g:message code="activation.producerId.label" default="Producer Id" /></span>
                
                <span class="property-value" aria-labelledby="producerId-label"><g:fieldValue bean="${activationInstance}" field="producerId"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.sentMail}">
            <li class="fieldcontain">
                <span id="sentMail-label" class="property-label"><g:message code="activation.sentMail.label" default="Sent Mail" /></span>
                
                <span class="property-value" aria-labelledby="sentMail-label"><g:formatBoolean boolean="${activationInstance?.sentMail}" /></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.trackingOnly}">
            <li class="fieldcontain">
                <span id="trackingOnly-label" class="property-label"><g:message code="activation.trackingOnly.label" default="Tracking Only" /></span>
                
                <span class="property-value" aria-labelledby="trackingOnly-label"><g:formatBoolean boolean="${activationInstance?.trackingOnly}" /></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.uniqueid}">
            <li class="fieldcontain">
                <span id="uniqueid-label" class="property-label"><g:message code="activation.uniqueid.label" default="Uniqueid" /></span>
                
                <span class="property-value" aria-labelledby="uniqueid-label"><g:fieldValue bean="${activationInstance}" field="uniqueid"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.userAddress}">
            <li class="fieldcontain">
                <span id="userAddress-label" class="property-label"><g:message code="activation.userAddress.label" default="User Address" /></span>
                
                <span class="property-value" aria-labelledby="userAddress-label"><g:fieldValue bean="${activationInstance}" field="userAddress"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.userCategory}">
            <li class="fieldcontain">
                <span id="userCategory-label" class="property-label"><g:message code="activation.userCategory.label" default="User Category" /></span>
                
                <span class="property-value" aria-labelledby="userCategory-label"><g:fieldValue bean="${activationInstance}" field="userCategory"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.userCurrentMail}">
            <li class="fieldcontain">
                <span id="userCurrentMail-label" class="property-label"><g:message code="activation.userCurrentMail.label" default="User Current Mail" /></span>
                
                <span class="property-value" aria-labelledby="userCurrentMail-label"><g:fieldValue bean="${activationInstance}" field="userCurrentMail"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.userid}">
            <li class="fieldcontain">
                <span id="userid-label" class="property-label"><g:message code="activation.userid.label" default="Userid" /></span>
                
                <span class="property-value" aria-labelledby="userid-label"><g:fieldValue bean="${activationInstance}" field="userid"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.userName}">
            <li class="fieldcontain">
                <span id="userName-label" class="property-label"><g:message code="activation.userName.label" default="User Name" /></span>
                
                <span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${activationInstance}" field="userName"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${activationInstance?.deviceInfo}">
            <li class="fieldcontain">
                <span id="deviceInfo-label" class="property-label"><g:message code="activation.deviceInfo.label" default="Device Info" /></span>
                
                <span class="property-value" aria-labelledby="deviceInfo-label"><g:fieldValue bean="${activationInstance}" field="deviceInfo"/></span>
                
            </li>
        </g:if>
        
    </ol>
    <g:form>
        <g:if test="${usaSpostamento}">
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${activationInstance?.id}"/>
                <g:link class="create" action="moveFirst">Primo record</g:link>
                <g:link class="edit" action="movePrec" id="${activationInstance?.id}">Precedente</g:link>
                <g:link class="edit" action="moveSucc" id="${activationInstance?.id}">Successivo</g:link>
                <g:link class="create" action="moveLast">Ultimo record</g:link>
            </fieldset>
        </g:if>
    </g:form>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${activationInstance?.id}" />
            <g:link class="edit" action="edit" id="${activationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
