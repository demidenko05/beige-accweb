/*
BSD 2-Clause License

Copyright (c) 2019, Beigesoft™
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

//Opens subacc picker:
function bsPickSac(pFdNm, pPikng, pSaNm, pAdPr) {
  var acId=document.getElementById(pPikng + pFdNm + "Id").value;
  if(acId!="") {
    bsPick("Sacnt", pPikng, pSaNm, "&fopownrVlId=" + acId + "&fopownrOpr=eq&fopfrcd=ownr"+ pAdPr);
  } else {
    bsShwErr(BSMSG["choose_account_first"]);
  }
};

//Clears subacc picker:
function bsClearSac(pPikng, pSaNm) {
  document.getElementById(pPikng + pSaNm + "Id").value = "";
  document.getElementById(pPikng + pSaNm + "Ap").value = "";
  var saApVsb = document.getElementById(pPikng  + pSaNm + "ApVsb");
  saApVsb.value = "";
  bsInpChn(saApVsb);
};

//Selects/sets account by picker:
function bsSelAcc(pEntId, pEntAp, pIdDmPi, pSaId) {
  var whoPicking = BSSTATE["WhoPi"][pIdDmPi];
  var pref = whoPicking["pigEnt"] + whoPicking["piFld"];
  document.getElementById(pref +"Id").value = pEntId;
  var inpAp = document.getElementById(pref + "Ap");
  if (inpAp != null) { //invisible appearance to be sent
    inpAp.value=pEntAp;
  }
  var inpApVsb = document.getElementById(pref + "ApVsb");
  inpApVsb.value = pEntAp;
  bsInpChn(inpApVsb);
  var btSaPi = document.getElementById(pref + "SaPi");
  if (btSaPi != null) { //buttons subacc pick/clear:
    var btsSaDis = (pSaId == null);
    var btSaCl = document.getElementById(pref + "SaCl");
    btSaCl.onclick();
    btSaPi.disabled = btsSaDis;
    btSaCl.disabled = btsSaDis;
  }
  document.getElementById(pIdDmPi+"Dlg").close();
};


//set known or from returned invoice line cost for picked item, cost is already rounded and internationalized string value
function bsSetCost(pCost, pIdDmPi) {
  var whoPicking = BSSTATE["WhoPi"][pIdDmPi];
  var inpCostVsb = document.getElementById(whoPicking["pigEnt"] + "priVsb");
  var inpCost = document.getElementById(whoPicking["pigEnt"] + "pri");
  if (inpCost.value != pCost) {
    inpCost.value = pCost;
    if (inpCostVsb != null) {
      inpCostVsb.value = pCost;
      inpCostVsb.onchange();
    } else {
      inpCost.onchange();
    }
  }
};

//set UOM for picked item
function bsSetUom(uomId, uomName, pIdDmPi) {
  var whoPicking = BSSTATE["WhoPi"][pIdDmPi];
  var inpUomId = document.getElementById(whoPicking["pigEnt"] + "uomId");
  if (inpUomId != null) {
    inpUomId.value = uomId;
    var uomApVsb = document.getElementById(whoPicking["pigEnt"] + "uomApVsb");
    uomApVsb.value = uomName;
    uomApVsb.onchange();
  }
  var btTxDs = document.getElementById(whoPicking["pigEnt"] + "btTxDs");
  if (btTxDs != null) {
    //revealing dest tax cat:
    btTxDs.style.display="block";
  }
};

function bsSelSac(saId, subaccType, subaccAp, pIdDmPi) {
  var whoPicking = BSSTATE["WhoPi"][pIdDmPi];
  document.getElementById(whoPicking["pigEnt"] + whoPicking["piFld"] + "Ap").value = subaccAp;
  document.getElementById(whoPicking["pigEnt"] + whoPicking["piFld"] + "Ty").value = subaccType;
  document.getElementById(whoPicking["pigEnt"] + whoPicking["piFld"] + "Id").value = saId;
  var inpVsb = document.getElementById(whoPicking["pigEnt"] + whoPicking["piFld"] + "ApVsb");
  inpVsb.value = subaccAp;
  inpVsb.onchange();
  document.getElementById(pIdDmPi+"Dlg").close();
};

function selectChooseableSpecType(typeId, typeAp, pIdDmPi) {
  whoPicking = BSSTATE["WhoPi"][pIdDmPi];
  document.getElementById(whoPicking["pigEnt"] + whoPicking["piFld"] +"TyId").setAttribute("value", typeId);
  var inpAp = document.getElementById(whoPicking["pigEnt"] + whoPicking["piFld"] + "TyAp");
  inpAp.setAttribute("value", typeAp);
  var inpApVsb = document.getElementById(whoPicking["pigEnt"] + whoPicking["piFld"] + "TyApVsb");
  inpApVsb.value = typeAp;
  inpApVsb.onchange();
};
//clears subacc
function bsClrSal(entitySimpleName) {
  document.getElementById(entitySimpleName + "saId").setAttribute("value", "");
  document.getElementById(entitySimpleName + "saNmAp").setAttribute("value", "");
  document.getElementById(entitySimpleName + "saNmApVsb").setAttribute("value", "");
};

function selectAccSubacc(pEntId, pEntAp, pIdDmPi) {
  var whoPicking = BSSTATE["WhoPi"][pIdDmPi];
  document.getElementById(whoPicking["pigEnt"] +"saId").setAttribute("value", pEntId);
  document.getElementById(whoPicking["pigEnt"] +"saNmAp").setAttribute("value", pEntAp);
  var inpApVsb = document.getElementById(whoPicking["pigEnt"] + "saNmApVsb");
  inpApVsb.value = pEntAp;
  inpApVsb.onchange();
  document.getElementById(pIdDmPi+"Dlg").close();
};

function bsMkWgToTx(pInp, nameEntity, totalGross, pTaxDp, pTaxRm) {
  var inpAllowance = document.getElementById(nameEntity + "alwc");
  var inpPlusAmount = document.getElementById(nameEntity + "plAm");
  var inpPercentage = document.getElementById(nameEntity + "rate");
  var alwc = bsStrFlt(inpAllowance.value);
  var plAm = bsStrFlt(inpPlusAmount.value);
  var rate = bsStrFlt(inpPercentage.value);
  var inpTotal = document.getElementById(nameEntity + "tot");
  var total = bsRound(plAm + (totalGross - alwc) * rate / 100, pTaxDp, pTaxRm);
  inpTotal.value = bsNumStr(total.toString(), pTaxDp);
  bsInpChn(inpTotal);
  bsInpChn(pInp);
};

function bsClrWgTxs(nameEntity) {
  var inpTotalWageTaxes = document.getElementById(nameEntity + "toWgTx");
  var inpTotalWageTaxesVsb = document.getElementById(nameEntity + "toWgTxVsb");
  inpTotalWageTaxes.value = 0;
  inpTotalWageTaxesVsb.value = 0;
  bsInpChn(inpTotalWageTaxesVsb);
};

function bsSelWgRtPlAm(rate, plAm, pIdDmPi) {
  var whoPicking = BSSTATE["WhoPi"][pIdDmPi];
  var inpPercentage = document.getElementById(whoPicking["pigEnt"] + "rate");
  if(inpPercentage != null) {
    var inpPlusAmount = document.getElementById(whoPicking["pigEnt"] + "plAm");
    if(inpPlusAmount != null) {
      inpPlusAmount.value = plAm;
      bsInpChn(inpPlusAmount);
    }
    inpPercentage.value = rate;
    inpPercentage.onchange();
  }
};

function makeFltrPaymentTot(pInp, pIdSelFlt) {
  var fldWas;
  var fldIs;
  if (pInp.options[pInp.selectedIndex].value == "TOT") {
    fltIs = "TOT";
    fltWas = "TOFC";
  } else {
    fltIs = "TOFC";
    fltWas = "TOT";
  }
  var selFlt = document.getElementById(pIdSelFlt);
  for (var i=0; i < selFlt.options.length; i++) {
    selFlt.options[i].value = selFlt.options[i].value.replace(fltWas, fltIs);
  }  
};

function bnStLnAccentryMatchChanged(pInp) {
  var tbPrepPayEntry = document.getElementById("bnkStLnPrepPayEntry");
  var tbPrepPay = document.getElementById("bnkStLnPrepPay");
  var tbPrep = document.getElementById("bnkStLnPrep");
  var tbPay = document.getElementById("bnkStLnPay");
  var tbEntry = document.getElementById("bnkStLnEntry");
  var bnkStLnPrepMatch = document.getElementById("bnkStLnPrepMatch");
  var bnkStLnPayMatch = document.getElementById("bnkStLnPayMatch");
  if (pInp.selectedIndex == 0) {
    if (tbPrepPayEntry != null) { tbPrepPayEntry.style.display="table"; }
    if (tbPrepPay != null) { tbPrepPay.style.display="table"; }
    if (tbPrep != null) { tbPrep.style.display="table"; }
    if (tbPay != null) { tbPay.style.display="table"; }
    if (tbEntry != null) { tbEntry.style.display="table"; }
    if (bnkStLnPrepMatch != null) { bnkStLnPrepMatch.style.display="table"; }
    if (bnkStLnPayMatch != null) { bnkStLnPayMatch.style.display="table"; }
  } else {
    if (tbPrepPayEntry != null) { tbPrepPayEntry.style.display="none"; }
    if (tbPrepPay != null) { tbPrepPay.style.display="none"; }
    if (tbPrep != null) { tbPrep.style.display="none"; }
    if (tbPay != null) { tbPay.style.display="none"; }
    if (tbEntry != null) { tbEntry.style.display="none"; }
    if (bnkStLnPrepMatch != null) { bnkStLnPrepMatch.style.display="none"; }
    if (bnkStLnPayMatch != null) { bnkStLnPayMatch.style.display="none"; }
  }
};

function bnStLnPrepayMatchChanged(pInp) {
  var tbPrepPayEntry = document.getElementById("bnkStLnPrepPayEntry");
  var tbPrepPay = document.getElementById("bnkStLnPrepPay");
  var tbPrep = document.getElementById("bnkStLnPrep");
  var tbPay = document.getElementById("bnkStLnPay");
  var tbEntry = document.getElementById("bnkStLnEntry");
  var bnkStLnPayMatch = document.getElementById("bnkStLnPayMatch");
  var bnkStLnAccentryMatch = document.getElementById("bnkStLnAccentryMatch");
  if (pInp.selectedIndex == 0) {
    if (tbPrepPayEntry != null) { tbPrepPayEntry.style.display="table"; }
    if (tbPrepPay != null) { tbPrepPay.style.display="table"; }
    if (tbPrep != null) { tbPrep.style.display="table"; }
    if (tbPay != null) { tbPay.style.display="table"; }
    if (tbEntry != null) { tbEntry.style.display="table"; }
    if (bnkStLnPayMatch != null) { bnkStLnPayMatch.style.display="table"; }
    if (bnkStLnAccentryMatch != null) { bnkStLnAccentryMatch.style.display="table"; }
  } else {
    if (tbPrepPayEntry != null) { tbPrepPayEntry.style.display="none"; }
    if (tbPrepPay != null) { tbPrepPay.style.display="none"; }
    if (tbPrep != null) { tbPrep.style.display="none"; }
    if (tbPay != null) { tbPay.style.display="none"; }
    if (tbEntry != null) { tbEntry.style.display="none"; }
    if (bnkStLnPayMatch != null) { bnkStLnPayMatch.style.display="none"; }
    if (bnkStLnAccentryMatch != null) { bnkStLnAccentryMatch.style.display="none"; }
  }
};

function bnStLnPayMatchChanged(pInp) {
  var tbPrepPayEntry = document.getElementById("bnkStLnPrepPayEntry");
  var tbPrepPay = document.getElementById("bnkStLnPrepPay");
  var tbPrep = document.getElementById("bnkStLnPrep");
  var tbPay = document.getElementById("bnkStLnPay");
  var tbEntry = document.getElementById("bnkStLnEntry");
  var bnkStLnPrepMatch = document.getElementById("bnkStLnPrepMatch");
  var bnkStLnAccentryMatch = document.getElementById("bnkStLnAccentryMatch");
  if (pInp.selectedIndex == 0) {
    if (tbPrepPayEntry != null) { tbPrepPayEntry.style.display="table"; }
    if (tbPrepPay != null) { tbPrepPay.style.display="table"; }
    if (tbPrep != null) { tbPrep.style.display="table"; }
    if (tbPay != null) { tbPay.style.display="table"; }
    if (tbEntry != null) { tbEntry.style.display="table"; }
    if (bnkStLnPrepMatch != null) { bnkStLnPrepMatch.style.display="table"; }
    if (bnkStLnAccentryMatch != null) { bnkStLnAccentryMatch.style.display="table"; }
  } else {
    if (tbPrepPayEntry != null) { tbPrepPayEntry.style.display="none"; }
    if (tbPrepPay != null) { tbPrepPay.style.display="none"; }
    if (tbPrep != null) { tbPrep.style.display="none"; }
    if (tbPay != null) { tbPay.style.display="none"; }
    if (tbEntry != null) { tbEntry.style.display="none"; }
    if (bnkStLnPrepMatch != null) { bnkStLnPrepMatch.style.display="none"; }
    if (bnkStLnAccentryMatch != null) { bnkStLnAccentryMatch.style.display="none"; }
  }
};

function bnStLnDocTypeChanged(pInp) {
  var tbPrepPayEntry = document.getElementById("bnkStLnPrepPayEntry");
  var tbPrepPay = document.getElementById("bnkStLnPrepPay");
  var tbPrep = document.getElementById("bnkStLnPrep");
  var tbPay = document.getElementById("bnkStLnPay");
  var tbEntry = document.getElementById("bnkStLnEntry");
  var bnkStLnPrepMatch = document.getElementById("bnkStLnPrepMatch");
  var bnkStLnPayMatch = document.getElementById("bnkStLnPayMatch");
  var bnkStLnAccentryMatch = document.getElementById("bnkStLnAccentryMatch");
  if (pInp.selectedIndex == 0) {
    if (tbPrepPayEntry != null) { tbPrepPayEntry.style.display="none"; }
    if (tbPrepPay != null) { tbPrepPay.style.display="none"; }
    if (tbPrep != null) { tbPrep.style.display="none"; }
    if (tbPay != null) { tbPay.style.display="none"; }
    if (tbEntry != null) { tbEntry.style.display="none"; }
    if (bnkStLnPrepMatch != null) { bnkStLnPrepMatch.style.display="table"; }
    if (bnkStLnPayMatch != null) { bnkStLnPayMatch.style.display="table"; }
    if (bnkStLnAccentryMatch != null) { bnkStLnAccentryMatch.style.display="table"; }
  } else if (pInp.selectedIndex == 1) {
    if (tbPrepPayEntry != null) { tbPrepPayEntry.style.display="table"; }
    if (tbPrepPay != null) { tbPrepPay.style.display="table"; }
    if (tbPrep != null) { tbPrep.style.display="table"; }
    if (tbPay != null) { tbPay.style.display="none"; }
    if (tbEntry != null) { tbEntry.style.display="none"; }
    if (bnkStLnPrepMatch != null) { bnkStLnPrepMatch.style.display="none"; }
    if (bnkStLnPayMatch != null) { bnkStLnPayMatch.style.display="none"; }
    if (bnkStLnAccentryMatch != null) { bnkStLnAccentryMatch.style.display="none"; }
  } else if (pInp.selectedIndex == 2) {
    if (tbPrepPayEntry != null) { tbPrepPayEntry.style.display="table"; }
    if (tbPrepPay != null) { tbPrepPay.style.display="table"; }
    if (tbPrep != null) { tbPrep.style.display="none"; }
    if (tbPay != null) { tbPay.style.display="table"; }
    if (tbEntry != null) { tbEntry.style.display="none"; }
    if (bnkStLnPrepMatch != null) { bnkStLnPrepMatch.style.display="none"; }
    if (bnkStLnPayMatch != null) { bnkStLnPayMatch.style.display="none"; }
    if (bnkStLnAccentryMatch != null) { bnkStLnAccentryMatch.style.display="none"; }
  } else if (pInp.selectedIndex == 3) {
    if (tbPrepPayEntry != null) { tbPrepPayEntry.style.display="table"; }
    if (tbPrepPay != null) { tbPrepPay.style.display="none"; }
    if (tbPrep != null) { tbPrep.style.display="none"; }
    if (tbPay != null) { tbPay.style.display="none"; }
    if (tbEntry != null) { tbEntry.style.display="table"; }
    if (bnkStLnPrepMatch != null) { bnkStLnPrepMatch.style.display="none"; }
    if (bnkStLnPayMatch != null) { bnkStLnPayMatch.style.display="none"; }
    if (bnkStLnAccentryMatch != null) { bnkStLnAccentryMatch.style.display="none"; }
  }
};

function selectCsvPath(pVal, pPathAppr) {
  var CsvCldtIdx = document.getElementById("CsvCldtIdx");
  var CsvClfldPh = document.getElementById("CsvClfldPh");
  var dataPath = document.getElementById("dataPath");
  var scIdx = pVal.indexOf(";");
  if (scIdx == -1) {
    CsvCldtIdx.value = pVal;
    CsvClfldPh.value = "";
  } else {
    var arr = pVal.split(";");
    CsvCldtIdx.value = arr[0];
    CsvClfldPh.value = arr[1];
  }
  dataPath.value = pPathAppr;
  dataPath.onchange();
};

function clearCsvPath() {
  var CsvCldtIdx = document.getElementById("CsvCldtIdx");
  var dataPath = document.getElementById("dataPath");
  var CsvClfldPh = document.getElementById("CsvClfldPh");
  CsvClfldPh.value = "";
  CsvCldtIdx.value = "";
  dataPath.value = "";
  dataPath.onchange();
};

function openCsvPathPicker(pPath, pReadNm) {
  var picker = document.getElementById("picCsvPth" + pReadNm + "Dlg");
  if (picker != null) {
      picker.showModal();
  } else {
    bsGtAjx('GET', pPath + pReadNm);
  }
};

function bsClcPriTx(pInp, nameEntity, pPriceNm, pPriceDp, pPriceRm, pIsTaxIncluded, pTaxDp, pTaxRm) {
  var inpTotal = document.getElementById(nameEntity + "tot");
  var total = bsStrFlt(inpTotal.value);
  bsClcTx(nameEntity, total, pIsTaxIncluded, pTaxDp, pTaxRm);
  var inpQuantity = document.getElementById(nameEntity + "quan");
  var quantity = bsStrFlt(inpQuantity.value);
  var inpPrice = document.getElementById(nameEntity + pPriceNm);
  var price = bsRound(total/quantity, pPriceDp, pPriceRm);
  inpPrice.value = bsNumStr(price.toString(), pPriceDp);
  var inpPriceVsb = document.getElementById(nameEntity + pPriceNm + "Vsb");
  if (inpPriceVsb != null) {
    inpPriceVsb.value = inpPrice.value;
    bsInpChn(inpPriceVsb);
  } else {
    bsInpChn(inpPrice);
  }
  bsInpChn(pInp);
};

function bsClcToTx(pInp, nameEntity, pPriceNm, pPriceDp, pPriceRm, pIsTaxIncluded, pTaxDp, pTaxRm) {
  var inpPrice = document.getElementById(nameEntity + pPriceNm);
  var price = bsStrFlt(inpPrice.value);
  var inpQuantity = document.getElementById(nameEntity + "quan");
  var quantity = bsStrFlt(inpQuantity.value);
  var inpTotal = document.getElementById(nameEntity + "tot");
  var total = bsRound(price * quantity, pPriceDp, pPriceRm);
  inpTotal.value = bsNumStr(total.toString(), pPriceDp);
  var inpTotalVsb = document.getElementById(nameEntity + "totVsb");
  if (inpTotalVsb != null) {
    inpTotalVsb.value = inpTotal.value;
    bsInpChn(inpTotalVsb);
  } else {
    bsInpChn(inpTotal);
  }
  bsInpChn(pInp);
  bsClcTx(nameEntity, total, pIsTaxIncluded, pTaxDp, pTaxRm);
};

function bsSetTxCt(pTcRate, pTcNm, pIdDomBasePicker, pIsTaxIncluded, pTaxDp, pTaxRm, pPriceDp) {
  var whoPicking = BSSTATE["WhoPi"][pIdDomBasePicker];
  var btTxDs = document.getElementById(whoPicking["pigEnt"] + "btTxDs");
  var inpTaxNm = document.getElementById(whoPicking["pigEnt"] + "txCt");
  var inpTaxRate = document.getElementById(whoPicking["pigEnt"] + "rate");
  if (btTxDs == null) {
    inpTaxNm.value = pTcNm;
    if (inpTaxRate != null) { // aggregate or only rate
      inpTaxRate.value = bsNumStr(pTcRate.toString(), pTaxDp);
      bsClcTxFrTo(whoPicking["pigEnt"], pIsTaxIncluded, pPriceDp, pTaxRm);
      bsInpChn(inpTaxRate);
    }
  } else {
    btTxDs.style.display="inherit";
    inpTaxNm.value = "";
    if (inpTaxRate != null) { // aggregate or only rate
      inpTaxRate.value = "";
      bsClcTxFrTo(whoPicking["pigEnt"], pIsTaxIncluded, pPriceDp, pTaxRm);
      bsInpChn(inpTaxRate);
    }
  }
  bsInpChn(inpTaxNm);
};

function bsSetDstTx(pTcRate, pTcNm, pEntityName, pIsTaxIncluded, pTaxDp, pTaxRm, pPriceDp) {
  var inpTaxNm = document.getElementById(pEntityName + "txCt");
  inpTaxNm.value = pTcNm;
  bsInpChn(inpTaxNm);
  var inpTaxRate = document.getElementById(pEntityName + "rate");
  if (inpTaxRate != null) { // aggregate or only rate
    inpTaxRate.value = bsNumStr(pTcRate.toString(), pTaxDp);
    bsInpChn(inpTaxRate);
    bsClcTxFrTo(pNameEntity, pIsTaxIncluded, pPriceDp, pTaxRm);
  }
  var btTxDs = document.getElementById(pEntityName + "btTxDs");
  btTxDs.style.display="none";
};

function bsClcTxFrTo(nameEntity, pIsTaxIncluded, pPriceDp, pTaxRm) {
  var inpTotal = document.getElementById(nameEntity + "tot");
  var total = bsStrFlt(inpTotal.value);
  bsClcTx(nameEntity, total, pIsTaxIncluded, pPriceDp, pTaxRm);
};

function bsClcTx(pNameEntity, pTotal, pIsTaxIncluded, pPriceDp, pTaxRm) {
  var inpTaxRate = document.getElementById(pNameEntity + "rate");
  var inpTaxTotal = document.getElementById(pNameEntity + "toTx");
  var taxTotal;
  if (inpTaxRate.value == "") {
    taxTotal = 0.0;
  } else {
    var taxRate = bsStrFlt(inpTaxRate.value);
    if (pIsTaxIncluded) {
      taxTotal = bsRound(pTotal-(pTotal/(1.0+taxRate/100.0)),  pPriceDp, pTaxRm);
    } else {
      taxTotal = bsRound(pTotal*taxRate/100.0,  pPriceDp, pTaxRm);
    }
  }
  inpTaxTotal.value = bsNumStr(taxTotal.toString(), pPriceDp);
  bsInpChn(inpTaxTotal);
};

function bsClcTot(pInp, nameEntity, pPriceNm, pDecPl, pRm) {
  var inpPrice = document.getElementById(nameEntity + pPriceNm);
  var price = bsStrFlt(inpPrice.value);
  var inpQuantity = document.getElementById(nameEntity + "quan");
  var quantity = bsStrFlt(inpQuantity.value);
  var inpTotal = document.getElementById(nameEntity + "tot");
  var total = bsRound(price * quantity, pDecPl, pRm);
  var totals = bsNumStr(total.toString(), pDecPl);
  inpTotal.value = totals;
  var inpTotalVisible = document.getElementById(nameEntity + "totVsb");
  if (inpTotalVisible != null) {
    inpTotalVisible.value = totals;
    bsInpChn(inpTotalVisible);
  } else {
    bsInpChn(inpTotal);
  }
  bsInpChn(pInp);
};

function bsClcPri(pInp, nameEntity, pPriceNm, pDecPl, pRm) {
  var inpTotal = document.getElementById(nameEntity + "tot");
  var total = bsStrFlt(inpTotal.value);
  var inpQuantity = document.getElementById(nameEntity + "quan");
  var quantity = bsStrFlt(inpQuantity.value);
  var inpPrice = document.getElementById(nameEntity + pPriceNm);
  var price = bsRound(total/quantity, pDecPl, pRm);
  var prices = bsNumStr(price.toString(), pDecPl);
  inpPrice.value = prices;
  var inpPriceVisible = document.getElementById(nameEntity + pPriceNm + "Vsb");
  if (inpPriceVisible != null) {
    inpPriceVisible.value = prices;
    bsInpChn(inpPriceVisible);
  } else {
    bsInpChn(inpPrice);
  }
  bsInpChn(pInp);
};
