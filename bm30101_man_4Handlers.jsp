<%@page pageEncoding="UTF-8"%><%--== Handlers ==--%> <%--bm30101_man_4 Opening Initialization directive @1-A0E75F14--%><%!

// //Workaround for JRun 3.1 @1-F81417CB

//Feature checker Head @1-B1791FE4
    public class bm30101_man_4ServiceChecker implements com.codecharge.feature.IServiceChecker {
//End Feature checker Head

//feature binding @1-6DADF1A6
        public boolean check ( HttpServletRequest request, HttpServletResponse response, ServletContext context) {
            String attr = "" + request.getParameter("callbackControl");
            return false;
        }
//End feature binding

//Feature checker Tail @1-FCB6E20C
    }
//End Feature checker Tail

//NewRecord1 Record Handler Head @2-640BD97F
    public class bm30101_man_4NewRecord1RecordHandler implements RecordListener, RecordDataObjectListener {
//End NewRecord1 Record Handler Head

//NewRecord1 afterInitialize Method Head @2-89E84600
        public void afterInitialize(Event e) {
//End NewRecord1 afterInitialize Method Head

//NewRecord1 afterInitialize Method Tail @2-FCB6E20C
        }
//End NewRecord1 afterInitialize Method Tail

//NewRecord1 OnSetDataSource Method Head @2-9B7FBFCF
        public void onSetDataSource(DataObjectEvent e) {
//End NewRecord1 OnSetDataSource Method Head

//NewRecord1 OnSetDataSource Method Tail @2-FCB6E20C
        }
//End NewRecord1 OnSetDataSource Method Tail

//NewRecord1 BeforeShow Method Head @2-46046458
        public void beforeShow(Event e) {
//End NewRecord1 BeforeShow Method Head

//Event BeforeShow Action Custom Code @15-44795B7A


	String userMessage = Utils.convertToString(SessionStorage.getInstance(e.getPage().getRequest()).getAttribute("UserMessage"));
	//第一碼為 1 顯示在表頭、 2顯示在表身
	if (!StringUtils.isEmpty(userMessage) && userMessage.substring(0,1).equals("1")) {
		// reset message
		SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("UserMessage", "");
		// print message
		e.getRecord().addError(userMessage.substring(1,userMessage.length()));
	}
	// --------------------  END UserMessage  --------------------

	String SearchParam_16 = Utils.convertToString(SessionStorage.getInstance(e.getPage().getRequest()).getAttribute("SearchParam_16"));
	String SearchParam_17 = Utils.convertToString(SessionStorage.getInstance(e.getPage().getRequest()).getAttribute("SearchParam_17"));
	String SearchParam_18 = Utils.convertToString(SessionStorage.getInstance(e.getPage().getRequest()).getAttribute("SearchParam_18"));
	String SearchParam_19 = Utils.convertToString(SessionStorage.getInstance(e.getPage().getRequest()).getAttribute("SearchParam_19"));
	String SearchParam_20 = Utils.convertToString(SessionStorage.getInstance(e.getPage().getRequest()).getAttribute("SearchParam_20"));
	String SearchParam_21 = Utils.convertToString(SessionStorage.getInstance(e.getPage().getRequest()).getAttribute("SearchParam_21"));

	e.getRecord().getControl("BOOKSHEET").setValue(SearchParam_16);
	e.getRecord().getControl("N_REG_YY").setValue(SearchParam_17);
	e.getRecord().getControl("N_REG_NO").setValue(SearchParam_18);
	e.getRecord().getControl("N_REG_CG").setValue(SearchParam_19);
	e.getRecord().getControl("REG_KIND").setValue(SearchParam_20);
	e.getRecord().getControl("REG_KIND_E").setValue(SearchParam_20);
	e.getRecord().getControl("ACTN_EMPL").setValue(SearchParam_21);
	e.getRecord().getControl("ACTN_EMPL_E").setValue(SearchParam_21);

//End Event BeforeShow Action Custom Code

//NewRecord1 BeforeShow Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeShow Method Tail

//NewRecord1 OnValidate Method Head @2-5F430F8E
        public void onValidate(Event e) {
//End NewRecord1 OnValidate Method Head

//NewRecord1 OnValidate Method Tail @2-FCB6E20C
        }
//End NewRecord1 OnValidate Method Tail

//NewRecord1 BeforeSelect Method Head @2-E5EC9AD3
        public void beforeSelect(Event e) {
//End NewRecord1 BeforeSelect Method Head

//NewRecord1 BeforeSelect Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeSelect Method Tail

//NewRecord1 BeforeBuildSelect Method Head @2-3041BA14
        public void beforeBuildSelect(DataObjectEvent e) {
//End NewRecord1 BeforeBuildSelect Method Head

//NewRecord1 BeforeBuildSelect Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeBuildSelect Method Tail

//NewRecord1 BeforeExecuteSelect Method Head @2-8391D9D6
        public void beforeExecuteSelect(DataObjectEvent e) {
//End NewRecord1 BeforeExecuteSelect Method Head

//NewRecord1 BeforeExecuteSelect Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeExecuteSelect Method Tail

//NewRecord1 AfterExecuteSelect Method Head @2-0972E7FA
        public void afterExecuteSelect(DataObjectEvent e) {
//End NewRecord1 AfterExecuteSelect Method Head

//NewRecord1 AfterExecuteSelect Method Tail @2-FCB6E20C
        }
//End NewRecord1 AfterExecuteSelect Method Tail

//NewRecord1 BeforeInsert Method Head @2-75B62B83
        public void beforeInsert(Event e) {
//End NewRecord1 BeforeInsert Method Head

//NewRecord1 BeforeInsert Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeInsert Method Tail

//NewRecord1 BeforeBuildInsert Method Head @2-FD6471B0
        public void beforeBuildInsert(DataObjectEvent e) {
//End NewRecord1 BeforeBuildInsert Method Head

//NewRecord1 BeforeBuildInsert Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeBuildInsert Method Tail

//NewRecord1 BeforeExecuteInsert Method Head @2-4EB41272
        public void beforeExecuteInsert(DataObjectEvent e) {
//End NewRecord1 BeforeExecuteInsert Method Head

//NewRecord1 BeforeExecuteInsert Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeExecuteInsert Method Tail

//NewRecord1 AfterExecuteInsert Method Head @2-C4572C5E
        public void afterExecuteInsert(DataObjectEvent e) {
//End NewRecord1 AfterExecuteInsert Method Head

//NewRecord1 AfterExecuteInsert Method Tail @2-FCB6E20C
        }
//End NewRecord1 AfterExecuteInsert Method Tail

//NewRecord1 AfterInsert Method Head @2-767A9165
        public void afterInsert(Event e) {
//End NewRecord1 AfterInsert Method Head

//Event AfterInsert Action Custom Code @17-44795B7A

//新增後顯示訊息
	 SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("UserMessage","1資料新增成功.");

//End Event AfterInsert Action Custom Code

//NewRecord1 AfterInsert Method Tail @2-FCB6E20C
        }
//End NewRecord1 AfterInsert Method Tail

//NewRecord1 BeforeUpdate Method Head @2-33A3CFAC
        public void beforeUpdate(Event e) {
//End NewRecord1 BeforeUpdate Method Head

//NewRecord1 BeforeUpdate Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeUpdate Method Tail

//NewRecord1 BeforeBuildUpdate Method Head @2-37688606
        public void beforeBuildUpdate(DataObjectEvent e) {
//End NewRecord1 BeforeBuildUpdate Method Head

//NewRecord1 BeforeBuildUpdate Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeBuildUpdate Method Tail

//NewRecord1 BeforeExecuteUpdate Method Head @2-84B8E5C4
        public void beforeExecuteUpdate(DataObjectEvent e) {
//End NewRecord1 BeforeExecuteUpdate Method Head

//NewRecord1 BeforeExecuteUpdate Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeExecuteUpdate Method Tail

//NewRecord1 AfterExecuteUpdate Method Head @2-0E5BDBE8
        public void afterExecuteUpdate(DataObjectEvent e) {
//End NewRecord1 AfterExecuteUpdate Method Head

//NewRecord1 AfterExecuteUpdate Method Tail @2-FCB6E20C
        }
//End NewRecord1 AfterExecuteUpdate Method Tail

//NewRecord1 AfterUpdate Method Head @2-306F754A
        public void afterUpdate(Event e) {
//End NewRecord1 AfterUpdate Method Head

//Event AfterUpdate Action Custom Code @18-44795B7A

 //修改後顯示訊息
     SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("UserMessage","1資料修改成功.");

//End Event AfterUpdate Action Custom Code

//NewRecord1 AfterUpdate Method Tail @2-FCB6E20C
        }
//End NewRecord1 AfterUpdate Method Tail

//NewRecord1 BeforeDelete Method Head @2-752E3118
        public void beforeDelete(Event e) {
//End NewRecord1 BeforeDelete Method Head

//NewRecord1 BeforeDelete Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeDelete Method Tail

//NewRecord1 BeforeBuildDelete Method Head @2-01A46505
        public void beforeBuildDelete(DataObjectEvent e) {
//End NewRecord1 BeforeBuildDelete Method Head

//NewRecord1 BeforeBuildDelete Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeBuildDelete Method Tail

//NewRecord1 BeforeExecuteDelete Method Head @2-B27406C7
        public void beforeExecuteDelete(DataObjectEvent e) {
//End NewRecord1 BeforeExecuteDelete Method Head

//NewRecord1 BeforeExecuteDelete Method Tail @2-FCB6E20C
        }
//End NewRecord1 BeforeExecuteDelete Method Tail

//NewRecord1 AfterExecuteDelete Method Head @2-389738EB
        public void afterExecuteDelete(DataObjectEvent e) {
//End NewRecord1 AfterExecuteDelete Method Head

//NewRecord1 AfterExecuteDelete Method Tail @2-FCB6E20C
        }
//End NewRecord1 AfterExecuteDelete Method Tail

//NewRecord1 AfterDelete Method Head @2-76E28BFE
        public void afterDelete(Event e) {
//End NewRecord1 AfterDelete Method Head

//NewRecord1 AfterDelete Method Tail @2-FCB6E20C
        }
//End NewRecord1 AfterDelete Method Tail

//NewRecord1 Record Handler Tail @2-FCB6E20C
    }
//End NewRecord1 Record Handler Tail

//Button_Insert Button Handler Head @3-F4614CE8
    public class NewRecord1Button_InsertButtonHandler implements ButtonListener {
//End Button_Insert Button Handler Head

//Button_Insert OnClick Method Head @3-A9885EEC
        public void onClick(Event e) {
//End Button_Insert OnClick Method Head

//Event OnClick Action Custom Code @4-44795B7A

	String DBAFLAG = Utils.convertToString(SessionStorage.getInstance(e.getPage().getRequest()).getAttribute("DBAFLAG"));

  	String BOOKSHEET = Utils.convertToString(e.getRecord().getControl("BOOKSHEET").getValue());
  	String N_REG_YY = Utils.convertToString(e.getRecord().getControl("N_REG_YY").getValue());
  	String N_REG_NO = Utils.convertToString(e.getRecord().getControl("N_REG_NO").getValue());
  	String N_REG_CG = Utils.convertToString(e.getRecord().getControl("N_REG_CG").getValue());
  	String FIRST_REG = Utils.convertToString(e.getRecord().getControl("FIRST_REG").getValue());
  	
  	String REG_KIND = Utils.convertToString(e.getRecord().getControl("REG_KIND").getValue());
  	String ACTN_EMPL = Utils.convertToString(e.getRecord().getControl("ACTN_EMPL").getValue());
  
  	SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("SearchParam_16", BOOKSHEET); 
  	SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("SearchParam_17", N_REG_YY); 
  	SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("SearchParam_18", N_REG_NO); 
  	SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("SearchParam_19", N_REG_CG); 
  	SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("SearchParam_20", REG_KIND); 
  	SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("SearchParam_21", ACTN_EMPL); 
	String msg="";
	String ls_check_reg = "";
	//System.err.println("********DBAFLAG=" + DBAFLAG);
	if(!StringUtils.isEmpty(BOOKSHEET) && !StringUtils.isEmpty(N_REG_YY) &&
	 !StringUtils.isEmpty(N_REG_NO) && !StringUtils.isEmpty(N_REG_CG) && !StringUtils.isEmpty(REG_KIND) && !StringUtils.isEmpty(ACTN_EMPL)){
		 ls_check_reg = Utils.convertToString(DBTools.dLookUp(
				"MAX(REG_YY||'-'||REG_NO||'-'||REG_CG)", 
				"BMSREGT", 
				"REG_KIND ='" + REG_KIND + "' and TRIM(CLOSE_DATE) IS NULL AND  REG_YY||REG_NO||REG_CG IN (SELECT REG_YY||REG_NO||REG_CG  FROM BMSREGT_LAN WHERE EXISTS (SELECT * FROM BMSLAN WHERE BMSREGT_LAN.DIST = BMSLAN.DIST AND BMSREGT_LAN.SECTION = BMSLAN.SECTION AND BMSREGT_LAN.ROAD_NO1 = BMSLAN.ROAD_NO1 AND NVL(BMSREGT_LAN.ROAD_NO2,'0000') = NVL(BMSLAN.ROAD_NO2,'0000') AND BMSLAN.INDEX_KEY ='" + BOOKSHEET + "'))", "SynctConn"));
        if(!StringUtils.isEmpty(ls_check_reg) && !DBAFLAG.equals("Y") && !REG_KIND.equals("B01") ) {
			String ls_lan = Utils.convertToString(DBTools.dLookUp(
					"MAX(GETLANNO(DIST,SECTION,ROAD_NO1,ROAD_NO2))", "BMSREGT", "REG_KIND ='" + REG_KIND + "' and REG_YY||'-'||REG_NO||'-'||REG_CG = '" + ls_check_reg + "' AND  REG_YY||REG_NO||REG_CG IN (SELECT REG_YY||REG_NO||REG_CG FROM BMSREGT_LAN WHERE EXISTS (SELECT * FROM BMSLAN WHERE BMSREGT_LAN.DIST = BMSLAN.DIST AND BMSREGT_LAN.SECTION = BMSLAN.SECTION AND BMSREGT_LAN.ROAD_NO1 = BMSLAN.ROAD_NO1 AND NVL(BMSREGT_LAN.ROAD_NO2,'0000') = NVL(BMSLAN.ROAD_NO2,'0000') AND BMSLAN.INDEX_KEY ='" + BOOKSHEET + "'))", "SynctConn"));
	        SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("UserMessage", "1" + ls_lan + "已在掛號號碼：" + ls_check_reg +"收件，不可再掛號!!");
			e.getRecord().getControl("BOOKSHEET").setValue(BOOKSHEET);
			e.getRecord().getControl("N_REG_YY").setValue(N_REG_YY);
			e.getRecord().getControl("N_REG_NO").setValue(N_REG_NO);
			e.getRecord().getControl("N_REG_CG").setValue(N_REG_CG);
            return;
        }else{	
        	if (REG_KIND.equals("B01")){
				String ls_lan = Utils.convertToString(DBTools.dLookUp(
						"MAX(GETLANNO(DIST,SECTION,ROAD_NO1,ROAD_NO2))", "BMSREGT", "REG_KIND ='" + REG_KIND + "' and REG_YY||'-'||REG_NO||'-'||REG_CG = '" + ls_check_reg + "' AND  REG_YY||REG_NO||REG_CG IN (SELECT REG_YY||REG_NO||REG_CG FROM BMSREGT_LAN WHERE EXISTS (SELECT * FROM BMSLAN WHERE BMSREGT_LAN.DIST = BMSLAN.DIST AND BMSREGT_LAN.SECTION = BMSLAN.SECTION AND BMSREGT_LAN.ROAD_NO1 = BMSLAN.ROAD_NO1 AND NVL(BMSREGT_LAN.ROAD_NO2,'0000') = NVL(BMSLAN.ROAD_NO2,'0000') AND BMSLAN.INDEX_KEY ='" + BOOKSHEET + "'))", "SynctConn"));
		        SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("UserMessage", "1" + ls_lan + "已在掛號號碼：" + ls_check_reg +"收件，可再掛號!!");
				 msg+="1使用執照中地號:" + ls_lan + "已在掛號號碼：" + ls_check_reg +"收件，可再掛號!!";
		        System.out.println("bm30101_man_4*****lan***********");
		        System.out.println("msg:"+msg);
        	}
        	
		    long l_cnt = 0;
		  
		    l_cnt = Utils.convertToLong(DBTools.dLookUp(
		  			"COUNT(*)  ", "BMSREGT", " REG_YY ='"+N_REG_YY+"' AND  REG_NO='"+N_REG_NO+"' AND REG_CG = '"+N_REG_CG+"'", "SynctConn"));
		  
		  
		    if (l_cnt > 0){
		        SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("UserMessage", "1已有" + N_REG_YY + "-" + N_REG_NO + "-" + N_REG_CG +"掛號號碼資料，不可再掛號!!");
				e.getRecord().getControl("BOOKSHEET").setValue(BOOKSHEET);
				e.getRecord().getControl("N_REG_YY").setValue(N_REG_YY);
				e.getRecord().getControl("N_REG_NO").setValue(N_REG_NO);
				e.getRecord().getControl("N_REG_CG").setValue(N_REG_CG);
	            return;
		    }else{
			    String Sql;
			    JDBCConnection Conn = JDBCConnectionFactory.getJDBCConnection("SynctConn");
				System.out.println("ACTN_EMPL = "+ACTN_EMPL);
				System.out.println("FIRST_REG = "+FIRST_REG);
				System.out.println("N_REG="+N_REG_YY+N_REG_NO+N_REG_CG);
			    if (ACTN_EMPL.equals("AJ2362") && ( FIRST_REG.equals(N_REG_YY+N_REG_NO) )       ) {
				    Sql = 	" INSERT INTO BMSREGT_SCHEDULE   (   "+
							"	   REG_YY,    REG_NO,    REG_CG,    PERSON_SEQ,    PERSON_TYPE,	"+
							"    SCHEDULE_DATEE,    CHECK_EMPNO,    APPLY_NAME,    APPLY_TEL,    APPLY_FLAG,	"+ 
							"    CR_DATE,    UP_DATE,    OP_USER,    SCHEDULE_DATES,    DATAID,	"+
							"    ID,    REG_ITEM,    MOB_UUID,    TOKEN,    SYNC  )	"+
							"  VALUES (	"+
							"'"+N_REG_YY+"','"+N_REG_NO+"','"+N_REG_CG+"',1,'1', "+  
							" null,'AJ2362',null,null,'1', "+
							" to_char(sysdate,'yyyymmdd')-19110000 , null, 'AJ2362',null,null, "+
							" null,null,null,null,'N' ) ";
                    System.out.println("AJ2362-----"+Sql);
				    Conn.executeUpdate(Sql);
			    	}
			    
			    Sql = " INSERT INTO BMSREGT   (   "+
			    " REG_YY,REG_NO, REG_CG, "+
			    " PUBLIC_FLAG,UP_FLOOR_NO,DN_FLOOR_NO,BLD_HEIGHT, "+
			    " LICENSE_YY,LICENSE_KIND,LICENSE_NO1,LICENSE_NO2,LICENSE_WORD,LICENSE_DESC, "+
			    " IO_DEP3_NAME, "+
			    " O_ADDRADR,O_ADDRADR_DESC, O_ADDRAD1, O_ADDRAD2,    O_ADDRAD3,    O_ADDRAD4,    O_ADDRAD5, "+
			    " O_ADDRAD6,    O_ADDRAD6_1,    O_ADDRAD7,    O_ADDRAD7_1,    O_ADDRAD8,    O_ADDRAD9, "+
			    " P01_NAME, "+
			    " ADDRADR,    ADDRADR_DESC,    ADDRAD1,    ADDRAD2,    ADDRAD3,    ADDRAD4,    ADDRAD5, "+
			    " ADDRAD6,    ADDRAD6_1,    ADDRAD7,    ADDRAD7_1,    ADDRAD8,    ADDRAD9, "+
			    " P02_NAME, "+
			    " INDEX_KEY,LAST_MODIFY,REG_KIND,ACTN_EMPL, FIRST_REG ) SELECT "+
				"'"+N_REG_YY+"','"+N_REG_NO+"','"+N_REG_CG+"', "+
			    " b.PUBLIC_CODE,b.UP_FLOOR_NO,b.DN_FLOOR_NO,b.BUILDING_HEIGHT, "+
			    " b.LICENSE_YY,b.LICENSE_KIND,b.LICENSE_NO1,b.LICENSE_NO2,b.LICENSE_WORD,b.LICENSE_DESC,"+
			    " p.NAME,   "+
			    " p.O_ADDRADR,    p.O_ADDRADR_DESC,    p.O_ADDRAD1,    p.O_ADDRAD2,    p.O_ADDRAD3,    p.O_ADDRAD4,    p.O_ADDRAD5,"+
			    " p.O_ADDRAD6,    p.O_ADDRAD6_1,    p.O_ADDRAD7,    p.O_ADDRAD7_1,    p.O_ADDRAD8,    p.O_ADDRAD9, "+
			    " p.NAME,    "+
			    " p.H_ADDRADR,    p.H_ADDRADR_DESC,    p.H_ADDRAD1,    p.H_ADDRAD2,    p.H_ADDRAD3,    p.H_ADDRAD4,    p.H_ADDRAD5,"+
			    " p.H_ADDRAD6,    p.H_ADDRAD6_1,    p.H_ADDRAD7,    p.H_ADDRAD7_1,    p.H_ADDRAD8,    p.H_ADDRAD9, "+
			    " r.NAME,b.INDEX_KEY,b.LAST_MODIFY,'" + REG_KIND + "','" + ACTN_EMPL + "','" +FIRST_REG+"' "+
				"	 FROM BMSBASE b,BMSP01 p,BMSP02 r "+
				"	WHERE b.INDEX_KEY ='"+BOOKSHEET+"' "+
				"	AND b.INDEX_KEY = p.INDEX_KEY "+
				"	AND p.SPOKESMAN = 'Y' "+
				"	AND b.INDEX_KEY = r.INDEX_KEY "+
				"	AND r.SPOKESMAN = 'Y'";
			    Conn.executeUpdate(Sql);
			    
			     Sql = "INSERT INTO BMSREGT_LAN   ( "+
			    " REG_YY,    REG_NO,    REG_CG, "+
			    " PERSON_SEQ,    SPOKESMAN, "+
			    " USAGE_CATEGORY_CODE1,    USAGE_CATEGORY_CODE2, "+
			    " DIST,    SECTION,    ROAD_NO1,    ROAD_NO2,    TOT_AREA,    USE_AREA ) "+
			  	" SELECT '"+N_REG_YY+"',  '"+N_REG_NO+"',  '"+N_REG_CG+"', "+
			  	" PERSON_SEQ,  SPOKESMAN, "+
			  	" USAGE_CATEGORY_CODE1,  USAGE_CATEGORY_CODE2, "+
			  	" DIST,  SECTION,  ROAD_NO1,  ROAD_NO2,  TOT_AREA,  USE_AREA "+
				" FROM BMSLAN WHERE INDEX_KEY ='"+BOOKSHEET+"'";
				Conn.executeUpdate(Sql);

			     Sql = "INSERT INTO BMSREGT_ADDR   ( "+
			    " REG_YY,    REG_NO,    REG_CG, "+
			    " PERSON_SEQ, NAME,ADDRADR,ADDRADR_DESC,ADDRAD1,ADDRAD2,ADDRAD3, "+
			    " ADDRAD4,ADDRAD5,ADDRAD6,ADDRAD6_1,ADDRAD7,ADDRAD7_1, "+
			    " ADDRAD8,ADDRAD9,BMPAS ) "+
			  	" SELECT '"+N_REG_YY+"',  '"+N_REG_NO+"',  '"+N_REG_CG+"', "+
			    " PERSON_SEQ, NAME,ADDRADR,ADDRADR_DESC,ADDRAD1,ADDRAD2,ADDRAD3, "+
			    " ADDRAD4,ADDRAD5,ADDRAD6,ADDRAD6_1,ADDRAD7,ADDRAD7_1, "+
			    " ADDRAD8,ADDRAD9,BMPAS "+
				" FROM BMSP01 WHERE INDEX_KEY ='"+BOOKSHEET+"'";
				Conn.executeUpdate(Sql);
				
				String DIST = Utils.convertToString(DBTools.dLookUp("DIST", "BMSREGT_LAN", " SPOKESMAN = 'Y' AND REG_YY ='"+N_REG_YY+"' AND  REG_NO='"+N_REG_NO+"' AND REG_CG = '"+N_REG_CG+"'", "SynctConn"));
				String SECTION = Utils.convertToString(DBTools.dLookUp("SECTION", "BMSREGT_LAN", " SPOKESMAN = 'Y' AND REG_YY ='"+N_REG_YY+"' AND  REG_NO='"+N_REG_NO+"' AND REG_CG = '"+N_REG_CG+"'", "SynctConn"));
				String ROAD_NO1 = Utils.convertToString(DBTools.dLookUp("ROAD_NO1", "BMSREGT_LAN", " SPOKESMAN = 'Y' AND REG_YY ='"+N_REG_YY+"' AND  REG_NO='"+N_REG_NO+"' AND REG_CG = '"+N_REG_CG+"'", "SynctConn"));
				String ROAD_NO2 = Utils.convertToString(DBTools.dLookUp("ROAD_NO2", "BMSREGT_LAN", " SPOKESMAN = 'Y' AND REG_YY ='"+N_REG_YY+"' AND  REG_NO='"+N_REG_NO+"' AND REG_CG = '"+N_REG_CG+"'", "SynctConn"));
		
			     Sql = "UPDATE BMSREGT SET "+
			    " DIST='" + DIST + "'" + 
			    " ,SECTION='" + SECTION + "'" + 
			    " ,ROAD_NO1='" + ROAD_NO1 +  "'" + 
			    " ,ROAD_NO2='" + ROAD_NO2 +  "'" + 
			    " ,LAST_RESULT_C='100'" + 
			  	" WHERE REG_YY = '"+N_REG_YY+"' AND  REG_NO= '"+N_REG_NO+"' AND REG_CG='"+N_REG_CG+"'";
				Conn.executeUpdate(Sql);
			    Conn.closeConnection();
			    msg +="1掛號資料複製成功.";
		        SessionStorage.getInstance(e.getPage().getRequest()).setAttribute("UserMessage",msg );
		        System.out.println("bm30101_man_4*****END***********");
		        System.out.println("msg:"+msg);
		        
			    e.getPage().setRedirectString("bm30101_man.jsp?REG_YY=" + N_REG_YY+"&REG_NO="+N_REG_NO+"&REG_CG="+N_REG_CG);
		    }
		}
	}


//End Event OnClick Action Custom Code

//Button_Insert OnClick Method Tail @3-FCB6E20C
        }
//End Button_Insert OnClick Method Tail

//Button_Insert BeforeShow Method Head @3-46046458
        public void beforeShow(Event e) {
//End Button_Insert BeforeShow Method Head

//Button_Insert BeforeShow Method Tail @3-FCB6E20C
        }
//End Button_Insert BeforeShow Method Tail

//Button_Insert Button Handler Tail @3-FCB6E20C
    }
//End Button_Insert Button Handler Tail

//Button_Cancel Button Handler Head @5-1AB323BB
    public class NewRecord1Button_CancelButtonHandler implements ButtonListener {
//End Button_Cancel Button Handler Head

//Button_Cancel OnClick Method Head @5-A9885EEC
        public void onClick(Event e) {
//End Button_Cancel OnClick Method Head

//Event OnClick Action Custom Code @16-44795B7A

	String REG_YY = Utils.convertToString(SessionStorage.getInstance(e.getPage().getRequest()).getAttribute("REG_YY"));
	String REG_NO = Utils.convertToString(SessionStorage.getInstance(e.getPage().getRequest()).getAttribute("REG_NO"));
	String REG_CG = Utils.convertToString(SessionStorage.getInstance(e.getPage().getRequest()).getAttribute("REG_CG"));

	if(StringUtils.isEmpty(REG_YY) || (!StringUtils.isEmpty(REG_YY) && REG_YY.equals("null")))  REG_YY = "";
	if(StringUtils.isEmpty(REG_NO) || (!StringUtils.isEmpty(REG_NO) && REG_NO.equals("null")))  REG_NO = "";
	if(StringUtils.isEmpty(REG_CG) || (!StringUtils.isEmpty(REG_CG) && REG_CG.equals("null")))  REG_CG = "";

	System.err.println("***************REG_NO=" + REG_NO);
    e.getPage().setRedirectString("bm30101_man.jsp?REG_YY=" + REG_YY+"&REG_NO="+REG_NO+"&REG_CG="+REG_CG);

//End Event OnClick Action Custom Code

//Button_Cancel OnClick Method Tail @5-FCB6E20C
        }
//End Button_Cancel OnClick Method Tail

//Button_Cancel BeforeShow Method Head @5-46046458
        public void beforeShow(Event e) {
//End Button_Cancel BeforeShow Method Head

//Button_Cancel BeforeShow Method Tail @5-FCB6E20C
        }
//End Button_Cancel BeforeShow Method Tail

//Button_Cancel Button Handler Tail @5-FCB6E20C
    }
//End Button_Cancel Button Handler Tail

//BOOKSHEET TextBox Handler Head @7-F0C7324D
    public class NewRecord1BOOKSHEETTextBoxHandler implements ValidationListener {
//End BOOKSHEET TextBox Handler Head

//BOOKSHEET BeforeShow Method Head @7-46046458
        public void beforeShow(Event e) {
//End BOOKSHEET BeforeShow Method Head

//BOOKSHEET BeforeShow Method Tail @7-FCB6E20C
        }
//End BOOKSHEET BeforeShow Method Tail

//BOOKSHEET OnValidate Method Head @7-5F430F8E
        public void onValidate(Event e) {
//End BOOKSHEET OnValidate Method Head

//BOOKSHEET Required Validation @7-EA72D057
        {
            Control cntrl = e.getControl();
            ((VerifiableControl)cntrl).addValidateHandler(new RequiredHandler( "" ));
        }
//End BOOKSHEET Required Validation

//BOOKSHEET OnValidate Method Tail @7-FCB6E20C
        }
//End BOOKSHEET OnValidate Method Tail

//BOOKSHEET TextBox Handler Tail @7-FCB6E20C
    }
//End BOOKSHEET TextBox Handler Tail

//N_REG_YY TextBox Handler Head @8-4ADB51FD
    public class NewRecord1N_REG_YYTextBoxHandler implements ValidationListener {
//End N_REG_YY TextBox Handler Head

//N_REG_YY BeforeShow Method Head @8-46046458
        public void beforeShow(Event e) {
//End N_REG_YY BeforeShow Method Head

//N_REG_YY BeforeShow Method Tail @8-FCB6E20C
        }
//End N_REG_YY BeforeShow Method Tail

//N_REG_YY OnValidate Method Head @8-5F430F8E
        public void onValidate(Event e) {
//End N_REG_YY OnValidate Method Head

//N_REG_YY Required Validation @8-EA72D057
        {
            Control cntrl = e.getControl();
            ((VerifiableControl)cntrl).addValidateHandler(new RequiredHandler( "" ));
        }
//End N_REG_YY Required Validation

//N_REG_YY OnValidate Method Tail @8-FCB6E20C
        }
//End N_REG_YY OnValidate Method Tail

//N_REG_YY TextBox Handler Tail @8-FCB6E20C
    }
//End N_REG_YY TextBox Handler Tail

//N_REG_NO TextBox Handler Head @9-9CF73A7A
    public class NewRecord1N_REG_NOTextBoxHandler implements ValidationListener {
//End N_REG_NO TextBox Handler Head

//N_REG_NO BeforeShow Method Head @9-46046458
        public void beforeShow(Event e) {
//End N_REG_NO BeforeShow Method Head

//N_REG_NO BeforeShow Method Tail @9-FCB6E20C
        }
//End N_REG_NO BeforeShow Method Tail

//N_REG_NO OnValidate Method Head @9-5F430F8E
        public void onValidate(Event e) {
//End N_REG_NO OnValidate Method Head

//N_REG_NO Required Validation @9-EA72D057
        {
            Control cntrl = e.getControl();
            ((VerifiableControl)cntrl).addValidateHandler(new RequiredHandler( "" ));
        }
//End N_REG_NO Required Validation

//N_REG_NO OnValidate Method Tail @9-FCB6E20C
        }
//End N_REG_NO OnValidate Method Tail

//N_REG_NO TextBox Handler Tail @9-FCB6E20C
    }
//End N_REG_NO TextBox Handler Tail

//N_REG_CG TextBox Handler Head @10-4A7C2D33
    public class NewRecord1N_REG_CGTextBoxHandler implements ValidationListener {
//End N_REG_CG TextBox Handler Head

//N_REG_CG BeforeShow Method Head @10-46046458
        public void beforeShow(Event e) {
//End N_REG_CG BeforeShow Method Head

//N_REG_CG BeforeShow Method Tail @10-FCB6E20C
        }
//End N_REG_CG BeforeShow Method Tail

//N_REG_CG OnValidate Method Head @10-5F430F8E
        public void onValidate(Event e) {
//End N_REG_CG OnValidate Method Head

//N_REG_CG Required Validation @10-EA72D057
        {
            Control cntrl = e.getControl();
            ((VerifiableControl)cntrl).addValidateHandler(new RequiredHandler( "" ));
        }
//End N_REG_CG Required Validation

//N_REG_CG OnValidate Method Tail @10-FCB6E20C
        }
//End N_REG_CG OnValidate Method Tail

//N_REG_CG TextBox Handler Tail @10-FCB6E20C
    }
//End N_REG_CG TextBox Handler Tail

//REG_KIND ListBox Handler Head @19-FDE49397
    public class NewRecord1REG_KINDListBoxHandler implements ValidationListener, ListDataObjectListener {
//End REG_KIND ListBox Handler Head

//REG_KIND BeforeShow Method Head @19-46046458
        public void beforeShow(Event e) {
//End REG_KIND BeforeShow Method Head

//REG_KIND BeforeShow Method Tail @19-FCB6E20C
        }
//End REG_KIND BeforeShow Method Tail

//REG_KIND OnValidate Method Head @19-5F430F8E
        public void onValidate(Event e) {
//End REG_KIND OnValidate Method Head

//REG_KIND Required Validation @19-EA72D057
        {
            Control cntrl = e.getControl();
            ((VerifiableControl)cntrl).addValidateHandler(new RequiredHandler( "" ));
        }
//End REG_KIND Required Validation

//REG_KIND OnValidate Method Tail @19-FCB6E20C
        }
//End REG_KIND OnValidate Method Tail

//REG_KIND BeforeBuildSelect Method Head @19-3041BA14
        public void beforeBuildSelect(DataObjectEvent e) {
//End REG_KIND BeforeBuildSelect Method Head

//REG_KIND BeforeBuildSelect Method Tail @19-FCB6E20C
        }
//End REG_KIND BeforeBuildSelect Method Tail

//REG_KIND BeforeExecuteSelect Method Head @19-8391D9D6
        public void beforeExecuteSelect(DataObjectEvent e) {
//End REG_KIND BeforeExecuteSelect Method Head

//REG_KIND BeforeExecuteSelect Method Tail @19-FCB6E20C
        }
//End REG_KIND BeforeExecuteSelect Method Tail

//REG_KIND AfterExecuteSelect Method Head @19-0972E7FA
        public void afterExecuteSelect(DataObjectEvent e) {
//End REG_KIND AfterExecuteSelect Method Head

//REG_KIND AfterExecuteSelect Method Tail @19-FCB6E20C
        }
//End REG_KIND AfterExecuteSelect Method Tail

//REG_KIND ListBox Handler Tail @19-FCB6E20C
    }
//End REG_KIND ListBox Handler Tail

//ACTN_EMPL ListBox Handler Head @25-DA5B75AD
    public class NewRecord1ACTN_EMPLListBoxHandler implements ValidationListener, ListDataObjectListener {
//End ACTN_EMPL ListBox Handler Head

//ACTN_EMPL BeforeShow Method Head @25-46046458
        public void beforeShow(Event e) {
//End ACTN_EMPL BeforeShow Method Head

//ACTN_EMPL BeforeShow Method Tail @25-FCB6E20C
        }
//End ACTN_EMPL BeforeShow Method Tail

//ACTN_EMPL OnValidate Method Head @25-5F430F8E
        public void onValidate(Event e) {
//End ACTN_EMPL OnValidate Method Head

//ACTN_EMPL Required Validation @25-EA72D057
        {
            Control cntrl = e.getControl();
            ((VerifiableControl)cntrl).addValidateHandler(new RequiredHandler( "" ));
        }
//End ACTN_EMPL Required Validation

//ACTN_EMPL OnValidate Method Tail @25-FCB6E20C
        }
//End ACTN_EMPL OnValidate Method Tail

//ACTN_EMPL BeforeBuildSelect Method Head @25-3041BA14
        public void beforeBuildSelect(DataObjectEvent e) {
//End ACTN_EMPL BeforeBuildSelect Method Head

//ACTN_EMPL BeforeBuildSelect Method Tail @25-FCB6E20C
        }
//End ACTN_EMPL BeforeBuildSelect Method Tail

//ACTN_EMPL BeforeExecuteSelect Method Head @25-8391D9D6
        public void beforeExecuteSelect(DataObjectEvent e) {
//End ACTN_EMPL BeforeExecuteSelect Method Head

//ACTN_EMPL BeforeExecuteSelect Method Tail @25-FCB6E20C
        }
//End ACTN_EMPL BeforeExecuteSelect Method Tail

//ACTN_EMPL AfterExecuteSelect Method Head @25-0972E7FA
        public void afterExecuteSelect(DataObjectEvent e) {
//End ACTN_EMPL AfterExecuteSelect Method Head

//ACTN_EMPL AfterExecuteSelect Method Tail @25-FCB6E20C
        }
//End ACTN_EMPL AfterExecuteSelect Method Tail

//ACTN_EMPL ListBox Handler Tail @25-FCB6E20C
    }
//End ACTN_EMPL ListBox Handler Tail

//FIRST_REG TextBox Handler Head @31-993AF3E5
    public class NewRecord1FIRST_REGTextBoxHandler implements ValidationListener {
//End FIRST_REG TextBox Handler Head

//FIRST_REG BeforeShow Method Head @31-46046458
        public void beforeShow(Event e) {
//End FIRST_REG BeforeShow Method Head

//FIRST_REG BeforeShow Method Tail @31-FCB6E20C
        }
//End FIRST_REG BeforeShow Method Tail

//FIRST_REG OnValidate Method Head @31-5F430F8E
        public void onValidate(Event e) {
//End FIRST_REG OnValidate Method Head

//FIRST_REG Required Validation @31-EA72D057
        {
            Control cntrl = e.getControl();
            ((VerifiableControl)cntrl).addValidateHandler(new RequiredHandler( "" ));
        }
//End FIRST_REG Required Validation

//FIRST_REG OnValidate Method Tail @31-FCB6E20C
        }
//End FIRST_REG OnValidate Method Tail

//FIRST_REG TextBox Handler Tail @31-FCB6E20C
    }
//End FIRST_REG TextBox Handler Tail

//Comment workaround @1-A0AAE532
%> <%
//End Comment workaround

//Processing @1-73614225
    Page bm30101_man_4Model = (Page)request.getAttribute("bm30101_man_4_page");
    Page bm30101_man_4Parent = (Page)request.getAttribute("bm30101_man_4Parent");
    if (bm30101_man_4Model == null) {
        PageController bm30101_man_4Cntr = new PageController(request, response, application, "/bm30101_man_4.xml" );
        bm30101_man_4Model = bm30101_man_4Cntr.getPage();
        bm30101_man_4Model.setRelativePath("./");
        //if (bm30101_man_4Parent != null) {
            //if (!bm30101_man_4Parent.getChild(bm30101_man_4Model.getName()).isVisible()) return;
        //}
        ((Record)bm30101_man_4Model.getChild("NewRecord1")).addRecordListener(new bm30101_man_4NewRecord1RecordHandler());
        ((Button)((Record)bm30101_man_4Model.getChild("NewRecord1")).getChild("Button_Insert")).addButtonListener(new NewRecord1Button_InsertButtonHandler());
        ((Button)((Record)bm30101_man_4Model.getChild("NewRecord1")).getChild("Button_Cancel")).addButtonListener(new NewRecord1Button_CancelButtonHandler());
        ((TextBox)((Record)bm30101_man_4Model.getChild("NewRecord1")).getChild("BOOKSHEET")).addValidationListener(new NewRecord1BOOKSHEETTextBoxHandler());
        ((TextBox)((Record)bm30101_man_4Model.getChild("NewRecord1")).getChild("N_REG_YY")).addValidationListener(new NewRecord1N_REG_YYTextBoxHandler());
        ((TextBox)((Record)bm30101_man_4Model.getChild("NewRecord1")).getChild("N_REG_NO")).addValidationListener(new NewRecord1N_REG_NOTextBoxHandler());
        ((TextBox)((Record)bm30101_man_4Model.getChild("NewRecord1")).getChild("N_REG_CG")).addValidationListener(new NewRecord1N_REG_CGTextBoxHandler());
        ((ListBox)((Record)bm30101_man_4Model.getChild("NewRecord1")).getChild("REG_KIND")).addValidationListener(new NewRecord1REG_KINDListBoxHandler());
        ((ListBox)((Record)bm30101_man_4Model.getChild("NewRecord1")).getChild("ACTN_EMPL")).addValidationListener(new NewRecord1ACTN_EMPLListBoxHandler());
        ((TextBox)((Record)bm30101_man_4Model.getChild("NewRecord1")).getChild("FIRST_REG")).addValidationListener(new NewRecord1FIRST_REGTextBoxHandler());
        bm30101_man_4Cntr.process();
%>
<%
        if (bm30101_man_4Parent == null) {
            bm30101_man_4Model.setCookies();
            if (bm30101_man_4Model.redirect()) return;
        } else {
            bm30101_man_4Model.redirect();
        }
    }
//End Processing

%>
