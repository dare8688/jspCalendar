<% 
request.setCharacterEncoding("Big5");
response.setCharacterEncoding("Big5");
%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*, java.io.*,com.codecharge.*,com.codecharge.util.*,com.codecharge.db.* " %>


<% 
  JDBCConnection Conn = JDBCConnectionFactory.getJDBCConnection("SynctConn");

  //String ikey =  Utils.convertToString(session.getAttribute("INDEX_KEY"));
  String UserID = Utils.convertToString(session.getAttribute("UserID"));// (String)request.getParameter("UserID");  

String sql = "SELECT BMSREGT_SCHEDULE.REG_YY || '-' || BMSREGT_SCHEDULE.REG_NO || '-' || BMSREGT_SCHEDULE.REG_CG ||'<BR>'||"+
				"CASE WHEN SUBSTR(REG_KIND,1,1) IN ('B','F') THEN "+
				"	CASE WHEN TRIM(LICENSE_YY) IS NOT NULL THEN   "+
				"		LICENSE_YY || (SELECT SUB_SEQ1 FROM BLDCODE WHERE CODE_TYPE='BMS' and CODE_SEQ =LICENSE_KIND) || '字第' || LICENSE_NO1 || '號' ELSE P01_NAME END "+
				"   ELSE P01_NAME END AS REG,"+
  			" BMSREGT_SCHEDULE.REG_YY AS REG_YY, BMSREGT_SCHEDULE.REG_NO AS REG_NO, BMSREGT_SCHEDULE.PERSON_SEQ AS seq, "+//'-'||BMSREGT_SCHEDULE.PERSON_SEQ||'-C
        " BMSREGT.INDEX_KEY ikey,TRIM(TO_CHAR(TO_NUMBER(SUBSTR(BMSREGT_SCHEDULE.ORG_DATEE,1,3)) + 1911,'0000') || SUBSTR(BMSREGT_SCHEDULE.ORG_DATEE,4,8))  o_datee, BMSREGT_SCHEDULE.ORG_SEQ AS oseq "+  
				"	FROM BMSREGT_SCHEDULE,BMSREGT "+
				" WHERE ( (BMSREGT_SCHEDULE.REG_YY = BMSREGT.REG_YY(+)) AND (BMSREGT_SCHEDULE.REG_NO = BMSREGT.REG_NO(+)) AND "+
				"	(BMSREGT_SCHEDULE.REG_CG = BMSREGT.REG_CG(+)) ) AND ( BMSREGT_SCHEDULE.CHECK_EMPNO = '"+UserID+"' "+
				" AND ( SCHEDULE_DATES IS NULL ) ) ORDER BY 1 ";


int cnt = 0;
Enumeration rows = Conn.getRows(sql);
String reg ="",reg_items="",rep_items="",ikey="",iks="",sgg="",bkeys="",o_bkey="",sq="",o_datee="",oseq="";
while (rows != null && rows.hasMoreElements()) {
  DbRow row_01 =(DbRow)rows.nextElement();
  reg = Utils.convertToString(row_01.get("REG"));
  sq = Utils.convertToString(row_01.get("seq"));
  oseq = Utils.convertToString(row_01.get("oseq"));
  oseq = StringUtils.isEmpty(oseq) ? "none": oseq;
  o_datee = Utils.convertToString(row_01.get("o_datee"));
  o_datee = (StringUtils.isEmpty(o_datee) || o_datee.equals("") ) ? "none": o_datee;
  reg_items+="<div class=\"external-event bg-green\" data-seq='"+sq+"' data-oseq='"+oseq+"' data-type='C' data-endtime='"+o_datee+"' >"+reg+"</div>";

  cnt+=1;
}

