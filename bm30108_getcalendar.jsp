<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.codecharge.*,com.codecharge.components.*,com.codecharge.util.*,com.codecharge.events.*,com.codecharge.feature.*,com.codecharge.db.*,com.codecharge.validation.*,java.util.*,java.io.*,com.codecharge.util.cache.CacheEvent,com.codecharge.util.cache.ICache,com.codecharge.template.*"%>
<%@page import="java.sql.*, java.util.*, java.io.*, java.lang.*, javax.naming.*, javax.sql.*" %>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%

    String  UserID    = request.getParameter("UserID") == null ? "": request.getParameter("UserID");
    String Sql = "SELECT a.REG_YY,a.REG_NO,a.REG_CG,PERSON_SEQ,PERSON_TYPE,TRIM(TO_CHAR(TO_NUMBER(SUBSTR(SCHEDULE_DATES,1,3)) + 1911,'0000') || SUBSTR(SCHEDULE_DATES,4,8)) SCHEDULE_DATES,TRIM(TO_CHAR(TO_NUMBER(SUBSTR(SCHEDULE_DATEE,1,3)) + 1911,'0000') || SUBSTR(SCHEDULE_DATEE,4,8)) SCHEDULE_DATEE,CHECK_EMPNO,APPLY_NAME,APPLY_TEL,APPLY_FLAG,P01_NAME,P01_NAME || CASE WHEN TRIM(P01_TEL) IS NOT NULL THEN '  電話：' || P01_TEL END P01_NAMETEL,P02_NAME || CASE WHEN TRIM(P02_TEL) IS NOT NULL THEN '  電話：' || P02_TEL END P02_NAMETEL,P03_NAME || CASE WHEN TRIM(P03_TEL) IS NOT NULL THEN '  電話：' || P03_TEL END P03_NAMETEL,P04_NAME || CASE WHEN TRIM(P04_TEL) IS NOT NULL THEN '  電話：' || P03_TEL END P04_NAMETEL,REL_NAME || CASE WHEN TRIM(REL_TEL) IS NOT NULL THEN '  電話：' || REL_TEL END REL_NAMETEL,COMB_ADDR1(ADDRADR_DESC,ADDRAD1,ADDRAD2,ADDRAD3,ADDRAD4,ADDRAD5,ADDRAD6,ADDRAD6_1,ADDRAD7,ADDRAD7_1,ADDRAD8) ADDR ,GETLANNO(DIST,SECTION,ROAD_NO1,ROAD_NO2) LANNO,b.REG_KIND,b.LICENSE_YY,b.LICENSE_KIND,b.LICENSE_NO1 FROM BMSREGT_SCHEDULE a,BMSREGT b WHERE a.REG_YY = b.REG_YY AND a.REG_NO = b.REG_NO AND a.REG_CG = b.REG_CG "; 
    Sql  +=  " AND TRIM(SCHEDULE_DATES) IS NOT NULL     AND CHECK_EMPNO = '" + UserID  + "' ORDER BY 1,2,3,4";

    System.err.println("******************");
    System.err.println("Sql=" + Sql);
    JDBCConnection Conn = JDBCConnectionFactory.getJDBCConnection("SynctConn");
    Enumeration SelectRecords = Conn.getRows(Sql);
    Conn.closeConnection(); 

    JSONArray list = new JSONArray();

    while (SelectRecords != null && SelectRecords.hasMoreElements()) {
        DbRow CurrentRecord = (DbRow) SelectRecords.nextElement();
        String REG_YY         = Utils.convertToString(CurrentRecord.get("REG_YY"));
        String REG_NO         = Utils.convertToString(CurrentRecord.get("REG_NO"));
        String REG_CG         = Utils.convertToString(CurrentRecord.get("REG_CG"));

        String PERSON_SEQ     = Utils.convertToString(CurrentRecord.get("PERSON_SEQ"));
        String REGID  = REG_YY + "-" + REG_NO + "-" + REG_CG + "-" +PERSON_SEQ;
        String REG    = REG_YY + "-" + REG_NO + "-" + REG_CG ;

        String LICENSE_YY    = Utils.convertToString(CurrentRecord.get("LICENSE_YY"));
        String LICENSE_KIND    = Utils.convertToString(CurrentRecord.get("LICENSE_KIND"));
        String LICENSE_NO1    = Utils.convertToString(CurrentRecord.get("LICENSE_NO1"));
        
        String LICENSE_KIND_DESC = Utils.convertToString(DBTools.dLookUp("SUB_SEQ1", "BMSREGT_SCHEDULE", "CODE_TYPE='BMS' and CODE_SEQ ='" + LICENSE_KIND + "'", "SynctConn"));

        String PERSON_TYPE    = Utils.convertToString(CurrentRecord.get("PERSON_TYPE"));
        String SCHEDULE_DATES = Utils.convertToString(CurrentRecord.get("SCHEDULE_DATES"));
        String SCHEDULE_DATEE = Utils.convertToString(CurrentRecord.get("SCHEDULE_DATEE"));
        String APPLY_NAME     = Utils.convertToString(CurrentRecord.get("APPLY_NAME"));
        String APPLY_TEL      = Utils.convertToString(CurrentRecord.get("APPLY_TEL"));
        String APPLY_FLAG     = Utils.convertToString(CurrentRecord.get("APPLY_FLAG"));
        String P01_NAME       = Utils.convertToString(CurrentRecord.get("P01_NAME"));
        String P01_NAMETEL    = Utils.convertToString(CurrentRecord.get("P01_NAMETEL"));
        String P02_NAMETEL    = Utils.convertToString(CurrentRecord.get("P02_NAMETEL"));
        String P03_NAMETEL    = Utils.convertToString(CurrentRecord.get("P03_NAMETEL"));
        String P04_NAMETEL    = Utils.convertToString(CurrentRecord.get("P04_NAMETEL"));
        String REL_NAMETEL    = Utils.convertToString(CurrentRecord.get("REL_NAMETEL"));
        String ADDR           = Utils.convertToString(CurrentRecord.get("ADDR"));
        String LANNO          = Utils.convertToString(CurrentRecord.get("LANNO"));
        String REG_KIND       = Utils.convertToString(CurrentRecord.get("REG_KIND"));
        JSONObject obj=new JSONObject();


        String SCHEDULE_DATES_F = SCHEDULE_DATES.substring(0,4) + "-" + SCHEDULE_DATES.substring(4,6) + "-" + SCHEDULE_DATES.substring(6,8) + "T" + SCHEDULE_DATES.substring(8,10) + ":" + SCHEDULE_DATES.substring(10,12) + ":00";

        String SCHEDULE_DATEE_F = SCHEDULE_DATEE.substring(0,4) + "-" + SCHEDULE_DATEE.substring(4,6) + "-" + SCHEDULE_DATEE.substring(6,8) + "T" + SCHEDULE_DATEE.substring(8,10) + ":" + SCHEDULE_DATEE.substring(10,12) + ":00";
        


        
        obj.put("start", StringUtils.isEmpty(SCHEDULE_DATES_F) ? "null": SCHEDULE_DATES_F );
        obj.put("end", StringUtils.isEmpty(SCHEDULE_DATEE_F) ? "null": SCHEDULE_DATEE_F );

        String title = "";


        if (REG_KIND.substring(0,1).equals("B") || REG_KIND.substring(0,1).equals("F")){
            if (!StringUtils.isEmpty(LICENSE_YY))
                title = LICENSE_YY + LICENSE_KIND_DESC + "字第" + LICENSE_NO1 + "號";
            else
                title = P01_NAME;
        }
        else 
            title = P01_NAME;

        obj.put("id",REGID);
        obj.put("title",title);
        obj.put("reg",REG );
        obj.put("p01name",P01_NAMETEL);
        obj.put("p02name",P02_NAMETEL);
        obj.put("p03name",P03_NAMETEL);
        obj.put("p04name",P04_NAMETEL);
        obj.put("relname",REL_NAMETEL);
        obj.put("lan",LANNO );
        obj.put("addr",ADDR );
        if (PERSON_TYPE.equals("1")){   //公會初審
            obj.put("type", "1" );
            obj.put("color","#808080" );
            obj.put("textColor","#000000" );

        }else if (PERSON_TYPE.equals("2")){ //公會複審
            obj.put("type", "2" );
            obj.put("color","#808080" );
            obj.put("textColor","#000000" );
        }else if (PERSON_TYPE.equals("3") || PERSON_TYPE.equals("4") ){
            if (APPLY_FLAG.equals("1")){ //承辦人初審、複審確認
                obj.put("type", "3" );
                obj.put("color","#117864" );
                obj.put("textColor","#000000" );
            }
            else if (APPLY_FLAG.equals("2")){ //承辦人初審、複審登錄
                obj.put("type", "4" );
                obj.put("color","#FFCE3C" );
                obj.put("textColor","#000000" );
            }
            else  if (APPLY_FLAG.equals("3")){ //承辦人初審、複審已逾期未登錄
                obj.put("type", "5" );
                obj.put("color","#C40000" );
                obj.put("textColor","#000000" );
            }
        }else if (PERSON_TYPE.equals("5")){
            if (APPLY_FLAG.equals("0")){ //申請人預約
                obj.put("type", "6" );
                obj.put("color","#bf00ff" );
                obj.put("textColor","#000000" );
            }
            else if (APPLY_FLAG.equals("1")){ //申請人預約同意
                obj.put("type", "7" );
                obj.put("color","#0000C4" );
                obj.put("textColor","#000000" );
            }
            else if (APPLY_FLAG.equals("2")){ //申請人預約案件已登錄
                obj.put("type", "4" );
                obj.put("color","#FFCE3C" );
                obj.put("textColor","#000000" );
            }
            else  if (APPLY_FLAG.equals("3")){ //申請人預約案件已逾期未登錄
                obj.put("type", "5" );
                obj.put("color","#C40000" );
                obj.put("textColor","#000000" );
            }            
            else  if (APPLY_FLAG.equals("4")){ //申請人預約不同意
                obj.put("type", "7" );
                obj.put("color","#641E16" );
                obj.put("textColor","#000000" );
            }

        }
        list.add(obj);
    }

    String JSONString = JSONValue.toJSONString(list); 
    out.print(JSONString);
%>

