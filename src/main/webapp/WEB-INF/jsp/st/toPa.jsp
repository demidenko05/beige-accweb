<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
${hldUvd.toStr(rvs,cls,fdNm,mdl)},
<c:if test="${mdl.doubleValue() eq 0}">
  ${i18n.getMsg("unpaid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${empty ent.cuFr && (mdl.doubleValue() eq ent.tot.doubleValue() && ent.tot.doubleValue() gt 0)
  || (mdl.doubleValue() eq -ent.tot.doubleValue() && ent.tot.doubleValue() lt 0)}">
  ${i18n.getMsg("paid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${empty ent.cuFr && (mdl.doubleValue() gt ent.tot.doubleValue() && ent.tot.doubleValue() gt 0)
    || (mdl.doubleValue() gt -ent.tot.doubleValue() && ent.tot.doubleValue() lt 0)}">
  ${i18n.getMsg("overpaid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${empty ent.cuFr && (mdl.doubleValue() gt 0 && mdl.doubleValue() lt ent.tot.doubleValue() && ent.tot.doubleValue() gt 0)
    || (mdl.doubleValue() gt 0 && mdl.doubleValue() lt -ent.tot.doubleValue() && ent.tot.doubleValue() lt 0)}">
  ${i18n.getMsg("partially_paid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${not empty ent.cuFr && (mdl.doubleValue() eq ent.toFc.doubleValue() && ent.toFc.doubleValue() gt 0)
  || (mdl.doubleValue() eq -ent.toFc.doubleValue() && ent.toFc.doubleValue() lt 0)}">
  ${i18n.getMsg("paid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${not empty ent.cuFr && (mdl.doubleValue() gt ent.toFc.doubleValue() && ent.toFc.doubleValue() gt 0)
    || (mdl.doubleValue() gt -ent.toFc.doubleValue() && ent.toFc.doubleValue() lt 0)}">
  ${i18n.getMsg("overpaid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${not empty ent.cuFr && (mdl.doubleValue() gt 0 && mdl.doubleValue() lt ent.toFc.doubleValue() && ent.toFc.doubleValue() gt 0)
    || (mdl.doubleValue() gt 0 && mdl.doubleValue() lt -ent.toFc.doubleValue() && ent.toFc.doubleValue() lt 0)}">
  ${i18n.getMsg("partially_paid", rvs.upf.lng.iid)}
</c:if>
