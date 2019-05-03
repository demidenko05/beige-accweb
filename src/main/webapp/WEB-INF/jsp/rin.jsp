<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="../css/bsPrn.css" />
  <link rel="icon" type="image/png" href="../img/favicon.png">
  <title>${i18n.getMsg("RefrI18n", rvs.upf.lng.iid)} <fmt:formatDate value="${now}" type="both" timeStyle="short"/></title>
</head>
<body>
  <div style="text-align: center;">
    <h4>
      ${i18n.getMsg("RefrI18n", rvs.upf.lng.iid)} <fmt:formatDate value="${now}" type="both" timeStyle="short"/><br></br>
      ${i18n.getMsg("Success", rvs.upf.lng.iid)}!
    </h4>
  </div>
</body>
</html>
