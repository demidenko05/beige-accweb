<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty txbl}">
  <td>
    <jsp:include page="../st/${hldUvd.stgNn(cls,fdNm,'str')}.jsp"/>
  </td>
</c:if>