if (UserID.equals("AJ2362")){
  //公會初審 PERSON_TYPE ='1'
  sql = " SELECT BMSREGT.INDEX_KEY ikey "+  
        " FROM BMSREGT_SCHEDULE,BMSREGT "+
        " WHERE ( (BMSREGT_SCHEDULE.REG_YY = BMSREGT.REG_YY(+)) AND (BMSREGT_SCHEDULE.REG_NO = BMSREGT.REG_NO(+)) AND "+
        " (BMSREGT_SCHEDULE.REG_CG = BMSREGT.REG_CG(+)) ) AND ( BMSREGT_SCHEDULE.CHECK_EMPNO = '"+UserID+"' "+
        " AND PERSON_TYPE ='1' ) ORDER BY 1 ";
    //out.println(sql);        
    rows = Conn.getRows(sql);
    while (rows != null && rows.hasMoreElements()) {
      DbRow row_01 =(DbRow)rows.nextElement();
      ikey = Utils.convertToString(row_01.get("ikey"));
      ikey = StringUtils.isEmpty(ikey) ? "none": ikey;
      iks += "'"+ikey+"',";

    }
    //out.println("----------------------------------------------------------------------------------------------------"); 
    iks = iks.substring(0,iks.length()-1);
    //out.println(iks); 
    //RRD_SUGGESTION=30(擬准照 的 案件)
    sql = "SELECT   a.BMS_INDEX_KEY bkey , b.RRD_SUGGESTION sug FROM REGPOSTREG a,REGPOSTREG_DE b "+
          " WHERE a.SEQ = b.SEQ AND a.BMS_INDEX_KEY IN ("+iks+") AND b.RRD_SUGGESTION=30 ";
    rows = Conn.getRows(sql);

    //out.println("----------------------------------------------------------------------------------------------------"); 
    //out.println(sql);        
    while (rows != null && rows.hasMoreElements()) {
      DbRow row_01 =(DbRow)rows.nextElement();
      bkeys += Utils.convertToString(row_01.get("bkey"))+",";
    }
    //out.println("----------------------------------------------------------------------------------------------------"); 
    //out.println("bkeys:"+bkeys); 

      sql = "SELECT BMSREGT_SCHEDULE.REG_YY || '-' || BMSREGT_SCHEDULE.REG_NO || '-' || BMSREGT_SCHEDULE.REG_CG ||'<BR>'||"+
            "CASE WHEN SUBSTR(REG_KIND,1,1) IN ('B','F') THEN "+
            " CASE WHEN TRIM(LICENSE_YY) IS NOT NULL THEN   "+
            "   LICENSE_YY || (SELECT SUB_SEQ1 FROM BLDCODE WHERE CODE_TYPE='BMS' and CODE_SEQ =LICENSE_KIND) || '字第' || LICENSE_NO1 || '號' ELSE P01_NAME END "+
            "   ELSE P01_NAME END AS REG,  "+
            " BMSREGT.INDEX_KEY ikey,BMSREGT_SCHEDULE.PERSON_SEQ AS seq "+  
            " FROM BMSREGT_SCHEDULE,BMSREGT "+
            " WHERE ( (BMSREGT_SCHEDULE.REG_YY = BMSREGT.REG_YY(+)) AND (BMSREGT_SCHEDULE.REG_NO = BMSREGT.REG_NO(+)) AND "+
            " (BMSREGT_SCHEDULE.REG_CG = BMSREGT.REG_CG(+)) ) AND ( BMSREGT_SCHEDULE.CHECK_EMPNO = '"+UserID+"' "+
            " AND PERSON_TYPE ='1' ) ORDER BY 1 ";

    rows = Conn.getRows(sql);
    while (rows != null && rows.hasMoreElements()) {
      DbRow row_01 =(DbRow)rows.nextElement();
      ikey = Utils.convertToString(row_01.get("ikey"));
      if (!(bkeys.contains(ikey))) {
         reg = Utils.convertToString(row_01.get("REG"));
         sq = Utils.convertToString(row_01.get("seq"));
         rep_items+="<div class=\"guild-event bg-green\" data-seq='"+sq+"'  data-type='G' >"+reg+"</div>";
      }
    }

}

//out.println("----------------------------------------------------------------------------------------------------"); 
//out.println(rep_items); 

//out.println(reg_items);
 Conn.closeConnection(); 
%>

<!DOCTYPE HTML>
<html>
<head>
<title>bm30108_man</title>
<link rel="stylesheet" type="text/css" href="Styles/Synct/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
<!-- fullCalendar 2.2.5-->
<link rel="stylesheet" href="./plugins/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet" href="./plugins/fullcalendar/fullcalendar.print.css" media="print">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="./dist/css/skins/_all-skins.min.css">

<script src="ClientI18N.jsp?file=Globalize.js&amp;locale=zh-TW" type="text/javascript" charset="utf-8"></script>

