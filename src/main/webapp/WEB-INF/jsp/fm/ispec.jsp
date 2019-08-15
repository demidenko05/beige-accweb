<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ent.spec.typ eq 'TEXT'}">
  <jsp:include page="../in/spStr.jsp"/>
</c:if>
<c:if test="${ent.spec.typ eq 'BIGDECIMAL'}">
  <jsp:include page="../in/spNum.jsp"/>
</c:if>
<c:if test="${ent.spec.typ eq 'INTEGER'}">
  <jsp:include page="../in/spInt.jsp"/>
</c:if>
<c:if test="${ent.spec.typ eq 'CHOOSEABLE_SPECIFICS'}">
  <jsp:include page="../in/spCho.jsp"/>
</c:if>
<c:if test="${empty ent.str1 && empty ent.str2  && isFiAc}">
  <jsp:include page="../in/spFiAd.jsp"/>
</c:if>
<c:if test="${not empty ent.str1 && empty ent.str2 && isFiAc}">
  <jsp:include page="../in/spFiEd.jsp"/>
</c:if>
<c:if test="${not empty ent.str1 && not empty ent.str2 && isFiAc}">
  <jsp:include page="../in/spFiDs.jsp"/>
</c:if>
<c:if test="${ent.spec.typ eq 'FILE_EMBEDDED'}">
  <jsp:include page="../in/spEmbf.jsp"/>
</c:if>
