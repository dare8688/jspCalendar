<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.codecharge.*,com.codecharge.components.*,com.codecharge.util.*,com.codecharge.events.*,com.codecharge.feature.*,com.codecharge.db.*,com.codecharge.validation.*,java.util.*,java.io.*,com.codecharge.util.cache.CacheEvent,com.codecharge.util.cache.ICache,com.codecharge.template.*"%>
<%@page import="java.sql.*, java.util.*, java.io.*, java.lang.*, javax.naming.*, javax.sql.*" %>
<%@page import="com.synct.JPush.*"%>
<%

    String  YY    = request.getParameter("YY") == null ? "": request.getParameter("YY");
    String  NO    = request.getParameter("NO") == null ? "": request.getParameter("NO");
    String  CG    = request.getParameter("CG") == null ? "": request.getParameter("CG");
    String  SQ    = request.getParameter("SQ") == null ? "": request.getParameter("SQ");
    String  OSQ    = request.getParameter("OSQ").equals("none") ? "none": request.getParameter("OSQ");

    String  TB    = request.getParameter("TB") == null ? "": request.getParameter("TB");
    String  TE    = request.getParameter("TE") == null ? "": request.getParameter("TE");
    String  AT    = request.getParameter("AT") == null ? "": request.getParameter("AT");
    String  COLOR = "";
    String Sql = "";
    String SEND_DATA = "";

    if (AT.equals("34"))
    {    
     Sql = "UPDATE BMSREGT_SCHEDULE "+
                 "   SET SCHEDULE_DATES   ='"+TB+"' , SCHEDULE_DATEE ='"+TE+"' , APPLY_FLAG   ='1' , SYNC='N' "+
                " WHERE  REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' AND PERSON_SEQ = '"+SQ+"'  ";
    COLOR = "#30D759";                           
    }

    if (AT.equals("5Y"))
    {
         Sql = "UPDATE BMSREGT_SCHEDULE "+
                     "   SET APPLY_FLAG   ='1' "+
                    " WHERE  REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' AND PERSON_SEQ = '"+SQ+"'  ";
         COLOR = "#1D8348"; 
         SEND_DATA  = Utils.convertToString(DBTools.dLookUp("'您預約的掛號碼碼:' || REG_YY || '-' || REG_NO || '-' || REG_CG ||'案件的'|| CASE WHEN REG_ITEM = '1' THEN '一般對圖' ELSE CASE WHEN REG_ITEM = '2' THEN '缺失補正' ELSE '副本核對' END END || '，審查人員同意申請時段，請依時間前往。(' || TRIM(TO_CHAR(TO_DATE(TO_CHAR(to_number(SCHEDULE_DATES) + 191100000000,'000000000000'),'YYYYMMDDHH24MI'),'YYYY/MM/DD HH24:MI'))|| ' 至 ' || TRIM(TO_CHAR(TO_DATE(TO_CHAR(to_number(SCHEDULE_DATEE) + 191100000000,'000000000000'),'YYYYMMDDHH24MI'),'YYYY/MM/DD HH24:MI')) || ')'", "BMSREGT_SCHEDULE", "REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' AND PERSON_SEQ = '"+SQ+"'"  , "SynctConn"));     
    }
    
    if (AT.equals("5N"))
    {
        Sql = "UPDATE BMSREGT_SCHEDULE "+
                     "   SET APPLY_FLAG   ='4' "+
                    " WHERE  REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' AND PERSON_SEQ = '"+SQ+"'  ";
        COLOR = "#641E16";   

        SEND_DATA  = Utils.convertToString(DBTools.dLookUp("'您預約掛號碼碼:' || REG_YY || '-' || REG_NO || '-' || REG_CG ||'案件的'|| CASE WHEN REG_ITEM = '1' THEN '一般對圖' ELSE CASE WHEN REG_ITEM = '2' THEN '缺失補正' ELSE '副本核對' END END || '，審查人員該時段無法配合，請再與審查人員預約時段。(' || TRIM(TO_CHAR(TO_DATE(TO_CHAR(to_number(SCHEDULE_DATES) + 191100000000,'000000000000'),'YYYYMMDDHH24MI'),'YYYY/MM/DD HH24:MI'))|| ' 至 ' || TRIM(TO_CHAR(TO_DATE(TO_CHAR(to_number(SCHEDULE_DATEE) + 191100000000,'000000000000'),'YYYYMMDDHH24MI'),'YYYY/MM/DD HH24:MI')) || ')'", "BMSREGT_SCHEDULE", "REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' AND PERSON_SEQ = '"+SQ+"'"  , "SynctConn"));                                 
    }

 
    String TOKEN = Utils.convertToString(DBTools.dLookUp("TOKEN", "BMSREGT_SCHEDULE", "REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' AND PERSON_SEQ = '"+SQ+"'"  , "SynctConn")); 
     //System.err.println("******************TOKEN=" + "REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' AND PERSON_SEQ = '"+SQ+"'" );

    int moapp_count  = Utils.convertToLong(DBTools.dLookUp("COUNT(*)", "MOBAPPNEWS", "NEWSDESC ='" + SEND_DATA +"' AND NEWSUSERID = '" + TOKEN + "'" , "SynctConn")).intValue(); 

    System.err.println("******************");
    System.err.println("Sql=" + Sql);
    JDBCConnection Conn = JDBCConnectionFactory.getJDBCConnection("SynctConn");
    Conn.executeUpdate(Sql);

    if (!OSQ.equals("none"))  //公會的掛號件 不要被拖動 
    {    
     Sql = "UPDATE BMSREGT_SCHEDULE "+
           "   SET ORG_SEQ   ="+SQ+
          " WHERE  REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' AND PERSON_SEQ = '"+OSQ+"'  ";
    COLOR = "#30D759";   
     Conn.executeUpdate(Sql);                       
    }





    if (moapp_count <=0){
        Sql = "Insert into MOBAPPNEWS(NEWSTITLE,NEWSDESC,NEWSUSERID,NEWSKIND) VALUES( " +
              "'訊息通知','" +  SEND_DATA + "','" + TOKEN + "','1')";
         //System.err.println("******************Sql=" + Sql);

        Conn.executeUpdate(Sql);

    }

    Conn.closeConnection();
  
     //System.err.println("******************TOKEN=" + TOKEN);

    if (moapp_count <=0){
        //推播
      //  if (!StringUtils.isEmpty(SEND_DATA)){
      //      if(JpushClientUtil.sendToRegistrationId(TOKEN,"建管即時通",SEND_DATA,"","")==1){
      //          //send_status_desc += "第一階段訊息推播成功.";
      //      }else{
      //          //send_status_desc += "第一階段訊息推播失敗.";
      //      }
      //  }    
    }
    out.print(COLOR);
%>

