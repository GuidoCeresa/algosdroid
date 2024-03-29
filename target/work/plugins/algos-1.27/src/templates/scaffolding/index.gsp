<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
    <title><g:message code="${domainClass.propertyName}.list.label" args="[entityName]" default="Elenco"/></title>
    <r:require module="filterpane"/>
</head>

<body>
<a href="#list-${domainClass.propertyName}" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="\${createLink(uri: '/home')}"><g:message code="default.home.label"
                                                                           default="Home"/></a>
        </li>
        <li><g:link class="create" action="create"><g:message code="${domainClass.propertyName}.new.label"
                                                              args="[entityName]" default="Nuovo"/></g:link></li>
        <g:if test="\${menuExtra}">
            <algos:menuExtra menuExtra="\${menuExtra}"></algos:menuExtra>
        </g:if>
    </ul>
</div>

<div id="list-${domainClass.propertyName}" class="content scaffold-list" role="main">

    <g:if test="\${flash.message}">
        <div class="message" role="status">\${flash.message}</div>
    </g:if>
    <g:if test="\${flash.error}">
        <div class="errors" role="status">\${flash.error}</div>
    </g:if>
    <g:if test="\${flash.messages}">
        <g:each in="\${flash.messages}" status="i" var="singoloMessaggio">
            <div class="message" role="status">\${singoloMessaggio}</div>
        </g:each>
    </g:if>
    <g:if test="\${flash.errors}">
        <g:each in="\${flash.errors}" status="i" var="singoloErrore">
            <div class="errors" role="status">\${singoloErrore}</div>
        </g:each>
    </g:if>

    <g:if test="\${usaFilter}">
        <filterpane:isNotFiltered><h1>\${titoloLista}</h1></filterpane:isNotFiltered>
        <filterpane:isFiltered><h1>\${titoloListaFiltrata}</h1></filterpane:isFiltered>
    </g:if>
    <g:else>
        <g:if test="\${titoloLista}">
            <h1>\${titoloLista}</h1>
        </g:if>
        <g:else>
            <h1><g:message code="${domainClass.propertyName}.list.label" args="[entityName]" default="Elenco"/></h1>
        </g:else>
    </g:else>


    <table>
        <thead>
        <g:if test="\${campiLista}">
            <algos:titoliLista campiLista="\${campiLista}"> </algos:titoliLista>
        </g:if>
        <g:else>
            <tr>
                <% excludedProps = Event.allEvents.toList() << 'id' << 'version'
                allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
                props = domainClass.properties.findAll {
                    allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type)
                }
                Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                props.eachWithIndex { p, i ->
                    if (i < 12) {
                        if (p.isAssociation()) { %>
                <th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></th>
                <% } else { %>
                <g:sortableColumn property="${p.name}"
                                  title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${
                                          p.naturalName}')}"/>
                <% }
                }
                } %>
            </tr>
        </g:else>
        </thead>

        <tbody>
        <g:if test="\${campiLista}">
            <g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
                <tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
                    <algos:rigaLista campiLista="\${campiLista}" rec="\${${propertyName}}"> </algos:rigaLista>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
                <tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
                    <% props.eachWithIndex { p, i ->
                        if (i < 12) {
                            if (p.type == Boolean || p.type == boolean) { %>
                    <g:if test="\${${propertyName}.${p.name}!=null}">
                        <td><g:checkBox name="${p.name}" value="\${${propertyName}.${p.name}}"/></td>
                    </g:if>
                    <%
                        } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
                    <td><g:formatDate date="\${${propertyName}.${p.name}}"/></td>
                    <% } else { %>
                    <td><g:link action="show"
                                id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${
                                p.name}")}</g:link></td>
                    <% }
                    }
                    } %>
                </tr>
            </g:each>
        </g:else>
        </tbody>
    </table>

    <div class="pagination">
        <g:if test="\${usaFilter}">
            <filterpane:paginate total="\${${propertyName}Count}" domainBean="${className}"/>
            <filterpane:filterButton text="Seleziona un filtro" appliedText="Cambia il filtro"/>
            <filterpane:isNotFiltered>Mostrati tutti i \${${propertyName}Count} records</filterpane:isNotFiltered>
            <filterpane:isFiltered>Mostrati \${${propertyName}Count} records su \${${propertyName}Total}</filterpane:isFiltered>
        </g:if>
        <g:else>
            <g:paginate total="\${${propertyName}Total}"/>
        </g:else>
    </div>
    <filterpane:filterPane domain="${className}"/>

    <g:if test="\${usaExport}">
        <div class="buttons">
            <export:formats/>
        </div>
    </g:if>
</div>
</body>
</html>