</head>
<body class="theme-default main-menu-animated">
<div id="main-wrapper">
  <jsp:include page="main_menu.jsp" flush="true" />
  <div id="content-wrapper">
    <ul class="breadcrumb breadcrumb-page">
      <li>掛號收件 
      <li class="active">bm30108 使照排審資料維護 </li>
    </ul>
    <section class="content">
    <div class="row ">
      <div class="col-xs-12">
        <div class="col-xs-2">
          <div class="box box-solid">
            <div class="box-header with-border">
              <button onclick="syncgcal()" class="btn btn-sm btn-primary" id="sync_btn">同步Google行事曆</button>
              <div id="sync_message"></div>
            </div>
            <div class="box-body">
              <h4 class="box-title"><font size="2">待排審清單(共<%=cnt  %>筆)</font><input type="hidden" id="BMSREGT_SCHEDULEHiddenUSERID" value="<%=UserID  %>" name="hUserId"></h4>
            	<div id="external-events">
             		<%= reg_items %>
            	</div>
              <h4 class="box-title"><font size="2">公會複審清單</font></h4>
              <div id="guild-events">
                <%= rep_items %>
              </div>
            </div>
          </div>

        </div>
        <div class="col-xs-10">
          <div class="box box-primary">
            <div class="box-body table-responsive no-padding">
              <div id="calendar">
              </div>
              <div>
                <img id="Image1" src="img/bm30108_man.png">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal -->
    <div role="dialog" tabindex="-1" id="myModal" class="modal fade" aria-labelledby="myModalLabel">
      <div role="document" class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button aria-label="Close" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button> 
            <h4 id="myModalLabel" class="modal-title">申請人預約時段確認</h4>
          </div>
          <table class="table table-striped table-bordered">
            <tr>
              <td class="text-warning text-right" width="20%">掛號號碼</td> 
              <td id="myModaldatareg"></td>
            </tr>
 
            <tr>
              <td class="text-warning text-right">起造人</td> 
              <td id="myModaldatap01"></td>
            </tr>
 
            <tr>
              <td class="text-warning text-right">設計人</td> 
              <td id="myModaldatap02"></td>
            </tr>
 
            <tr>
              <td class="text-warning text-right">監造人</td> 
              <td id="myModaldatap03"></td>
            </tr>
 
            <tr>
              <td class="text-warning text-right">承造人</td> 
              <td id="myModaldatap04"></td>
            </tr>
 
            <tr>
              <td class="text-warning text-right">代辦業者</td> 
              <td id="myModaldatapret"></td>
            </tr>
 
            <tr>
              <td class="text-warning text-right">地號</td> 
              <td id="myModaldatalan"></td>
            </tr>
 
            <tr>
              <td class="text-warning text-right">地址</td> 
              <td id="myModaldataaddr"></td>
            </tr>
          </table>
          <div class="modal-footer">
            <button id="btnY" class="btn btn-primary">同意</button><button id="btnN" class="btn btn-danger">不同意</button><button class="btn btn-default" data-dismiss="modal">取消</button> 
          </div>
        </div>
      </div>
      <!-- Modal -->
      <div role="dialog" tabindex="-1" id="myModaldata" class="modal fade" aria-labelledby="myModalLabel">
        <div role="document" class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button aria-label="Close" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button> 
              <h4 id="myModalLabel" class="modal-title">申請案件資料</h4>
            </div>
            <table class="table table-striped table-bordered">
              <tr>
                <td class="text-warning text-right" width="20%">掛號號碼</td> 
                <td id="myModaldatareg"></td>
              </tr>
 
              <tr>
                <td class="text-warning text-right">起造人</td> 
                <td id="myModaldatap01"></td>
              </tr>
 
              <tr>
                <td class="text-warning text-right">設計人</td> 
                <td id="myModaldatap02"></td>
              </tr>
 
              <tr>
                <td class="text-warning text-right">監造人</td> 
                <td id="myModaldatap03"></td>
              </tr>
 
              <tr>
                <td class="text-warning text-right">承造人</td> 
                <td id="myModaldatap04"></td>
              </tr>
 
              <tr>
                <td class="text-warning text-right">代辦業者</td> 
                <td id="myModaldatapret"></td>
              </tr>
 
              <tr>
                <td class="text-warning text-right">地號</td> 
                <td id="myModaldatalan"></td>
              </tr>
 
              <tr>
                <td class="text-warning text-right">地址</td> 
                <td id="myModaldataaddr"></td>
              </tr>
            </table>
            <div class="modal-footer">
              <button class="btn btn-default" data-dismiss="modal">關閉</button> 
            </div>
          </div>
        </div>

    </section>
  </div>
  </div>
  <div id="main-menu-bg">
  </div>
    <!-- Get jQuery from Google CDN -->
    <!--[if !IE]> -->
    <script type="text/javascript"> window.jQuery || document.write('<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js">'+"<"+"/script>"); </script>
    <!-- <![endif]-->
    <!--[if lte IE 9]>
