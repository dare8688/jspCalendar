<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.codecharge.*,com.codecharge.components.*,com.codecharge.util.*,com.codecharge.events.*,com.codecharge.feature.*,com.codecharge.db.*,com.codecharge.validation.*,java.util.*,java.io.*,com.codecharge.util.cache.CacheEvent,com.codecharge.util.cache.ICache,com.codecharge.template.*"%>
<%@page import="java.sql.*, java.util.*, java.io.*, java.lang.*, javax.naming.*, javax.sql.*" %>
<%@page import="com.synct.JPush.*"%>
<%

    String  YY    = request.getParameter("YY") == null ? "": request.getParameter("YY");
    String  NO    = request.getParameter("NO") == null ? "": request.getParameter("NO");
    String  CG    = request.getParameter("CG") == null ? "": request.getParameter("CG");
    String  SQ    = request.getParameter("SQ") == null ? "": request.getParameter("SQ");
    String  TB    = request.getParameter("TB") == null ? "": request.getParameter("TB");
    String  TE    = request.getParameter("TE") == null ? "": request.getParameter("TE");
    String  AT    = request.getParameter("AT") == null ? "": request.getParameter("AT");
    String  COLOR = "";
    String Sql = "";

    JDBCConnection Conn = JDBCConnectionFactory.getJDBCConnection("SynctConn");

    String max_q = Utils.convertToString(DBTools.dLookUp("MAX(PERSON_SEQ)+1", "BMSREGT_SCHEDULE", "REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' "  , "SynctConn")); 

    //公會排審後，產生一筆承辦人員排審。
    if (AT.equals("12"))
    {    
        Sql =   " INSERT INTO BMSREGT_SCHEDULE ( "+
            "  REG_YY,    REG_NO,    REG_CG,    PERSON_SEQ,    PERSON_TYPE, "+
            " SCHEDULE_DATEE,    CHECK_EMPNO,    APPLY_NAME,    APPLY_TEL,    APPLY_FLAG, "+
            " CR_DATE,    UP_DATE,    OP_USER,    SCHEDULE_DATES,    DATAID, "+
            " ID,    REG_ITEM,    MOB_UUID,    TOKEN,    SYNC,ORG_SEQ,ORG_DATEE  ) "+
            " SELECT "+
            "  REG_YY,    REG_NO,    REG_CG,   "+ max_q+",    '2', "+   //序號，類別
            "  '"+TE+"',    CHECK_EMPNO,    APPLY_NAME,    APPLY_TEL,    APPLY_FLAG, "+
            " to_char(sysdate,'yyyymmdd')-19110000,    UP_DATE,    CHECK_EMPNO,  '"+TB+"'  ,    null, "+
            " null,    null,    null,    null,    'N' , null,'"+TE+"' "+   //新增公會"複"審掛號件時 ，
            " FROM BMSREGT_SCHEDULE WHERE REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' AND PERSON_SEQ = '"+SQ+"'  ";
            out.println("insert-------------:"+Sql);

        Conn.executeUpdate(Sql);

    String DIST = Utils.convertToString(DBTools.dLookUp("DIST", "BMSREGT_LAN", "REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' AND SPOKESMAN='Y'"  , "SynctConn")); 
    String n_max_q = Utils.convertToString(DBTools.dLookUp("MAX(PERSON_SEQ)+1", "BMSREGT_SCHEDULE", "REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' "  , "SynctConn")); 
    String EMPNO = Utils.convertToString(DBTools.dLookUp("EMPNO", "usework", "job_"+DIST+"='Y' and JOB_KIND='A01' AND JOB_FLAG='06' "  , "SynctConn"));
        Sql =   " INSERT INTO BMSREGT_SCHEDULE ( "+
            "  REG_YY,    REG_NO,    REG_CG,    PERSON_SEQ,    PERSON_TYPE, "+
            " SCHEDULE_DATEE,    CHECK_EMPNO,    APPLY_NAME,    APPLY_TEL,    APPLY_FLAG, "+
            " CR_DATE,    UP_DATE,    OP_USER,    SCHEDULE_DATES,    DATAID, "+
            " ID,    REG_ITEM,    MOB_UUID,    TOKEN,    SYNC,ORG_SEQ,ORG_DATEE  ) "+
            " SELECT "+
            "  REG_YY,    REG_NO,    REG_CG,   "+ n_max_q+",    '3', "+
            " null,    '"+EMPNO+"',    APPLY_NAME,    APPLY_TEL,    APPLY_FLAG, "+
            " to_char(sysdate,'yyyymmdd')-19110000,    UP_DATE,    '"+EMPNO+"',    null,    null, "+
            " null,    null,    null,    null,    'N' , PERSON_SEQ,'"+TE+"' "+
            " FROM BMSREGT_SCHEDULE WHERE REG_YY ='"+YY+"' AND REG_NO = '"+NO+"' AND REG_CG = '"+CG+"' AND PERSON_SEQ = '"+max_q+"'  ";
            out.println("insert-------------:"+Sql);
        Conn.executeUpdate(Sql);
        
    }

 Conn.closeConnection(); 
    out.print(COLOR);
%>
