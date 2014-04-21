












<%@ page import="it.algos.algosdroid.Activation" %>



<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'activationCode', 'error')} ">
	<label for="activationCode">
		<g:message code="activation.activationCode.label" default="Activation Code" />
		
	</label>
	










<g:textField name="activationCode" value="${activationInstance?.activationCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="activation.active.label" default="Active" />
		
	</label>
	










<g:checkBox name="active" value="${activationInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="activation.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	










<g:field name="amount" type="number" value="${activationInstance.amount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'appName', 'error')} ">
	<label for="appName">
		<g:message code="activation.appName.label" default="App Name" />
		
	</label>
	










<g:textField name="appName" value="${activationInstance?.appName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'expiration', 'error')} required">
	<label for="expiration">
		<g:message code="activation.expiration.label" default="Expiration" />
		<span class="required-indicator">*</span>
	</label>
	










<g:datePicker name="expiration" precision="minute"  value="${activationInstance?.expiration}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'language', 'error')} ">
	<label for="language">
		<g:message code="activation.language.label" default="Language" />
		
	</label>
	










<g:textField name="language" value="${activationInstance?.language}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'lastActivation', 'error')} required">
	<label for="lastActivation">
		<g:message code="activation.lastActivation.label" default="Last Activation" />
		<span class="required-indicator">*</span>
	</label>
	










<g:datePicker name="lastActivation" precision="minute"  value="${activationInstance?.lastActivation}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'lastUpdate', 'error')} required">
	<label for="lastUpdate">
		<g:message code="activation.lastUpdate.label" default="Last Update" />
		<span class="required-indicator">*</span>
	</label>
	










<g:datePicker name="lastUpdate" precision="minute"  value="${activationInstance?.lastUpdate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="activation.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	










<g:field name="level" type="number" value="${activationInstance.level}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'paid', 'error')} ">
	<label for="paid">
		<g:message code="activation.paid.label" default="Paid" />
		
	</label>
	










<g:checkBox name="paid" value="${activationInstance?.paid}" />
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'producerId', 'error')} required">
	<label for="producerId">
		<g:message code="activation.producerId.label" default="Producer Id" />
		<span class="required-indicator">*</span>
	</label>
	










<g:field name="producerId" type="number" value="${activationInstance.producerId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'sentMail', 'error')} ">
	<label for="sentMail">
		<g:message code="activation.sentMail.label" default="Sent Mail" />
		
	</label>
	










<g:checkBox name="sentMail" value="${activationInstance?.sentMail}" />
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'trackingOnly', 'error')} ">
	<label for="trackingOnly">
		<g:message code="activation.trackingOnly.label" default="Tracking Only" />
		
	</label>
	










<g:checkBox name="trackingOnly" value="${activationInstance?.trackingOnly}" />
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'uniqueid', 'error')} ">
	<label for="uniqueid">
		<g:message code="activation.uniqueid.label" default="Uniqueid" />
		
	</label>
	










<g:textField name="uniqueid" value="${activationInstance?.uniqueid}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'userAddress', 'error')} ">
	<label for="userAddress">
		<g:message code="activation.userAddress.label" default="User Address" />
		
	</label>
	










<g:textField name="userAddress" value="${activationInstance?.userAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'userCategory', 'error')} ">
	<label for="userCategory">
		<g:message code="activation.userCategory.label" default="User Category" />
		
	</label>
	










<g:textField name="userCategory" value="${activationInstance?.userCategory}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'userCurrentMail', 'error')} ">
	<label for="userCurrentMail">
		<g:message code="activation.userCurrentMail.label" default="User Current Mail" />
		
	</label>
	










<g:textField name="userCurrentMail" value="${activationInstance?.userCurrentMail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'userid', 'error')} ">
	<label for="userid">
		<g:message code="activation.userid.label" default="Userid" />
		
	</label>
	










<g:textField name="userid" value="${activationInstance?.userid}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'userName', 'error')} ">
	<label for="userName">
		<g:message code="activation.userName.label" default="User Name" />
		
	</label>
	










<g:textField name="userName" value="${activationInstance?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activationInstance, field: 'deviceInfo', 'error')} ">
	<label for="deviceInfo">
		<g:message code="activation.deviceInfo.label" default="Device Info" />
		
	</label>
	










<g:textField name="deviceInfo" value="${activationInstance?.deviceInfo}"/>
</div>

