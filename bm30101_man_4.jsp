<%
request.setCharacterEncoding("Big5");
response.setCharacterEncoding("Big5");
%>

<%--JSP Page Init @1-C8406EBE--%>
<%@page import="com.codecharge.*,com.codecharge.components.*,com.codecharge.util.*,com.codecharge.events.*,com.codecharge.feature.*,com.codecharge.db.*,com.codecharge.validation.*,java.util.*,java.io.*,com.codecharge.util.cache.CacheEvent,com.codecharge.util.cache.ICache,com.codecharge.template.*"%>
<%if ((new bm30101_man_4ServiceChecker()).check(request, response, getServletContext())) return;%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/ccstags" prefix="ccs"%>
<%--End JSP Page Init--%>

<%--Page Body @1-8B3FA5EB--%>
<%@include file="bm30101_man_4Handlers.jsp"%>
<%
    if (!bm30101_man_4Model.isVisible()) return;
    if (bm30101_man_4Parent != null) {
        if (!bm30101_man_4Parent.getChild(bm30101_man_4Model.getName()).isVisible()) return;
    }
    pageContext.setAttribute("parent", bm30101_man_4Model);
    pageContext.setAttribute("page", bm30101_man_4Model);
    bm30101_man_4Model.fireOnInitializeViewEvent(new Event());
    bm30101_man_4Model.fireBeforeShowEvent(new Event());

    Page curPage = (Page) bm30101_man_4Model;
    String pathToRoot = curPage.getAttribute(Page.PAGE_ATTRIBUTE_PATH_TO_ROOT).toString();

    // Include once for client scripts
    String scripts = "|js/jquery/jquery.js|js/jquery/event-manager.js|js/jquery/selectors.js|";
    request.setAttribute("parentPathToRoot", pathToRoot);
    request.setAttribute("scriptIncludes", scripts);
    ((ModelAttribute) curPage.getAttribute("scriptIncludes"))
            .setValue("<!--[scriptIncludes][begin]--><!--[scriptIncludes][end]-->");

    if (!bm30101_man_4Model.isVisible()) return;
%>
<%--End Page Body--%>

<%--JSP Page Content @1-2A77B3AC--%>
<!DOCTYPE HTML>
<html>
<head>
<ccs:meta header="Content-Type"/>
<title>建築管理資訊系統</title>
<meta name="GENERATOR" content="CodeCharge Studio 5.0.0.16254">
<link rel="icon" type="image/x-icon" href="img/Taipei_County_Seal.ico">
<link rel="stylesheet" type="text/css" href="Styles/Synct/jquery-ui.css">
<script language="JavaScript" type="text/javascript">
//Begin CCS script
//Include Common JSFunctions @1-A7198D31
</script>
<script src="ClientI18N.jsp?file=Globalize.js&amp;locale=<ccs:message key="CCS_LocaleID"/>" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
//End Include Common JSFunctions

//Include User Scripts @1-92024ECE
</script>
<ccs:attribute owner='page' name='scriptIncludes'/>
<script type="text/javascript">
//End Include User Scripts

