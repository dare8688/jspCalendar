<Page id="1" templateExtension="html" relativePath="." fullRelativePath="." secured="False" urlType="Relative" isIncluded="False" SSLAccess="False" isService="False" cachingEnabled="False" cachingDuration="1 minutes" wizardTheme="Synct" wizardThemeVersion="3.0" useDesign="False" needGeneration="0">
	<Components>
		<Record id="2" sourceType="Table" urlType="Relative" secured="False" allowInsert="True" allowUpdate="False" allowDelete="False" validateData="True" preserveParameters="GET" returnValueType="Number" returnValueTypeForDelete="Number" returnValueTypeForInsert="Number" returnValueTypeForUpdate="Number" name="NewRecord1" actionPage="bm30101_man" errorSummator="Error" wizardFormMethod="post" PathID="NewRecord1" wizardOrientation="Vertical" old_temp_id="218" editableComponentTypeString="Record">
			<Components>
				<Button id="3" urlType="Relative" enableValidation="True" isDefault="False" name="Button_Insert" PathID="NewRecord1Button_Insert" operation="Insert" old_temp_id="262">
					<Components/>
					<Events>
						<Event name="OnClick" type="Server">
							<Actions>
								<Action actionName="Custom Code" actionCategory="General" id="4" old_temp_id="264"/>
							</Actions>
						</Event>
					</Events>
					<Attributes/>
					<Features/>
				</Button>
				<Button id="5" urlType="Relative" enableValidation="False" isDefault="False" name="Button_Cancel" PathID="NewRecord1Button_Cancel" old_temp_id="263" removeParameters="REG_YY;REG_NO;REG_CG;">
					<Components/>
					<Events>
						<Event name="OnClick" type="Server">
							<Actions>
								<Action actionName="Custom Code" actionCategory="General" id="16"/>
							</Actions>
						</Event>
					</Events>
					<Attributes/>
					<Features/>
				</Button>
				<TextBox id="7" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="BOOKSHEET" PathID="NewRecord1BOOKSHEET" old_temp_id="265" caption="書表編號" required="True">
					<Components/>
					<Events/>
					<Attributes/>
					<Features/>
				</TextBox>
				<TextBox id="8" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="N_REG_YY" PathID="NewRecord1N_REG_YY" old_temp_id="266" caption="新掛號號碼-年度" required="True">
					<Components/>
					<Events/>
					<Attributes/>
					<Features/>
				</TextBox>
				<TextBox id="9" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="N_REG_NO" PathID="NewRecord1N_REG_NO" old_temp_id="267" caption="新掛號號碼-號碼" required="True">
					<Components/>
					<Events/>
					<Attributes/>
					<Features/>
				</TextBox>
				<TextBox id="10" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="N_REG_CG" PathID="NewRecord1N_REG_CG" old_temp_id="268" caption="新掛號號碼-次數" required="True">
					<Components/>
					<Events/>
					<Attributes/>
					<Features/>
				</TextBox>
				<ListBox id="19" visible="Yes" fieldSourceType="DBColumn" sourceType="SQL" dataType="Text" returnValueType="Number" name="REG_KIND" wizardEmptyCaption="選擇值" PathID="NewRecord1REG_KIND" dataSource="select * from bldcode where code_type='OFC' and CODE_SEQ&lt;&gt;'**'" connection="SynctConn" boundColumn="CODE_SEQ" textColumn="CODE_DESC" required="True" fieldSource="REG_KIND" caption="業務別">
					<Components/>
					<Events>
						<Event name="OnChange" type="Client">
							<Actions>
								<Action actionName="Custom Code" actionCategory="General" id="20"/>
							</Actions>
						</Event>
					</Events>
					<TableParameters/>
					<SPParameters/>
					<SQLParameters/>
					<JoinTables/>
					<JoinLinks/>
					<Fields/>
					<PKFields/>
					<Attributes/>
					<Features/>
				</ListBox>
				<TextBox id="21" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="REG_KIND_E" PathID="NewRecord1REG_KIND_E" fieldSource="REG_KIND">
					<Components/>
					<Events>
						<Event name="OnChange" type="Client">
							<Actions>
								<Action actionName="Custom Code" actionCategory="General" id="22"/>
							</Actions>
						</Event>
					</Events>
					<Attributes/>
					<Features/>
				</TextBox>
				<TextBox id="23" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="ACTN_EMPL_E" PathID="NewRecord1ACTN_EMPL_E" fieldSource="ACTN_EMPL">
					<Components/>
					<Events>
						<Event name="OnChange" type="Client">
							<Actions>
								<Action actionName="Custom Code" actionCategory="General" id="24"/>
							</Actions>
						</Event>
					</Events>
					<Attributes/>
					<Features/>
				</TextBox>
				<ListBox id="25" visible="Yes" fieldSourceType="DBColumn" sourceType="Table" dataType="Text" returnValueType="Number" name="ACTN_EMPL" wizardEmptyCaption="選擇值" PathID="NewRecord1ACTN_EMPL" connection="SynctConn" dataSource="BMSEMP" orderBy="EMPNO" boundColumn="EMPNO" textColumn="NAME" fieldSource="ACTN_EMPL" required="True" caption="承辦人">
					<Components/>
					<Events>
						<Event name="OnChange" type="Client">
							<Actions>
								<Action actionName="Custom Code" actionCategory="General" id="26"/>
							</Actions>
						</Event>
					</Events>
					<TableParameters>
						<TableParameter id="27" conditionType="Expression" useIsNull="False" dataType="Text" expression="USE_FLAG = 'N'" field="USE_FLAG" logicOperator="And" parameterSource="USE_FLAG" parameterType="URL" searchConditionType="Equal"/>
					</TableParameters>
					<SPParameters/>
					<SQLParameters/>
					<JoinTables>
						<JoinTable id="28" posHeight="180" posLeft="10" posTop="10" posWidth="123" tableName="BMSEMP"/>
					</JoinTables>
					<JoinLinks/>
					<Fields>
						<Field id="29" fieldName="EMPNO" tableName="BMSEMP"/>
						<Field id="30" fieldName="NAME" tableName="BMSEMP"/>
					</Fields>
					<PKFields/>
					<Attributes/>
					<Features/>
				</ListBox>
				<TextBox id="31" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="FIRST_REG" PathID="NewRecord1FIRST_REG" old_temp_id="265" caption="第一次掛號號碼" required="True">
					<Components/>
					<Events/>
					<Attributes/>
					<Features/>
				</TextBox>
