<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty ent.cuFr}">
  ${hldUvd.toStr(rvs,cls,'toPa',ent.toPa)},
</c:if>
<c:if test="${not empty ent.cuFr}">
  ${hldUvd.toStr(rvs,cls,'paFc',ent.paFc)},
</c:if>
<c:if test="${ent.toPa.unscaledValue() eq 0 && ent.toPa.unscaledValue() eq 0}">
  ${i18n.getMsg("unpaid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${empty ent.cuFr && (ent.tot.unscaledValue() gt 0 && ent.toPa.compareTo(ent.tot) eq 0)
  || (ent.tot.unscaledValue() lt 0 && ent.toPa.compareTo(ent.tot.negate()) eq 0)}">
  ${i18n.getMsg("paid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${empty ent.cuFr && (ent.tot.unscaledValue() gt 0 && ent.toPa.compareTo(ent.tot) gt 0)
    || (ent.tot.unscaledValue() lt 0 && ent.toPa.compareTo(ent.tot.negate()) gt 0)}">
  ${i18n.getMsg("overpaid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${empty ent.cuFr && (ent.tot.unscaledValue() gt 0 && ent.toPa.unscaledValue() gt 0 && ent.toPa.compareTo(ent.tot) lt 0)
    || (ent.tot.unscaledValue() lt 0 && ent.toPa.unscaledValue() gt 0 && ent.toPa.compareTo(ent.tot.negate()) lt 0)}">
  ${i18n.getMsg("partially_paid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${not empty ent.cuFr && (ent.toFc.unscaledValue() gt 0 && ent.paFc.compareTo(ent.toFc) eq 0)
  || (ent.toFc.unscaledValue() lt 0 && ent.paFc.compareTo(ent.toFc.negate()) eq 0)}">
  ${i18n.getMsg("paid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${not empty ent.cuFr && (ent.toFc.unscaledValue() gt 0 && ent.paFc.compareTo(ent.toFc) gt 0)
    || (ent.toFc.unscaledValue() lt 0 && ent.paFc.compareTo(ent.toFc.negate()) gt 0)}">
  ${i18n.getMsg("overpaid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${not empty ent.cuFr && (ent.toFc.unscaledValue() gt 0 && ent.paFc.unscaledValue() gt 0 && ent.paFc.compareTo(ent.toFc) lt 0)
    || (ent.toFc.unscaledValue() lt 0 && ent.paFc.unscaledValue() gt 0 && ent.paFc.compareTo(ent.toFc.negate()) lt 0)}">
  ${i18n.getMsg("partially_paid", rvs.upf.lng.iid)}
</c:if>
