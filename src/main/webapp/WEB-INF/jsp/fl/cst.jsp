<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="inputType" value="text" scope="request"/>
<c:set var="inputAdd" value="class='bsNum${rvs.cpf.costDp}'" scope="request"/>
<c:set target="${usdDp}" property="${rvs.cpf.costDp.toString()}" value="${rvs.cpf.costDp.toString()}"/>
<jsp:include page="tmpl.jsp"/>