//Common Script Start @1-8BFA436B
jQuery(function ($) {
    var features = { };
    var actions = { };
    var params = { };
//End Common Script Start

//NewRecord1REG_KINDOnChange Event Start @-F8231735
    actions["NewRecord1REG_KINDOnChange"] = function (eventType, parameters) {
        var result = true;
//End NewRecord1REG_KINDOnChange Event Start

//Custom Code @20-2A29BDB7

        document.getElementById("BMSREGTIO_DATE").value =  document.getElementById("BMSREGTYYYMMDD").value;
        document.getElementById("BMSREGTORG_OT_DATE").value =  document.getElementById("BMSREGTYYYMMDD").value;
        document.getElementById("BMSREGTIO_TIME").value =  document.getElementById("BMSREGTHHMM").value;
        document.getElementById("BMSREGTSIGN_DATE").value =  document.getElementById("BMSREGTYYYMMDD").value;
        document.getElementById("BMSREGTSIGN_TIME").value =  document.getElementById("BMSREGTHHMM").value;
           
         var bldcodevalue = document.getElementById("BMSREGTREG_KIND").options[document.getElementById("BMSREGTREG_KIND").selectedIndex].value;
        document.getElementById("BMSREGTREG_KIND_E").value = bldcodevalue; 

        
//End Custom Code

//NewRecord1REG_KINDOnChange Event End @-A5B9ECB8
        return result;
    };
//End NewRecord1REG_KINDOnChange Event End

//NewRecord1REG_KIND_EOnChange Event Start @-D38DFFAE
    actions["NewRecord1REG_KIND_EOnChange"] = function (eventType, parameters) {
        var result = true;
//End NewRecord1REG_KIND_EOnChange Event Start

//Custom Code @22-2A29BDB7

        document.getElementById("BMSREGTREG_KIND").value = document.getElementById("BMSREGTREG_KIND_E").value;
                kindchange();
                
//End Custom Code

//NewRecord1REG_KIND_EOnChange Event End @-A5B9ECB8
        return result;
    };
//End NewRecord1REG_KIND_EOnChange Event End

//NewRecord1ACTN_EMPL_EOnChange Event Start @-37A244C4
    actions["NewRecord1ACTN_EMPL_EOnChange"] = function (eventType, parameters) {
        var result = true;
//End NewRecord1ACTN_EMPL_EOnChange Event Start

//Custom Code @24-2A29BDB7

        document.getElementById("BMSREGTACTN_EMPL").value = document.getElementById("BMSREGTACTN_EMPL_E").value;

//End Custom Code

//NewRecord1ACTN_EMPL_EOnChange Event End @-A5B9ECB8
        return result;
    };
//End NewRecord1ACTN_EMPL_EOnChange Event End

//NewRecord1ACTN_EMPLOnChange Event Start @-38B62E01
    actions["NewRecord1ACTN_EMPLOnChange"] = function (eventType, parameters) {
        var result = true;
//End NewRecord1ACTN_EMPLOnChange Event Start

//Custom Code @26-2A29BDB7

        var empvalue = document.getElementById("BMSREGTACTN_EMPL").options[document.getElementById("BMSREGTACTN_EMPL").selectedIndex].value;
        document.getElementById("BMSREGTACTN_EMPL_E").value = empvalue; 


//End Custom Code

//NewRecord1ACTN_EMPLOnChange Event End @-A5B9ECB8
        return result;
    };
//End NewRecord1ACTN_EMPLOnChange Event End

//OnLoad Event Start @-2FD76255
    actions["OnLoad"] = function (eventType, parameters) {
        var result = true;
//End OnLoad Event Start

//Custom Code @14-2A29BDB7
// -------------------------
// Write your own code here.
// -------------------------
//End Custom Code

//OnLoad Event End @-A5B9ECB8
        return result;
    };
//End OnLoad Event End

//Event Binding @1-5626F51F
    $('*:ccsControl(NewRecord1, REG_KIND)').ccsBind(function() {
        this.bind("change", actions["NewRecord1REG_KINDOnChange"]);
    });
    $('*:ccsControl(NewRecord1, REG_KIND_E)').ccsBind(function() {
        this.bind("change", actions["NewRecord1REG_KIND_EOnChange"]);
    });
    $('*:ccsControl(NewRecord1, ACTN_EMPL_E)').ccsBind(function() {
        this.bind("change", actions["NewRecord1ACTN_EMPL_EOnChange"]);
    });
    $('*:ccsControl(NewRecord1, ACTN_EMPL)').ccsBind(function() {
        this.bind("change", actions["NewRecord1ACTN_EMPLOnChange"]);
    });
    $(window).ccsBind(function() {
        this.each(function(){ actions["OnLoad"].call(this); });
    });
//End Event Binding

//Plugin Calls @1-00453011
    $('*:ccsControl(NewRecord1, Button_Cancel)').ccsBind(function() {
        this.bind("click", function(){ $("body").data("disableValidation", true); });
    });
//End Plugin Calls

//Common Script End @1-562554DE
});
//End Common Script End