<SCRIPT type=text/javascript> window.jQuery || document.write('<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">'+"<"+"/script>"); </SCRIPT>
<![endif]-->
    <!-- Pixel Admin's javascripts -->
    <script src="assets/javascripts/bootstrap.min.js"></script>
    <script src="assets/javascripts/synctMenu.min.js"></script>
    <script type="text/javascript">
        init.push(function () {
                // Javascript code here
        })
        window.PixelAdmin.start(init);
</script>
    <!-- jQuery 2.2.3 -->
    <script src="./plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="./bootstrap/js/bootstrap.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- Slimscroll -->
    <script src="./plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="./plugins/fastclick/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="./dist/js/app.min.js"></script>
    <!-- fullCalendar 2.2.5 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
    <script src="./plugins/fullcalendar/fullcalendar.js"></script>
    <!-- Page specific script -->
    <script>
        function syncgcal() {
        window.open(
                  'bm30108_sync.html?UserID='+ document.getElementById('BMSREGT_SCHEDULEHiddenUSERID').value,
                  '_blank' // <- This is what makes it open in a new window.
                );
        }




  $(function () {
    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {
        var eventObject = {
          title: $.trim($(this).text()),
          sq: $.trim($(this).data("seq")),   //視別公會/非公會
          type:$.trim($(this).data("type")),
          endtime:$.trim($(this).data("endtime")),
          osq:$.trim($(this).data("oseq")),
        };

        $(this).data('eventObject', eventObject);

        $(this).draggable({
          zIndex: 1070,
          revert: true, 
          revertDuration: 0  
        });

      });
    }

    ini_events($('#external-events div.external-event'));

    ini_events($('#guild-events div.guild-event'));


    /* initialize the calendar
     -----------------------------------------------------------------*/
    var hnUserId = document.getElementById('BMSREGT_SCHEDULEHiddenUSERID').value;
    $('#calendar').fullCalendar({
              lang: 'zh-tw',
                                buttonText: { 
                                today: '今天', 
                                }, 
                                header: { 
                                left: 'title', 
                                right: 'prev,next today', 
                                }, 
                                timeFormat: 'h:mm', 
                                columnFormat: { 
                                week: 'M/D dddd', 
                                }, 
                                monthNames: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"], 
                                dayNames: ["日", "一", "二", "三", "四", "五", "六"], 
                                titleFormat: { 
                                week: "YYYY年M月D日", 
                                }, 
                                theme: true,                     
                    businessHours: {
                    dow: [ 0, 1, 2, 3, 4, 5,6 ], // Monday - Thursday
                    start: '08:00', // a start time (10am in this example)
                    end: '18:00', // an end time (6pm in this example)
                    },  
                    defaultView: 'agendaWeek',
                    minTime : "08:00:00",
                    maxTime : "18:00:00",
                    height:  "auto",
                    firstDay: 1,
                    allDaySlot: false, 

        eventDestroy: function(event, element, view){
            //alert("removing stuff");
        },
        eventClick: function(calEvent, jsEvent, view){
                var temp = calEvent.id.split('_');
                var type = calEvent.type;
                var tl = temp[0].split('-');
                //alert(tl[0]+tl[1]+tl[2]);
                if (type=='6' || type=='7' || type=='8')
                {
                // calEvent.color = "#1D8348";
                   $("#myModaldatareg").text(calEvent.reg);
                   $("#myModaldatap01").text(calEvent.p01name);
                   $("#myModaldatap02").text(calEvent.p02name);
                   $("#myModaldatap03").text(calEvent.p03name);
                   $("#myModaldatap04").text(calEvent.p04name);
                   $("#myModaldatapret").text(calEvent.retname);
                   $("#myModaldatalan").text(calEvent.lan);
                   $("#myModaldataaddr").text(calEvent.addr);

                   $('#myModal').modal('show');
                   
                   $("#btnY").click(function(){
                     $.ajax({
                                        url: "bm30108_update.jsp?AT=5Y&YY="+tl[0]+"&NO="+tl[1]+"&CG="+tl[2]+"&SQ="+tl[3],
                                        type: "POST",
                                        success:function(data){
                                calEvent.color=data.trim();
                                                $('#calendar').fullCalendar('updateEvent', calEvent);
                            }
                     });
                                    $('#myModal').modal('hide');
                                }); 
                                
                   $("#btnN").click(function(){
                     $.ajax({
                                        url: "bm30108_update.jsp?AT=5N&YY="+tl[0]+"&NO="+tl[1]+"&CG="+tl[2]+"&SQ="+tl[3],
                                        type: "POST",
                                        success:function(data){
                                calEvent.color=data.trim();
                                $('#calendar').fullCalendar('updateEvent', calEvent);
                            }
                     });
                                    $('#myModal').modal('hide');
                                }); 
                }else{
                   $("#myModaldatareg").text(calEvent.reg);
                   $("#myModaldatap01").text(calEvent.p01name);
                   $("#myModaldatap02").text(calEvent.p02name);
                   $("#myModaldatap03").text(calEvent.p03name);
                   $("#myModaldatap04").text(calEvent.p04name);
                   $("#myModaldatapret").text(calEvent.retname);
                   $("#myModaldatalan").text(calEvent.lan);
                   $("#myModaldataaddr").text(calEvent.addr);

                   $('#myModaldata').modal('show');
                   
                }
        },
        eventDrop: function( event, delta, revertFunc, jsEvent, ui, view ) { 
                var temp = event.id.split('_');
                var type = event.type;
                var tl = temp[0].split('-');
                //alert(tl[0]+tl[1]+tl[2]);
                if (  type == undefined || type == '3')
                {
                 var lb=moment(event.start).format('YYYYMMDDHHmm');
                  lb-=191100000000;
                  var le=moment(event.end).format('YYYYMMDDHHmm')
                  le-=191100000000;
                  var tl = event.id.split('-');
            $.ajax({
                                url: "bm30108_update.jsp?AT=34&YY="+tl[0]+"&NO="+tl[1]+"&CG="+tl[2]+"&SQ="+tl[3]+"&TB="+lb+"&TE="+le,
                                type: "POST",
                                success:function(data){
                        //alert(data);
                    }
            });
                                        
                }
            else
                {
                        revertFunc();
            }
        },
                eventResize: function(event, delta, revertFunc) {
                var temp = event.id.split('_');
                var type = event.type;
                var tl = temp[0].split('-');
                //alert(tl[0]+tl[1]+tl[2]);
                if (type == undefined || type == '3')
                {
                 var lb=moment(event.start).format('YYYYMMDDHHmm');
                  lb-=191100000000;
                  var le=moment(event.end).format('YYYYMMDDHHmm')
                  le-=191100000000;
                  var tl = event.id.split('-');
            $.ajax({
                                url: "bm30108_update.jsp?AT=34&YY="+tl[0]+"&NO="+tl[1]+"&CG="+tl[2]+"&SQ="+tl[3]+"&TB="+lb+"&TE="+le,
                                type: "POST",
                                success:function(data){
                        //alert(data);
                    }
            });
                                        
                }
            else
                {
                        revertFunc();
            }
  
            },        
        events: {
            url: 'bm30108_getcalendar.jsp?UserID=' + hnUserId,
            error: function() {
                $('#script-warning').show();
            }
        },
        editable: true,
        droppable: true,
                //eventAllow: false,        
        
        drop: function (date, allDay) { 
            var originalEventObject = $(this).data('eventObject');

            var copiedEventObject = $.extend({}, originalEventObject);

            copiedEventObject.start = date;
            copiedEventObject.end = moment(date).add(2, 'h');
            
            copiedEventObject.backgroundColor = $(this).css("background-color");
            copiedEventObject.borderColor = $(this).css("border-color");
            var tl = copiedEventObject.title.split(/\D/);
            copiedEventObject.id = tl[0]+'-'+tl[1]+'-'+tl[2]+'-'+tl[3];   
            var sq = copiedEventObject.sq;
            var osq = copiedEventObject.osq;
            var typ = copiedEventObject.type;
            var endtime = copiedEventObject.endtime;   
            var temptime = moment(endtime,'YYYYMMDDHHmm');
            var etime = temptime;
            var eetime = temptime.clone().add(1.5, 'days');

            if (!(endtime=='none' || endtime=='' )){
              if (!date.isBetween(etime, eetime)){
                alert("公會初/複審於"+endtime.substring(0, 8)+' '+endtime.substring(8, 12)+"  產生的承辦人案件須於1.5日內完成!");
                return;      
              }
            }

            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
                        //alert(copiedEventObject.id);           
                        //alert(copiedEventObject.title);       
                        //alert(tl[3]+tl[4]+tl[5]);
                        //moment('gibberish').format('YYYY MM DD');
              var lb=moment(copiedEventObject.start).format('YYYYMMDDHHmm');
                         
                  //alert("drop: function (date, allDay)"+ lb-191100000000);
              lb-=191100000000;
              var le=moment(copiedEventObject.end).format('YYYYMMDDHHmm')
                          
                  //alert(le-191100000000);
              le-=191100000000;
            if (hnUserId=='AJ2362' && typ=='C' ) { //新增承辦人
              $.ajax({
                url: "bm30108_insert.jsp?AT=12&YY="+tl[0]+"&NO="+tl[1]+"&CG="+tl[2]+"&SQ="+sq+"&TB="+lb+"&TE="+le, //tl[3]
                type: "POST",
                success:function(data){
                          //alert(data);
                }
              });
            } 
            if (typ=='G') {   // 新增公會複審掛號案件/重覆新增要減 
              $.ajax({
                url: "bm30108_insert_g.jsp?AT=12&YY="+tl[0]+"&NO="+tl[1]+"&CG="+tl[2]+"&SQ="+sq+"&TB="+lb+"&TE="+le,
                type: "POST",
                success:function(data){
                          //alert(data);
                }
              });
            } else {
              $.ajax({
                url: "bm30108_update.jsp?AT=34&YY="+tl[0]+"&NO="+tl[1]+"&CG="+tl[2]+"&SQ="+sq+"&TB="+lb+"&TE="+le+"&OSQ="+osq,
                type: "POST",
                success:function(data){
                          //alert(data);
                }
              });
            }

                                                  
            
            
        },
                eventReceive : function (event ) {

                
                }, 
        
    });

    $('.vebookmarklet').click(function() {
        if (typeof VisualEvent != 'undefined') {
            if (document.getElementById('Event_display')) {
                VisualEvent.fnClose();
            } else {
                VisualEvent.fnInit();
            }
        } else {
            var n = document.createElement('script');
            n.setAttribute('language', 'JavaScript');
            n.setAttribute('src', 'http://www.sprymedia.co.uk/design/event/media/js/event-loader.js');
            document.body.appendChild(n);
        }
    });

    $('.layers').click(function() {
        $('.vebookmarklet').trigger('click');
        var veColors = ['black', 'orange', 'purple', 'green', 'blue', 'yellow', 'red'],
            veColorLength = veColors.length - 1,
            veLayerIndex = 0;

        function showVeLayer(nxt) {
            veLayerIndex += (nxt) ? 1 : -1;
            if (veLayerIndex > veColorLength) {
                veLayerIndex = 0;
            }
            if (veLayerIndex < 0) {
                veLayerIndex = veColorLength;
            }

            var veLayer = $('.Event_bg_' + veColors[veLayerIndex]);
            if (veLayer.length === 0) {
                showVeLayer(nxt);
                return;
            }

            $('.Event_bg_' + veColors.join(', .Event_bg_')).hide();
            veLayer.show();
        }

        $(document).keyup(function(e) {
            switch (e.which) {
            case 39:
            case 40:
                // right/down
                showVeLayer(true);
                break;
            case 37:
            case 38:
                // left/up
                showVeLayer();
                break;
            }
        });

    });

  });
</script>
    </h5>
  </div>
</div>
</body>
</html>    