</Components>
			<Events>
				<Event name="BeforeShow" type="Server">
					<Actions>
						<Action actionName="Custom Code" actionCategory="General" id="15"/>
					</Actions>
				</Event>
				<Event name="AfterInsert" type="Server">
					<Actions>
						<Action actionName="Custom Code" actionCategory="General" id="17"/>
					</Actions>
				</Event>
				<Event name="AfterUpdate" type="Server">
					<Actions>
						<Action actionName="Custom Code" actionCategory="General" id="18"/>
					</Actions>
				</Event>
			</Events>
			<TableParameters/>
			<SPParameters/>
			<SQLParameters/>
			<JoinTables/>
			<JoinLinks/>
			<Fields/>
			<PKFields/>
			<ISPParameters/>
			<ISQLParameters/>
			<IFormElements/>
			<USPParameters/>
			<USQLParameters/>
			<UConditions/>
			<UFormElements/>
			<DSPParameters/>
			<DSQLParameters/>
			<DConditions/>
			<SecurityGroups/>
			<Attributes/>
			<Features/>
		</Record>
	</Components>
	<CodeFiles>
		<CodeFile id="Model" language="JSP" name="bm30101_man_4.xml" path="." forShow="False" comment="&lt;!--" commentEnd="--&gt;" codePage="utf-8"/>
		<CodeFile id="JSP" language="JSP" name="bm30101_man_4.jsp" path="." forShow="True" url="bm30101_man_4.jsp" comment="&lt;%--" commentEnd="--%&gt;" codePage="utf-8"/>
		<CodeFile id="Handlers" language="JSP" name="bm30101_man_4Handlers.jsp" path="." forShow="False" comment="//" codePage="utf-8"/>
	</CodeFiles>
	<SecurityGroups/>
	<CachingParameters/>
	<Attributes/>
	<Features/>
	<Events>
		<Event name="OnLoad" type="Client">
			<Actions>
				<Action actionName="Custom Code" actionCategory="General" id="14"/>
			</Actions>
		</Event>
	</Events>
</Page>
