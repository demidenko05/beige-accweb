<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${!varStatus.isFirst()}">| </c:if>${i18n.getMsg(fdNm, rvs.upf.lng.iid)}
