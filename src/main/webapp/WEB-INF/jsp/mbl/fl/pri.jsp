<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="inpTy" value="text" scope="request"/>
<c:set var="inpAdd" value="class='bsNum${rvs.cpf.priDp}'" scope="request"/>
<c:set target="${usdDp}" property="${rvs.cpf.priDp.toString()}" value="${rvs.cpf.priDp.toString()}"/>
<jsp:include page="tmpl.jsp"/>