//End CCS script

function open_empno(){
        var editid    = "NewRecord1ACTN_EMPL_E";
        var listboxid = "NewRecord1ACTN_EMPL";
        var modalid   = "empnoModal";

    document.getElementById("EDITID").value    = editid;
    document.getElementById("LISTBOXID").value = listboxid;
    document.getElementById("MODALID").value   = modalid;
    $('#' + modalid).modal('show');
}

function open_bldcode(code_name,code_type,sub_seq,sub_seq1,editid,listboxid,onchangefname){
    var modalid   = "bldcodeModal";
        document.getElementById("BLDCODESearchs_CODE_TYPE").value = code_type;
        document.getElementById("BLDCODESearchs_SUB_SEQ").value   = sub_seq;
        document.getElementById("BLDCODESearchs_SUB_SEQ1").value  = sub_seq1;

    document.getElementById("EDITID").value                   = editid;
    document.getElementById("LISTBOXID").value                = listboxid;
    document.getElementById("MODALID").value                  = modalid;
    document.getElementById("ONCHANGEFNAME").value            = onchangefname;

    //onload 抓取資料
    getbldcodedata();

    $(bldcodeModalLabel).text(code_name + "代碼資料選取");
    $('#' + modalid).modal('show');
}

</script>
</head>
<body class="theme-default main-menu-animated">
<div id="main-wrapper">
  <jsp:include flush="true" page="main_menu.jsp" />
  <div id="content-wrapper">
    <ul class="breadcrumb breadcrumb-page">
      <li>案件管理 
      <li class="active">BM30101申請案件及分文登錄 </li>
    </ul>
    <div class="row">
      <ccs:record name='NewRecord1'>
      <form id="CP_REC" method="post" name="<ccs:form_name/>" action="<ccs:form_action/>">
        <div class="col-sm-12">
          <div class="panel">
            <div class="panel panel-info">
              <div class="panel-heading">
                <span class="panel-title">複製掛號資料</span> 
              </div>
            </div>
            <table class="table table-striped table-bordered" cellspacing="0" cellpadding="0">
              <ccs:error_block>
              <tr id="NewRecord1ErrorBlock" class="text-danger">
                <td colspan="2"><ccs:error_text/></td>
              </tr>
              </ccs:error_block>
              <tr class="Controls">
                <th class="text-danger text-right" width="20%">*書表編號</th>
 
                <td><input type="text" id="NewRecord1BOOKSHEET" value="<ccs:control name='BOOKSHEET'/>" name="<ccs:control name='BOOKSHEET' property='name'/>"></td>
              </tr>
 
              <tr class="Controls">
                <th class="text-danger text-right">*新掛號號碼</th>
 
                <td><input type="text" id="NewRecord1N_REG_YY" maxlength="3" size="3" value="<ccs:control name='N_REG_YY'/>" name="<ccs:control name='N_REG_YY' property='name'/>">-<input type="text" id="NewRecord1N_REG_NO" maxlength="7" size="7" value="<ccs:control name='N_REG_NO'/>" name="<ccs:control name='N_REG_NO' property='name'/>">-<input type="text" id="NewRecord1N_REG_CG" maxlength="2" size="2" value="<ccs:control name='N_REG_CG'/>" name="<ccs:control name='N_REG_CG' property='name'/>"></td>
              </tr>
 
              <tr class="Controls">
                <th class="text-danger text-right">&nbsp;*第一次掛號號碼</th>
 
                <td>&nbsp;<input type="text" id="NewRecord1FIRST_REG" value="<ccs:control name='FIRST_REG'/>" name="<ccs:control name='FIRST_REG' property='name'/>"></td>
              </tr>
 
              <tr class="Controls">
                <th class="text-danger text-right">*業務別</th>
 
                <td>&nbsp;<input type="text" ondblclick="open_bldcode('業務別','OFC','','','V,NewRecord1REG_KIND_E','V,NewRecord1REG_KIND','');" id="NewRecord1REG_KIND_E" style="BACKGROUND-COLOR: #fcf5d8" maxlength="3" size="3" value="<ccs:control name='REG_KIND_E'/>" name="<ccs:control name='REG_KIND_E' property='name'/>">
                  <select id="NewRecord1REG_KIND" name="<ccs:control name='REG_KIND' property='name'/>">
                    <option selected value="">選擇值</option>
                    <ccs:control name='REG_KIND' property='options'/>
                  </select>
 </td>
              </tr>
 
              <tr class="Controls">
                <th class="text-danger text-right">*承辦人</th>
 
                <td><input type="text" ondblclick="open_empno();" id="NewRecord1ACTN_EMPL_E" style="BACKGROUND-COLOR: #fcf5d8" maxlength="10" size="8" value="<ccs:control name='ACTN_EMPL_E'/>" name="<ccs:control name='ACTN_EMPL_E' property='name'/>">
                  <select id="NewRecord1ACTN_EMPL" name="<ccs:control name='ACTN_EMPL' property='name'/>">
                    <option selected value="">選擇值</option>
                    <ccs:control name='ACTN_EMPL' property='options'/>
                  </select>
 </td>
              </tr>
 
              <tr class="Bottom">
                <td style="TEXT-ALIGN: right" colspan="2">
                  <ccs:button name='Button_Insert'><input type="submit" id="NewRecord1Button_Insert" class="Button" alt="確認" value="確認" name="<ccs:control name='Button_Insert' property='name'/>"></ccs:button>
                  <ccs:button name='Button_Cancel'><input type="submit" id="NewRecord1Button_Cancel" class="Button" alt="返回" value="返回" name="<ccs:control name='Button_Cancel' property='name'/>"></ccs:button></td>
              </tr>
            </table>
          </form>
        </div>
      </div>
    </div>
    </ccs:record>
  </div>
