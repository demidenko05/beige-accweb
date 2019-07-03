<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mdl" value="${ent}" scope="request"/>
<c:set var="apr"><jsp:include page="../st/inv.jsp"/></c:set>
<button class="btn" onClick="bsSelEnt('${ent.iid}',&quot;${apr}&quot;,'${lsPlNm}${param.ent}')">${i18n.getMsg("Pick", rvs.upf.lng.iid)}</button>