</div>
<div id="main-menu-bg">
</div>
<div>
</div>
<script type="text/javascript"> window.jQuery || document.write('<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js">'+"<"+"/script>"); </script>
<script src="assets/javascripts/bootstrap.min.js"></script>
<script src="assets/javascripts/synctMenu.min.js"></script>
<script type="text/javascript">
        init.push(function () {
                // Javascript code here
        })
        window.PixelAdmin.start(init);
</script>
<!-- empnoModal start -->
<div role="dialog" tabindex="-1" aria-hidden="true" id="empnoModal" class="modal fade" aria-labelledby='empnoModalLabel"'>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button aria-hidden="true" class="close" data-dismiss="modal">×</button> 
        <h4 id="myModalLabel" class="modal-title">承辦人資料選取</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="EDITID"><input type="hidden" id="LISTBOXID"><input type="hidden" id="MODALID">
        <jsp:include flush="true" page="getempno.jsp" />
      </div>
    </div>
  </div>
</div>
<!-- empnoModal end-->
<!-- bldcodeModal start -->
<div role="dialog" tabindex="-1" aria-hidden="true" id="bldcodeModal" class="modal fade" aria-labelledby="bldcodeModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button aria-hidden="true" class="close" data-dismiss="modal">×</button> 
        <h4 id="bldcodeModalLabel" class="modal-title">代碼資料選取</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="BLDCODESearchs_CODE_TYPE"><input type="hidden" id="BLDCODESearchs_SUB_SEQ"><input type="hidden" id="BLDCODESearchs_SUB_SEQ1"><input type="hidden" id="EDITID"><input type="hidden" id="LISTBOXID"><input type="hidden" id="MODALID"><input type="hidden" id="ONCHANGEFNAME">
        <jsp:include flush="true" page="getbldcode.jsp" />
      </div>
    </div>
  </div>
</div>
<!-- bldcodeModal end-->
</body>
</html>

<%--End JSP Page Content--%>

<%--JSP Page BeforeOutput @1-C994B11C--%>
<%bm30101_man_4Model.fireBeforeOutputEvent();%>
<%--End JSP Page BeforeOutput--%>

<%--JSP Page Unload @1-26E24FE2--%>
<%bm30101_man_4Model.fireBeforeUnloadEvent();%>
<%--End JSP Page Unload--%>

