prompt --application/pages/page_00601
begin
--   Manifest
--     PAGE: 00601
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>166651606440306663
,p_default_application_id=>200
,p_default_id_offset=>0
,p_default_owner=>'REHAB_V2'
);
wwv_flow_imp_page.create_page(
 p_id=>601
,p_name=>'Charts'
,p_alias=>'CHARTS1'
,p_step_title=>'Charts'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(323519045515394291)
,p_plug_name=>'WholeNumbers'
,p_static_id=>'avg-measurements'
,p_parent_plug_id=>wwv_flow_imp.id(327164601201296661)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P601_CHARTS2SHOW like ''%AVGM%'''
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(78100967575343297)
,p_region_id=>wwv_flow_imp.id(323519045515394291)
,p_chart_type=>'line'
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'N'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_time_axis_type=>'enabled'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78102663265343306)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'dia-avg'
,p_seq=>90
,p_name=>'Dia Avg'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A Dia \0441\0435\0440\0435\0440\0434\043D\0456\0439'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PRESSURE_DIA) MT_PRESSURE_DIA,',
unistr('       ''\0422\0438\0441\043A Dia \0441\0435\0440\0435\0440\0434\043D\0456\0439: '' ||round(avg(MT_PRESSURE_DIA))||'' ''|| to_char(trunc(MT_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_DIA is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'--and pressure_lr=''R''',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_DIA'
,p_items_label_column_name=>'MT_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%DIA-A%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78103136817343310)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'dia-left'
,p_seq=>70
,p_name=>'Dia Left'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A Dia \043B\0456\0432\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PRESSURE_DIA) MT_PRESSURE_DIA,',
unistr('       ''\0422\0438\0441\043A Dia \043B\0456\0432\0430: '' ||round(avg(MT_PRESSURE_DIA))||'' ''|| to_char(trunc(MT_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_DIA is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'and MT_PRESSURE_LR=''L''',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_DIA'
,p_items_label_column_name=>'MT_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%DIA#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78103719104343312)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'dia-right'
,p_seq=>80
,p_name=>'Dia Right'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A Dia \043F\0440\0430\0432\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PRESSURE_DIA) MT_PRESSURE_DIA,',
unistr('       ''\0422\0438\0441\043A Dia \043F\0440\0430\0432\0430: '' ||round(avg(MT_PRESSURE_DIA))||'' ''|| to_char(trunc(MT_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_DIA is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'and MT_PRESSURE_LR=''R''',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_DIA'
,p_items_label_column_name=>'MT_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%DIA#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78104342082343313)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'pulse'
,p_seq=>30
,p_name=>'Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041F\0443\043B\044C\0441'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PULSE) MT_PULSE,',
unistr('       ''\041F\0443\043B\044C\0441: '' ||round(avg(MT_PULSE))||'' ''|| to_char(trunc(MT_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_MEASUREMENTS',
'where MT_PULSE is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PULSE'
,p_items_label_column_name=>'MT_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%PULSE%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78104971464343315)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'syst-avg'
,p_seq=>60
,p_name=>'Syst Avg'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A SYS \0441\0435\0440\0435\0440\0434\043D\0456\0439'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PRESSURE_SYS) MT_PRESSURE_SYS,',
unistr('       ''\0422\0438\0441\043A SYS \0441\0435\0440\0435\0440\0434\043D\0456\0439: '' ||round(avg(MT_PRESSURE_SYS))||'' ''|| to_char(trunc(MT_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_SYS is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'--and pressure_lr=''R''',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_SYS'
,p_items_label_column_name=>'MT_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%SYST-A%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78105541259343317)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'syst-left'
,p_seq=>40
,p_name=>'Syst Left'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A SYS \043B\0456\0432\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PRESSURE_SYS) MT_PRESSURE_SYS,',
unistr('       ''\0422\0438\0441\043A SYS \043B\0456\0432\0430: '' ||round(avg(MT_PRESSURE_SYS))||'' ''|| to_char(trunc(MT_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_SYS is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'and MT_PRESSURE_LR=''L''',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_SYS'
,p_items_label_column_name=>'MT_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%SYST#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78106161151343318)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'syst-right'
,p_seq=>50
,p_name=>'Syst Right'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A SYS \043F\0440\0430\0432\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PRESSURE_SYS) MT_PRESSURE_SYS,',
unistr('       ''\0422\0438\0441\043A SYS \043F\0440\0430\0432\0430: '' ||round(avg(MT_PRESSURE_SYS))||'' ''|| to_char(trunc(MT_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_SYS is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'and MT_PRESSURE_LR=''R''',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_SYS'
,p_items_label_column_name=>'MT_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%SYST#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78112115238343335)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'tot-avg-pulse'
,p_seq=>200
,p_name=>'Tot Avg Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0421\0435\0440\0435\0434\043D\0456\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_TOTAL_AVG_PULSE) WL_TOTAL_AVG_PULSE,',
unistr('       ''\0421\0435\0440\0435\0434\043D\0456\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441: '' ||round(avg(WL_TOTAL_AVG_PULSE))||'' ''|| to_char(trunc(WL_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_WATCH_LOGS',
'where WL_TOTAL_AVG_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_TOTAL_AVG_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%TAP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78111576698343333)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'tot-max-pulse'
,p_seq=>190
,p_name=>'Tot Max Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_TOTAL_MAX_PULSE) WL_TOTAL_MAX_PULSE,',
unistr('       ''\041C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441: '' ||round(avg(WL_TOTAL_MAX_PULSE))||'' ''|| to_char(trunc(WL_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_WATCH_LOGS',
'where WL_TOTAL_MAX_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_TOTAL_MAX_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%TMIP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78112766690343336)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'tot-min-pulse'
,p_seq=>180
,p_name=>'Tot Min Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_TOTAL_MIN_PULSE) WL_TOTAL_MIN_PULSE,',
unistr('       ''\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441: '' ||round(avg(WL_TOTAL_MIN_PULSE))||'' ''|| to_char(trunc(WL_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_WATCH_LOGS',
'where WL_TOTAL_MIN_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_TOTAL_MIN_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%TMAP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77068532418873147)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'training-avg-pulse'
,p_seq=>230
,p_name=>'Training Avg Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0421\0435\0440\0435\0434\043D\0456\0439 \0442\0440\0435\043D\0443\0432\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441'' nm,'),
'       trunc(TR_START,''dd'') TR_START, ',
'       avg(TR_PULSE_AVG) TR_PULSE_AVG,',
unistr('       ''\0421\0435\0440\0435\0434\043D\0456\0439 \0442\0440\0435\043D\0443\0432\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441: '' ||round(avg(TR_PULSE_AVG))||'' ''|| to_char(trunc(TR_START,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_TRAININGS',
'where TR_PULSE_AVG is not null and TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(TR_START,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'TR_PULSE_AVG'
,p_items_label_column_name=>'TR_START'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%TRAVP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77068425810873146)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'training-max-pulse'
,p_seq=>220
,p_name=>'Training Max Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439 \0442\0440\0435\043D\0443\0432\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441'' nm,'),
'       trunc(TR_START,''dd'') TR_START, ',
'       avg(TR_PULSE_MAX) TR_PULSE_MAX,',
unistr('       ''\041C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439 \0442\0440\0435\043D\0443\0432\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441: '' ||round(avg(TR_PULSE_MAX))||'' ''|| to_char(trunc(TR_START,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_TRAININGS',
'where TR_PULSE_MAX is not null and TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(TR_START,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'TR_PULSE_MAX'
,p_items_label_column_name=>'TR_START'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%TRMAP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77068365904873145)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'training-min-pulse'
,p_seq=>210
,p_name=>'Training Min Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \0442\0440\0435\043D\0443\0432\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441'' nm,'),
'       trunc(TR_START,''dd'') TR_START, ',
'       avg(TR_PULSE_MIN) TR_PULSE_MIN,',
unistr('       ''\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \0442\0440\0435\043D\0443\0432\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441: '' ||round(avg(TR_PULSE_MIN))||'' ''|| to_char(trunc(TR_START,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_TRAININGS',
'where TR_PULSE_MIN is not null and TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(TR_START,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'TR_PULSE_MIN'
,p_items_label_column_name=>'TR_START'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%TRMIP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78110953043343331)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'wl-avg-calm'
,p_seq=>170
,p_name=>'Calm Avg pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0421\0435\0440\0435\0434\043D\0456\0439 \043F\0443\043B\044C\0441 \0441\043F\043E\043A\043E\044E'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_CALM_AVG_PULSE) WL_CALM_AVG_PULSE,',
unistr('       ''\0421\0435\0440\0435\0434\043D\0456\0439 \043F\0443\043B\044C\0441 \0441\043F\043E\043A\043E\044E: '' ||round(avg(WL_CALM_AVG_PULSE))||'' ''|| to_char(trunc(WL_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_WATCH_LOGS',
'where WL_CALM_AVG_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_CALM_AVG_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%CAVP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78107326604343322)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'wl-avg-pulse'
,p_seq=>160
,p_name=>'Night Avg Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441 \0441\0435\0440\0435\0440\0434\043D\0456\0439'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_NIGHT_AVG_PULSE) WL_NIGHT_AVG_PULSE,',
unistr('       ''\041D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441 \043C\0456\043D\0456\043C\0443\043C: '' ||round(avg(WL_NIGHT_AVG_PULSE))||'' ''|| to_char(trunc(WL_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_WATCH_LOGS',
'where WL_NIGHT_AVG_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_NIGHT_AVG_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%NAVP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78107936916343324)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'wl-max-pulse'
,p_seq=>150
,p_name=>'Night Max Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441 \043C\0430\043A\0441\0438\043C\0443\043C'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_NIGHT_MAX_PULSE) WL_NIGHT_MAX_PULSE,',
unistr('       ''\041D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441 \043C\0456\043D\0456\043C\0443\043C: '' ||round(avg(WL_NIGHT_MAX_PULSE))||'' ''|| to_char(trunc(WL_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_WATCH_LOGS',
'where WL_NIGHT_MAX_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_NIGHT_MAX_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%NMAP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78108599762343325)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'wl-min-pulse'
,p_seq=>140
,p_name=>'Night Min Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441 \043C\0456\043D\0456\043C\0443\043C'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_NIGHT_MIN_PULSE) WL_NIGHT_MIN_PULSE,',
unistr('       ''\041D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441 \043C\0456\043D\0456\043C\0443\043C: '' ||round(avg(WL_NIGHT_MIN_PULSE))||'' ''|| to_char(trunc(WL_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_WATCH_LOGS',
'where WL_NIGHT_MIN_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_NIGHT_MIN_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_AVGMEASUR like ''%NMIP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(78102033461343302)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(78101405775343300)
,p_chart_id=>wwv_flow_imp.id(78100967575343297)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('\0421\0435\0440\0435\0434\043D\0456 \0437\043D\0430\0447\0435\043D\043D\044F')
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(155403863720218900)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(16870387633504251)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(327164601201296661)
,p_plug_name=>'Charts'
,p_static_id=>'charts'
,p_title=>unistr('\0414\0456\0430\0433\0440\0430\043C\0438')
,p_parent_plug_id=>wwv_flow_imp.id(327164432575296660)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(327164811693296663)
,p_plug_name=>'Drug Use'
,p_static_id=>'drug-use'
,p_parent_plug_id=>wwv_flow_imp.id(327164601201296661)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P601_CHARTS2SHOW like ''%DRU%'''
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(78126057087343374)
,p_region_id=>wwv_flow_imp.id(327164811693296663)
,p_chart_type=>'bar'
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_time_axis_type=>'enabled'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78127743613343378)
,p_chart_id=>wwv_flow_imp.id(78126057087343374)
,p_static_id=>'drug'
,p_seq=>10
,p_name=>'Drug 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P601_START,''&APP_DTFMT_DATE.'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P601_END,''&APP_DTFMT_DATE.'') - to_date(:P601_START,''&APP_DTFMT_DATE.'')),',
'dr_data1 as ',
'(select unique ',
'        d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY_SHORT||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''&APP_DTFMT_DATE.'')||'')'' nm,',
'        pr.pr_id, PRD_DR_ID',
' from REHAB_PRESCRIPTORS prr, REHAB_PRESCRIPTIONS pr, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS, REHAB_DRUGS d',
'where pr.pr_prr_id=prr.prr_id ',
'  and PR_ID=(select c from (select column_value c, rownum rn from table(apex_string.split(:P601_DRUGS,'':''))) where rn=1)',
'  and PR_ID = PRATR_PR_ID and PRATR_ID = PRD_PRATR_ID and PRD_DR_ID = DR_ID',
'  and PR_PAT_ID=REHAB_CONTEXT_PKG.getPATIENT())',
'select',
unistr('  nm, dates.dd CONSUMED, 1 ACTUAL_DOSAGE, ''\0421\043F\043E\0436\0438\0442\043E: '' ||ACTUAL_DOSAGE||'' \043C\0433 \0432 ''|| to_char(CONSUMED,''Day &APP_DTFMT_DATE.'') ct'),
'from',
' dr_data1, ',
' dates,',
' (',
'   select du.dru_pr_id,du.DRU_DR_ID,',
'          trunc(DRU_CONSUMED,''dd'') CONSUMED, ',
'          sum(DRU_ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from REHAB_DRUG_USES du, dr_data1 d',
'  where du.DRU_ACTUAL_DOSAGE is not null',
'    and du.dru_pat_id = REHAB_CONTEXT_PKG.getPATIENT() ',
'    and du.dru_pr_id = d.pr_id',
'    and du.DRU_DR_ID = PRD_DR_ID',
'    and trunc(DRU_CONSUMED,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'    group by du.dru_pr_id, du.DRU_DR_ID, trunc(DRU_CONSUMED,''dd'')',
'    ) duu',
'where duu.CONSUMED(+)=dates.dd and dr_data1.pr_id = duu.dru_pr_id and dr_data1.PRD_DR_ID = DRU_DR_ID',
'order by CONSUMED'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_items_short_desc_column_name=>'CT'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78128376873343380)
,p_chart_id=>wwv_flow_imp.id(78126057087343374)
,p_static_id=>'drug-2'
,p_seq=>20
,p_name=>'Drug 2'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P601_START,''&APP_DTFMT_DATE.'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P601_END,''&APP_DTFMT_DATE.'') - to_date(:P601_START,''&APP_DTFMT_DATE.'')),',
'dr_data1 as ',
'(select unique ',
'        d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY_SHORT||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''&APP_DTFMT_DATE.'')||'')'' nm,',
'        pr.pr_id, PRD_DR_ID',
' from REHAB_PRESCRIPTORS prr, REHAB_PRESCRIPTIONS pr, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS, REHAB_DRUGS d',
'where pr.pr_prr_id=prr.prr_id ',
'  and PR_ID=(select c from (select column_value c, rownum rn from table(apex_string.split(:P601_DRUGS,'':''))) where rn=2)',
'  and PR_ID = PRATR_PR_ID and PRATR_ID = PRD_PRATR_ID and PRD_DR_ID = DR_ID',
'  and PR_PAT_ID=REHAB_CONTEXT_PKG.getPATIENT())',
'select',
unistr('  nm, dates.dd CONSUMED, 1 ACTUAL_DOSAGE, ''\0421\043F\043E\0436\0438\0442\043E: '' ||ACTUAL_DOSAGE||'' \043C\0433 \0432 ''|| to_char(CONSUMED,''Day &APP_DTFMT_DATE.'') ct'),
'from',
' dr_data1, ',
' dates,',
' (',
'   select du.dru_pr_id,du.DRU_DR_ID,',
'          trunc(DRU_CONSUMED,''dd'') CONSUMED, ',
'          sum(DRU_ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from REHAB_DRUG_USES du, dr_data1 d',
'  where du.DRU_ACTUAL_DOSAGE is not null',
'    and du.dru_pat_id = REHAB_CONTEXT_PKG.getPATIENT() ',
'    and du.dru_pr_id = d.pr_id',
'    and du.DRU_DR_ID = PRD_DR_ID',
'    and trunc(DRU_CONSUMED,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'    group by du.dru_pr_id, du.DRU_DR_ID, trunc(DRU_CONSUMED,''dd'')',
'    ) duu',
'where duu.CONSUMED(+)=dates.dd and dr_data1.pr_id = duu.dru_pr_id and dr_data1.PRD_DR_ID = DRU_DR_ID',
'order by CONSUMED'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_items_short_desc_column_name=>'CT'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78128909762343382)
,p_chart_id=>wwv_flow_imp.id(78126057087343374)
,p_static_id=>'drug-3'
,p_seq=>30
,p_name=>'Drug 3'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P601_START,''&APP_DTFMT_DATE.'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P601_END,''&APP_DTFMT_DATE.'') - to_date(:P601_START,''&APP_DTFMT_DATE.'')),',
'dr_data1 as ',
'(select unique ',
'        d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY_SHORT||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''&APP_DTFMT_DATE.'')||'')'' nm,',
'        pr.pr_id, PRD_DR_ID',
' from REHAB_PRESCRIPTORS prr, REHAB_PRESCRIPTIONS pr, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS, REHAB_DRUGS d',
'where pr.pr_prr_id=prr.prr_id ',
'  and PR_ID=(select c from (select column_value c, rownum rn from table(apex_string.split(:P601_DRUGS,'':''))) where rn=3)',
'  and PR_ID = PRATR_PR_ID and PRATR_ID = PRD_PRATR_ID and PRD_DR_ID = DR_ID',
'  and PR_PAT_ID=REHAB_CONTEXT_PKG.getPATIENT())',
'select',
unistr('  nm, dates.dd CONSUMED, 1 ACTUAL_DOSAGE, ''\0421\043F\043E\0436\0438\0442\043E: '' ||ACTUAL_DOSAGE||'' \043C\0433 \0432 ''|| to_char(CONSUMED,''Day &APP_DTFMT_DATE.'') ct'),
'from',
' dr_data1, ',
' dates,',
' (',
'   select du.dru_pr_id,du.DRU_DR_ID,',
'          trunc(DRU_CONSUMED,''dd'') CONSUMED, ',
'          sum(DRU_ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from REHAB_DRUG_USES du, dr_data1 d',
'  where du.DRU_ACTUAL_DOSAGE is not null',
'    and du.dru_pat_id = REHAB_CONTEXT_PKG.getPATIENT() ',
'    and du.dru_pr_id = d.pr_id',
'    and du.DRU_DR_ID = PRD_DR_ID',
'    and trunc(DRU_CONSUMED,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'    group by du.dru_pr_id, du.DRU_DR_ID, trunc(DRU_CONSUMED,''dd'')',
'    ) duu',
'where duu.CONSUMED(+)=dates.dd and dr_data1.pr_id = duu.dru_pr_id and dr_data1.PRD_DR_ID = DRU_DR_ID',
'order by CONSUMED'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_items_short_desc_column_name=>'CT'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78129520069343384)
,p_chart_id=>wwv_flow_imp.id(78126057087343374)
,p_static_id=>'drug-4'
,p_seq=>40
,p_name=>'Drug 4'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P601_START,''&APP_DTFMT_DATE.'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P601_END,''&APP_DTFMT_DATE.'') - to_date(:P601_START,''&APP_DTFMT_DATE.'')),',
'dr_data1 as ',
'(select unique ',
'        d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY_SHORT||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''&APP_DTFMT_DATE.'')||'')'' nm,',
'        pr.pr_id, PRD_DR_ID',
' from REHAB_PRESCRIPTORS prr, REHAB_PRESCRIPTIONS pr, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS, REHAB_DRUGS d',
'where pr.pr_prr_id=prr.prr_id ',
'  and PR_ID=(select c from (select column_value c, rownum rn from table(apex_string.split(:P601_DRUGS,'':''))) where rn=4)',
'  and PR_ID = PRATR_PR_ID and PRATR_ID = PRD_PRATR_ID and PRD_DR_ID = DR_ID',
'  and PR_PAT_ID=REHAB_CONTEXT_PKG.getPATIENT())',
'select',
unistr('  nm, dates.dd CONSUMED, 1 ACTUAL_DOSAGE, ''\0421\043F\043E\0436\0438\0442\043E: '' ||ACTUAL_DOSAGE||'' \043C\0433 \0432 ''|| to_char(CONSUMED,''Day &APP_DTFMT_DATE.'') ct'),
'from',
' dr_data1, ',
' dates,',
' (',
'   select du.dru_pr_id,du.DRU_DR_ID,',
'          trunc(DRU_CONSUMED,''dd'') CONSUMED, ',
'          sum(DRU_ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from REHAB_DRUG_USES du, dr_data1 d',
'  where du.DRU_ACTUAL_DOSAGE is not null',
'    and du.dru_pat_id = REHAB_CONTEXT_PKG.getPATIENT() ',
'    and du.dru_pr_id = d.pr_id',
'    and du.DRU_DR_ID = PRD_DR_ID',
'    and trunc(DRU_CONSUMED,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'    group by du.dru_pr_id, du.DRU_DR_ID, trunc(DRU_CONSUMED,''dd'')',
'    ) duu',
'where duu.CONSUMED(+)=dates.dd and dr_data1.pr_id = duu.dru_pr_id and dr_data1.PRD_DR_ID = DRU_DR_ID',
'order by CONSUMED'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_items_short_desc_column_name=>'CT'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78130179390343385)
,p_chart_id=>wwv_flow_imp.id(78126057087343374)
,p_static_id=>'drug-5'
,p_seq=>50
,p_name=>'Drug 5'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P601_START,''&APP_DTFMT_DATE.'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P601_END,''&APP_DTFMT_DATE.'') - to_date(:P601_START,''&APP_DTFMT_DATE.'')),',
'dr_data1 as ',
'(select unique ',
'        d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY_SHORT||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''&APP_DTFMT_DATE.'')||'')'' nm,',
'        pr.pr_id, PRD_DR_ID',
' from REHAB_PRESCRIPTORS prr, REHAB_PRESCRIPTIONS pr, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS, REHAB_DRUGS d',
'where pr.pr_prr_id=prr.prr_id ',
'  and PR_ID=(select c from (select column_value c, rownum rn from table(apex_string.split(:P601_DRUGS,'':''))) where rn=5)',
'  and PR_ID = PRATR_PR_ID and PRATR_ID = PRD_PRATR_ID and PRD_DR_ID = DR_ID',
'  and PR_PAT_ID=REHAB_CONTEXT_PKG.getPATIENT())',
'select',
unistr('  nm, dates.dd CONSUMED, 1 ACTUAL_DOSAGE, ''\0421\043F\043E\0436\0438\0442\043E: '' ||ACTUAL_DOSAGE||'' \043C\0433 \0432 ''|| to_char(CONSUMED,''Day &APP_DTFMT_DATE.'') ct'),
'from',
' dr_data1, ',
' dates,',
' (',
'   select du.dru_pr_id,du.DRU_DR_ID,',
'          trunc(DRU_CONSUMED,''dd'') CONSUMED, ',
'          sum(DRU_ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from REHAB_DRUG_USES du, dr_data1 d',
'  where du.DRU_ACTUAL_DOSAGE is not null',
'    and du.dru_pat_id = REHAB_CONTEXT_PKG.getPATIENT() ',
'    and du.dru_pr_id = d.pr_id',
'    and du.DRU_DR_ID = PRD_DR_ID',
'    and trunc(DRU_CONSUMED,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'    group by du.dru_pr_id, du.DRU_DR_ID, trunc(DRU_CONSUMED,''dd'')',
'    ) duu',
'where duu.CONSUMED(+)=dates.dd and dr_data1.pr_id = duu.dru_pr_id and dr_data1.PRD_DR_ID = DRU_DR_ID',
'order by CONSUMED'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_items_short_desc_column_name=>'CT'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78130793063343387)
,p_chart_id=>wwv_flow_imp.id(78126057087343374)
,p_static_id=>'drug-6'
,p_seq=>60
,p_name=>'Drug 6'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P601_START,''&APP_DTFMT_DATE.'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P601_END,''&APP_DTFMT_DATE.'') - to_date(:P601_START,''&APP_DTFMT_DATE.'')),',
'dr_data1 as ',
'(select unique ',
'        d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY_SHORT||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''&APP_DTFMT_DATE.'')||'')'' nm,',
'        pr.pr_id, PRD_DR_ID',
' from REHAB_PRESCRIPTORS prr, REHAB_PRESCRIPTIONS pr, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS, REHAB_DRUGS d',
'where pr.pr_prr_id=prr.prr_id ',
'  and PR_ID=(select c from (select column_value c, rownum rn from table(apex_string.split(:P601_DRUGS,'':''))) where rn=6)',
'  and PR_ID = PRATR_PR_ID and PRATR_ID = PRD_PRATR_ID and PRD_DR_ID = DR_ID',
'  and PR_PAT_ID=REHAB_CONTEXT_PKG.getPATIENT())',
'select',
unistr('  nm, dates.dd CONSUMED, 1 ACTUAL_DOSAGE, ''\0421\043F\043E\0436\0438\0442\043E: '' ||ACTUAL_DOSAGE||'' \043C\0433 \0432 ''|| to_char(CONSUMED,''Day &APP_DTFMT_DATE.'') ct'),
'from',
' dr_data1, ',
' dates,',
' (',
'   select du.dru_pr_id,du.DRU_DR_ID,',
'          trunc(DRU_CONSUMED,''dd'') CONSUMED, ',
'          sum(DRU_ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from REHAB_DRUG_USES du, dr_data1 d',
'  where du.DRU_ACTUAL_DOSAGE is not null',
'    and du.dru_pat_id = REHAB_CONTEXT_PKG.getPATIENT() ',
'    and du.dru_pr_id = d.pr_id',
'    and du.DRU_DR_ID = PRD_DR_ID',
'    and trunc(DRU_CONSUMED,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'    group by du.dru_pr_id, du.DRU_DR_ID, trunc(DRU_CONSUMED,''dd'')',
'    ) duu',
'where duu.CONSUMED(+)=dates.dd and dr_data1.pr_id = duu.dru_pr_id and dr_data1.PRD_DR_ID = DRU_DR_ID',
'order by CONSUMED'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_items_short_desc_column_name=>'CT'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78131377804343389)
,p_chart_id=>wwv_flow_imp.id(78126057087343374)
,p_static_id=>'drug-7'
,p_seq=>70
,p_name=>'Drug 7'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P601_START,''&APP_DTFMT_DATE.'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P601_END,''&APP_DTFMT_DATE.'') - to_date(:P601_START,''&APP_DTFMT_DATE.'')),',
'dr_data1 as ',
'(select unique ',
'        d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY_SHORT||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''&APP_DTFMT_DATE.'')||'')'' nm,',
'        pr.pr_id, PRD_DR_ID',
' from REHAB_PRESCRIPTORS prr, REHAB_PRESCRIPTIONS pr, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS, REHAB_DRUGS d',
'where pr.pr_prr_id=prr.prr_id ',
'  and PR_ID=(select c from (select column_value c, rownum rn from table(apex_string.split(:P601_DRUGS,'':''))) where rn=7)',
'  and PR_ID = PRATR_PR_ID and PRATR_ID = PRD_PRATR_ID and PRD_DR_ID = DR_ID',
'  and PR_PAT_ID=REHAB_CONTEXT_PKG.getPATIENT())',
'select',
unistr('  nm, dates.dd CONSUMED, 1 ACTUAL_DOSAGE, ''\0421\043F\043E\0436\0438\0442\043E: '' ||ACTUAL_DOSAGE||'' \043C\0433 \0432 ''|| to_char(CONSUMED,''Day &APP_DTFMT_DATE.'') ct'),
'from',
' dr_data1, ',
' dates,',
' (',
'   select du.dru_pr_id,du.DRU_DR_ID,',
'          trunc(DRU_CONSUMED,''dd'') CONSUMED, ',
'          sum(DRU_ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from REHAB_DRUG_USES du, dr_data1 d',
'  where du.DRU_ACTUAL_DOSAGE is not null',
'    and du.dru_pat_id = REHAB_CONTEXT_PKG.getPATIENT() ',
'    and du.dru_pr_id = d.pr_id',
'    and du.DRU_DR_ID = PRD_DR_ID',
'    and trunc(DRU_CONSUMED,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'    group by du.dru_pr_id, du.DRU_DR_ID, trunc(DRU_CONSUMED,''dd'')',
'    ) duu',
'where duu.CONSUMED(+)=dates.dd and dr_data1.pr_id = duu.dru_pr_id and dr_data1.PRD_DR_ID = DRU_DR_ID',
'order by CONSUMED'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_items_short_desc_column_name=>'CT'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78131992109343391)
,p_chart_id=>wwv_flow_imp.id(78126057087343374)
,p_static_id=>'drug-8'
,p_seq=>80
,p_name=>'Drug 8'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P601_START,''&APP_DTFMT_DATE.'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P601_END,''&APP_DTFMT_DATE.'') - to_date(:P601_START,''&APP_DTFMT_DATE.'')),',
'dr_data1 as ',
'(select unique ',
'        d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY_SHORT||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''&APP_DTFMT_DATE.'')||'')'' nm,',
'        pr.pr_id, PRD_DR_ID',
' from REHAB_PRESCRIPTORS prr, REHAB_PRESCRIPTIONS pr, REHAB_PRESCRIPTIONS_ACTIVITY_TIME_RANGES, REHAB_PRESCRIPTIONS_DETAILS, REHAB_DRUGS d',
'where pr.pr_prr_id=prr.prr_id ',
'  and PR_ID=(select c from (select column_value c, rownum rn from table(apex_string.split(:P601_DRUGS,'':''))) where rn=8)',
'  and PR_ID = PRATR_PR_ID and PRATR_ID = PRD_PRATR_ID and PRD_DR_ID = DR_ID',
'  and PR_PAT_ID=REHAB_CONTEXT_PKG.getPATIENT())',
'select',
unistr('  nm, dates.dd CONSUMED, 1 ACTUAL_DOSAGE, ''\0421\043F\043E\0436\0438\0442\043E: '' ||ACTUAL_DOSAGE||'' \043C\0433 \0432 ''|| to_char(CONSUMED,''Day &APP_DTFMT_DATE.'') ct'),
'from',
' dr_data1, ',
' dates,',
' (',
'   select du.dru_pr_id,du.DRU_DR_ID,',
'          trunc(DRU_CONSUMED,''dd'') CONSUMED, ',
'          sum(DRU_ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from REHAB_DRUG_USES du, dr_data1 d',
'  where du.DRU_ACTUAL_DOSAGE is not null',
'    and du.dru_pat_id = REHAB_CONTEXT_PKG.getPATIENT() ',
'    and du.dru_pr_id = d.pr_id',
'    and du.DRU_DR_ID = PRD_DR_ID',
'    and trunc(DRU_CONSUMED,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'    group by du.dru_pr_id, du.DRU_DR_ID, trunc(DRU_CONSUMED,''dd'')',
'    ) duu',
'where duu.CONSUMED(+)=dates.dd and dr_data1.pr_id = duu.dru_pr_id and dr_data1.PRD_DR_ID = DRU_DR_ID',
'order by CONSUMED'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_items_short_desc_column_name=>'CT'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(78126588954343375)
,p_chart_id=>wwv_flow_imp.id(78126057087343374)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(78127160859343377)
,p_chart_id=>wwv_flow_imp.id(78126057087343374)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('\0421\043F\043E\0436\0438\0442\043E')
,p_format_type=>'decimal'
,p_decimal_places=>2
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(327135027595011509)
,p_plug_name=>'Measurements'
,p_static_id=>'measurements'
,p_title=>unistr('\0412\0438\043C\0456\0440\0438')
,p_parent_plug_id=>wwv_flow_imp.id(327164601201296661)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'N'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P601_CHARTS2SHOW like ''%MEA%'''
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(78119629703343356)
,p_region_id=>wwv_flow_imp.id(327135027595011509)
,p_chart_type=>'boxPlot'
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_time_axis_type=>'enabled'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78121305807343361)
,p_chart_id=>wwv_flow_imp.id(78119629703343356)
,p_static_id=>'dia-avg'
,p_seq=>70
,p_name=>'Dia Avg'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A Dia \0441\0435\0440\0435\0434\043D\0456\0439'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       MT_PRESSURE_DIA',
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_DIA is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'--and pressure_lr=''R''',
'order by MT_TAKEN'))
,p_series_type=>'boxPlot'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_DIA'
,p_items_label_column_name=>'MT_TAKEN'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_MEASUR like ''%DIA-A%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78121959273343362)
,p_chart_id=>wwv_flow_imp.id(78119629703343356)
,p_static_id=>'dia-left'
,p_seq=>50
,p_name=>'Dia Left'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A Dia \043B\0456\0432\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       MT_PRESSURE_DIA',
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_DIA is not null and',
'MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'and MT_PRESSURE_LR=''L''',
'order by MT_TAKEN'))
,p_series_type=>'boxPlot'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_DIA'
,p_items_label_column_name=>'MT_TAKEN'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_MEASUR like ''%DIA#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78122519497343364)
,p_chart_id=>wwv_flow_imp.id(78119629703343356)
,p_static_id=>'dia-right'
,p_seq=>60
,p_name=>'Dia Right'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A Dia \043F\0440\0430\0432\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       MT_PRESSURE_DIA',
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_DIA is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'and MT_PRESSURE_LR=''R''',
'order by MT_TAKEN'))
,p_series_type=>'boxPlot'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_DIA'
,p_items_label_column_name=>'MT_TAKEN'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_MEASUR like ''%DIA#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78123161240343366)
,p_chart_id=>wwv_flow_imp.id(78119629703343356)
,p_static_id=>'pulse'
,p_seq=>10
,p_name=>'Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041F\0443\043B\044C\0441'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       MT_PULSE',
' from REHAB_MEASUREMENTS',
'where MT_PULSE is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'order by MT_TAKEN'))
,p_series_type=>'boxPlot'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PULSE'
,p_items_label_column_name=>'MT_TAKEN'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_MEASUR like ''%PULSE%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78123743869343367)
,p_chart_id=>wwv_flow_imp.id(78119629703343356)
,p_static_id=>'syst-avg'
,p_seq=>40
,p_name=>'Syst Avg'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A SYS \0441\0435\0440\0435\0434\043D\0456\0439'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       MT_PRESSURE_SYS',
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_SYS is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'--and pressure_lr=''R''',
'order by MT_TAKEN'))
,p_series_type=>'boxPlot'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_SYS'
,p_items_label_column_name=>'MT_TAKEN'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_MEASUR like ''%SYST-A%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78124397672343369)
,p_chart_id=>wwv_flow_imp.id(78119629703343356)
,p_static_id=>'syst-left'
,p_seq=>20
,p_name=>'Syst Left'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A SYS \043B\0456\0432\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       MT_PRESSURE_SYS',
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_SYS is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'and MT_PRESSURE_LR=''L''',
'order by MT_TAKEN'))
,p_series_type=>'boxPlot'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_SYS'
,p_items_label_column_name=>'MT_TAKEN'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_MEASUR like ''%SYST#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78124959899343371)
,p_chart_id=>wwv_flow_imp.id(78119629703343356)
,p_static_id=>'syst-right'
,p_seq=>30
,p_name=>'Syst Right'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A SYS \043F\0440\0430\0432\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       MT_PRESSURE_SYS',
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_SYS is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'and MT_PRESSURE_LR=''R''',
'order by MT_TAKEN'))
,p_series_type=>'boxPlot'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_SYS'
,p_items_label_column_name=>'MT_TAKEN'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_MEASUR like ''%SYST#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(78120173270343358)
,p_chart_id=>wwv_flow_imp.id(78119629703343356)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(78120750976343359)
,p_chart_id=>wwv_flow_imp.id(78119629703343356)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('\0412\0438\043C\0456\0440\0438')
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(323518396164394284)
,p_plug_name=>'Parameters'
,p_static_id=>'parameters'
,p_title=>unistr('\0424\0456\043B\044C\0442\0440\0438')
,p_parent_plug_id=>wwv_flow_imp.id(327164432575296660)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(327164432575296660)
,p_plug_name=>'Selector'
,p_static_id=>'selector'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(323520313188394303)
,p_plug_name=>'Trainings Steps'
,p_static_id=>'trainings'
,p_parent_plug_id=>wwv_flow_imp.id(327164601201296661)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P601_CHARTS2SHOW like ''%TRA%'''
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(78113803738343340)
,p_region_id=>wwv_flow_imp.id(323520313188394303)
,p_chart_type=>'line'
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'N'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_time_axis_type=>'enabled'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78117369138343350)
,p_chart_id=>wwv_flow_imp.id(78113803738343340)
,p_static_id=>'totsteps'
,p_seq=>30
,p_name=>'TotSteps'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041A\0440\043E\043A\0438 \0437\0430 \0434\043E\0431\0443'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       sum(WL_STEPS) WL_STEPS,',
unistr('       ''\041A\0440\043E\043A\0438 \0437\0430 \0434\043E\0431\0443: '' ||round(sum(WL_STEPS))||'' ''|| to_char(trunc(WL_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_WATCH_LOGS',
'where WL_STEPS is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_STEPS'
,p_items_label_column_name=>'WL_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_TRAININGS like ''%TOTST%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78118523584343353)
,p_chart_id=>wwv_flow_imp.id(78113803738343340)
,p_static_id=>'training-steps'
,p_seq=>40
,p_name=>'Training Steps'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0440\0435\043D\0443\0432\0430\043B\044C\043D\0456 \043A\0440\043E\043A\0438'' nm,'),
'       trunc(TR_START,''dd'') TR_START, ',
'       sum(TR_STEPS) TR_STEPS,',
unistr('       ''\0422\0440\0435\043D\0443\0432\0430\043B\044C\043D\0456 \043A\0440\043E\043A\0438: '' ||round(sum(TR_STEPS))||'' ''|| to_char(trunc(TR_START,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_TRAININGS',
'where TR_STEPS is not null and TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(TR_START,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'TR_STEPS'
,p_items_label_column_name=>'TR_START'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_TRAININGS like ''%TRST%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(78114303521343341)
,p_chart_id=>wwv_flow_imp.id(78113803738343340)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(78114917925343343)
,p_chart_id=>wwv_flow_imp.id(78113803738343340)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('\0422\0440\0435\043D\0443\0432\0430\043B\044C\043D\0456 \043A\0440\043E\043A\0438')
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(77068687921873148)
,p_plug_name=>'Trainings Distance'
,p_static_id=>'trainings-distance'
,p_parent_plug_id=>wwv_flow_imp.id(327164601201296661)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P601_CHARTS2SHOW like ''%TRA%'''
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(77068721404873149)
,p_region_id=>wwv_flow_imp.id(77068687921873148)
,p_chart_type=>'line'
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'N'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_time_axis_type=>'enabled'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78155813115597712)
,p_chart_id=>wwv_flow_imp.id(77068721404873149)
,p_static_id=>'oxigenation'
,p_seq=>110
,p_name=>'Oxigenation'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041A\0438\0441\0435\043D\044C'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_OXIGENATION) MT_OXIGENATION,',
unistr('       ''\041A\0438\0441\0435\043D\044C: '' ||round(avg(MT_OXIGENATION),3)||'' ''|| to_char(trunc(MT_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_MEASUREMENTS',
'where MT_OXIGENATION is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_OXIGENATION'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_TRAININGS like ''%OXI%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78155788087597711)
,p_chart_id=>wwv_flow_imp.id(77068721404873149)
,p_static_id=>'sugar'
,p_seq=>100
,p_name=>'Sugar'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0426\0443\043A\043E\0440'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_SUGAR) MT_SUGAR,',
unistr('       ''\0426\0443\043A\043E\0440: '' ||round(avg(MT_SUGAR),3)||'' ''|| to_char(trunc(MT_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_MEASUREMENTS',
'where MT_SUGAR is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_SUGAR'
,p_items_label_column_name=>'MT_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_TRAININGS like ''%SUG%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78155663165597710)
,p_chart_id=>wwv_flow_imp.id(77068721404873149)
,p_static_id=>'temperature'
,p_seq=>90
,p_name=>'Temperature'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0435\043C\043F\0435\0440\0430\0442\0443\0440\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_TEMPERATURE) MT_TEMPERATURE,',
unistr('       ''\0422\0435\043C\043F\0435\0440\0430\0442\0443\0440\0430: '' ||round(avg(MT_TEMPERATURE),3)||'' ''|| to_char(trunc(MT_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_MEASUREMENTS',
'where MT_TEMPERATURE is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_TEMPERATURE'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_TRAININGS like ''%TEMP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78154806452597702)
,p_chart_id=>wwv_flow_imp.id(77068721404873149)
,p_static_id=>'training-distance'
,p_seq=>30
,p_name=>'Training Distance 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0414\0438\0441\0442\0430\043D\0446\0456\044F \043F\043E \0434\0435\0432\0430\0439\0441\0443 1, \043A\043C'' nm,'),
'       trunc(TR_START,''dd'') TR_START, ',
'       sum(TR_DISTANCE_LENGTH) TR_DISTANCE_LENGTH,',
unistr('       ''\0414\0438\0441\0442\0430\043D\0446\0456\044F \043F\043E \0434\0435\0432\0430\0439\0441\0443 1, \043A\043C: '' ||round(sum(TR_DISTANCE_LENGTH),3)||'' ''|| to_char(trunc(TR_START,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_TRAININGS',
'where TR_DISTANCE_LENGTH is not null and TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(TR_START,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'TR_DISTANCE_LENGTH'
,p_items_label_column_name=>'TR_START'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_TRAININGS like ''%DIST1%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78155449536597708)
,p_chart_id=>wwv_flow_imp.id(77068721404873149)
,p_static_id=>'training-distance-2'
,p_seq=>40
,p_name=>'Training Distance 2'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0414\0438\0441\0442\0430\043D\0446\0456\044F \043F\043E \0434\0435\0432\0430\0439\0441\0443 2, \043A\043C'' nm,'),
'       trunc(TR_START,''dd'') TR_START, ',
'       sum(TR_DEV2_DISTANCE) TR_DEV2_DISTANCE,',
unistr('       ''\0414\0438\0441\0442\0430\043D\0446\0456\044F \043F\043E \0434\0435\0432\0430\0439\0441\0443 2, \043A\043C: '' ||round(sum(TR_DEV2_DISTANCE),3)||'' ''|| to_char(trunc(TR_START,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_TRAININGS',
'where TR_DEV2_DISTANCE is not null and TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(TR_START,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'TR_DEV2_DISTANCE'
,p_items_label_column_name=>'TR_START'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_TRAININGS like ''%DIST2%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78155962741597713)
,p_chart_id=>wwv_flow_imp.id(77068721404873149)
,p_static_id=>'training-real-distance'
,p_seq=>50
,p_name=>'Training Real Distance'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0420\0435\0430\043B\044C\043D\0430 \0434\0438\0441\0442\0430\043D\0446\0456\044F, \043A\043C'' nm,'),
'       trunc(TR_START,''dd'') TR_START, ',
'       sum(TR_REAL_DISTANCE) TR_REAL_DISTANCE,',
unistr('       ''\0420\0435\0430\043B\044C\043D\0430 \0434\0438\0441\0442\0430\043D\0446\0456\044F, \043A\043C: '' ||round(sum(TR_REAL_DISTANCE),3)||'' ''|| to_char(trunc(TR_START,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_TRAININGS',
'where TR_REAL_DISTANCE is not null and TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(TR_START,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'TR_REAL_DISTANCE'
,p_items_label_column_name=>'TR_START'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_TRAININGS like ''%RDIST%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78156155583597715)
,p_chart_id=>wwv_flow_imp.id(77068721404873149)
,p_static_id=>'training-real-speed'
,p_seq=>70
,p_name=>'Training Real Speed'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0420\0435\0430\043B\044C\043D\0430 \0448\0432\0438\0434\043A\0456\0441\0442\044C, \043A\043C/\0433\043E\0434'' nm,'),
'       trunc(TR_START,''dd'') TR_START, ',
'       avg(TR_REAL_SPEED) TR_REAL_SPEED,',
unistr('       ''\0420\0435\0430\043B\044C\043D\0430 \0448\0432\0438\0434\043A\0456\0441\0442\044C, \043A\043C/\0433\043E\0434: '' ||round(avg(TR_REAL_SPEED),3)||'' ''|| to_char(trunc(TR_START,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_TRAININGS',
'where TR_REAL_SPEED is not null and TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(TR_START,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'TR_REAL_SPEED'
,p_items_label_column_name=>'TR_START'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_TRAININGS like ''%RSPE%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78156070952597714)
,p_chart_id=>wwv_flow_imp.id(77068721404873149)
,p_static_id=>'training-step-legnth'
,p_seq=>60
,p_name=>'Training Step Legnth'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0420\0435\0430\043B\044C\043D\0430 \0434\043E\0432\0436\0438\043D\0430 \043A\0440\043E\043A\0443, \043C'' nm,'),
'       trunc(TR_START,''dd'') TR_START, ',
'       avg(TR_REAL_STEP_LENGTH) TR_REAL_STEP_LENGTH,',
unistr('       ''\0420\0435\0430\043B\044C\043D\0430 \0434\043E\0432\0436\0438\043D\0430 \043A\0440\043E\043A\0443, \043C: '' ||round(avg(TR_REAL_STEP_LENGTH),3)||'' ''|| to_char(trunc(TR_START,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_TRAININGS',
'where TR_REAL_STEP_LENGTH is not null and TR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(TR_START,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'TR_REAL_STEP_LENGTH'
,p_items_label_column_name=>'TR_START'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_TRAININGS like ''%STLE%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(78155584490597709)
,p_chart_id=>wwv_flow_imp.id(77068721404873149)
,p_static_id=>'weight'
,p_seq=>80
,p_name=>'Weight'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0412\0430\0433\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_WEIGHT) MT_WEIGHT,',
unistr('       ''\0412\0430\0433\0430: '' ||round(avg(MT_WEIGHT),3)||'' ''|| to_char(trunc(MT_TAKEN,''dd''),''Day &APP_DTFMT_DATE.'') ct'),
' from REHAB_MEASUREMENTS',
'where MT_WEIGHT is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P601_START,''&APP_DTFMT_DATE.'') and to_date(:P601_END,''&APP_DTFMT_DATE.'')',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_WEIGHT'
,p_items_label_column_name=>'MT_TAKEN'
,p_items_short_desc_column_name=>'CT'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P601_TRAININGS like ''%WEI%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(78155208883597706)
,p_chart_id=>wwv_flow_imp.id(77068721404873149)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(78155311334597707)
,p_chart_id=>wwv_flow_imp.id(77068721404873149)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('\0422\0440\0435\043D\0443\0432\0430\043D\043D\044F')
,p_format_type=>'decimal'
,p_decimal_places=>3
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(78096131891343270)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(323518396164394284)
,p_button_name=>'Del'
,p_static_id=>'del'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--gapTop'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0412\0438\0434\0430\043B\0438\0442\0438')
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(78096517344343275)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(323518396164394284)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--gapTop'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>unistr('\0417\0431\0435\0440\0456\0433\0442\0438')
,p_icon_css_classes=>'fa-file-check'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(78096993088343276)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(323518396164394284)
,p_button_name=>'Set'
,p_static_id=>'set'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--gapTop'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>'Set'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(327171726098296815)
,p_name=>'P601_AVGMEASUR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(323518396164394284)
,p_item_default=>'PULSE:SYST-A:DIA-A'
,p_prompt=>unistr('\0421\0435\0440\0435\0434\043D\0456 \0437\043D\0430\0447\0435\043D\043D\044F (\0446\0456\043B\0456)')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>unistr('STATIC2:\041F\0443\043B\044C\0441;PULSE,\0422\0438\0441\043A SYS;SYST#,\0422\0438\0441\043A DIA;DIA#,\0422\0438\0441\043A SYS \0441\0435\0440\0435\0434\043D\0456\0439;SYST-A,\0422\0438\0441\043A DIA \0441\0435\0440\0435\0434\043D\0456\0439;DIA-A,\041F\0443\043B\044C\0441 \043D\0456\0447\043D\0438\0439 \043C\0456\043D\0456\043C\0443\043C;NMIP,\041F\0443\043B\044C\0441 \043D\0456\0447\043D\0438\0439  \043C\0430\043A\0441\0456\043C\0443\043C;NMAP,\041F\0443\043B\044C\0441 \043D\0456\0447\043D\0438\0439  \0441\0435\0440\0435\0434\043D\0456\0439 ;NAVP,\0421\0435\0440\0435\0434\043D\0456\0439 \043F\0443\043B\044C\0441 \0441\043F\043E\043A\043E\044E;CAVP,\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441;TMIP,\041C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438')
||unistr('\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441;TMAP,\0421\0435\0440\0435\0434\043D\0456\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441;TAP,\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \0442\0440\0435\043D\0443\0432\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441;TRMIP,\041C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439 \0442\0440\0435\043D\0443\0432\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441;TRMAP,\0421\0435\0440\0435\0434\043D\0456\0439 \0442\0440\0435\043D\0443\0432\0430\043B\044C\043D\0438\0439 \043F\0443\043B\044C\0441;TRAVP')
,p_cSize=>30
,p_display_when=>':P601_CHARTS2SHOW like ''%AVGM%'''
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(327171251096296811)
,p_name=>'P601_CHARTS2SHOW'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(323518396164394284)
,p_item_default=>'MEA:AVGM:TRA'
,p_prompt=>unistr('\041F\043E\043A\0430\0437\0443\0432\0430\0442\0438 \0434\0456\0430\0433\0440\0430\043C\0438')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>unistr('STATIC2:\0412\0438\043C\0456\0440\0438;MEA,\0421\0435\0440\0435\0434\043D\0456 \0432\0438\043C\0456\0440\0438;AVGM,\0422\0440\0435\043D\0443\0432\0430\043D\043D\044F;TRA,\041F\0440\0438\0439\043E\043C \043B\0456\043A\0456\0432;DRU')
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '4')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(327171423508296812)
,p_name=>'P601_DRUGS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(323518396164394284)
,p_prompt=>unistr('\041F\0440\0438\0439\043E\043C \043C\0435\0434\0438\043A\0430\043C\0435\043D\0442\0456\0432')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    WS_NAME|| '' - '' ||',
'    p.PRR_PRESCRIPTED_BY_SHORT||'' (''||to_char(p.PRR_PRESCRIPTED_WHEN,''YYYY-MON-DD'')||'')'' d, ',
'    pr.pr_id r',
'from REHAB_PRESCRIPTIONS pr, REHAB_PRESCRIPTORS p, REHAB_WORKING_SUBSTANCE',
'where pr.PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'and WS_ID = pr.PR_WS_ID and pr.PR_WS_ID is not null',
'and pr.PR_PRR_ID=p.PRR_ID',
'union all',
'select',
'    d.DR_NAME||''(''||DR_TYPE_SHORT||'') - '' ||',
'    p.PRR_PRESCRIPTED_BY_SHORT||'' (''||to_char(p.PRR_PRESCRIPTED_WHEN,''YYYY-MON-DD'')||'')'' d, ',
'    pr.pr_id r',
'from REHAB_PRESCRIPTIONS pr, REHAB_DRUGS d, REHAB_PRESCRIPTORS p',
'where pr.PR_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT() ',
'and d.DR_ID=pr.PR_DR_ID and pr.PR_DR_ID is not null',
'and pr.PR_PRR_ID=p.PRR_ID',
'order by 1'))
,p_cSize=>30
,p_display_when=>':P601_CHARTS2SHOW like ''%DRU%'''
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323524623535394429)
,p_name=>'P601_END'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(323518396164394284)
,p_prompt=>unistr('\0417\0430\0432\0435\0440\0448\0435\043D\043D\044F \043F\0435\0440\0456\043E\0434\0443')
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(327171577518296814)
,p_name=>'P601_MEASUR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(323518396164394284)
,p_item_default=>'PULSE:SYST-A:DIA-A'
,p_prompt=>unistr('\0412\0438\043C\0456\0440\044E\0432\0430\043D\043D\044F (box plot)')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>unistr('STATIC:\041F\0443\043B\044C\0441;PULSE,\0422\0438\0441\043A SYS;SYST#,\0422\0438\0441\043A DIA;DIA#,\0421\0435\0440\0435\0434\043D\0456\0439 \0442\0438\0441\043A SYS;SYST-A,\0421\0435\0440\0435\0440\0434\043D\0456\0439 \0442\0438\0441\043A  DIA;DIA-A')
,p_cSize=>30
,p_display_when=>':P601_CHARTS2SHOW like ''%MEA%'''
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(356344585453083319)
,p_name=>'P601_NEW_VIEW'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(323518396164394284)
,p_prompt=>unistr('\041D\043E\0432\0438\0439 \0437\0432\0456\0442')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323524476224394428)
,p_name=>'P601_START'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(323518396164394284)
,p_prompt=>unistr('\041F\043E\0447\0430\0442\043E\043A \043F\0435\0440\0456\043E\0434\0443')
,p_format_mask=>'&APP_DTFMT_DATE.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(356344522840083318)
,p_name=>'P601_STORAGE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(323518396164394284)
,p_prompt=>unistr('\0417\0431\0435\0440\0435\0436\0435\043D\0438\0439 \0437\0432\0456\0442')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'APP_STATE_STORAGE_LIST'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(327171772976296816)
,p_name=>'P601_TRAININGS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(323518396164394284)
,p_item_default=>'PLSAVG:PLSMAX:PLSMIN'
,p_prompt=>unistr('\0421\0435\0440\0435\0434\043D\0456 \0437\043D\0430\0447\0435\043D\043D\044F (\0434\0440\043E\0431\0456)')
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>unistr('STATIC2:\041A\0440\043E\043A\0438 \0437\0430 \0434\043E\0431\0443;TOTST,\0422\0440\0435\043D\0443\0432\0430\043B\044C\043D\0456 \043A\0440\043E\0438;TRST,\0414\0438\0441\0442\0430\043D\0446\0456\044F \043F\043E \0434\0435\0432\0430\0439\0441\0443 1;DIST1,\0414\0438\0441\0442\0430\043D\0446\0456\044F \043F\043E \0434\0435\0432\0430\0439\0441\0443 2;DIST2,\0420\0435\0430\043B\044C\043D\0430 \0434\0438\0441\0442\0430\043D\0446\0456\044F;RDIST,\0420\0435\0430\043B\044C\043D\0430 \0448\0432\0438\0434\043A\0456\0441\0442\044C;RSPE,\0414\043E\0432\0436\0438\043D\0430 \043A\0440\043E\043A\0443;STLE,\0412\0430\0433\0430;WEI,\0422\0435\043C\043F\0435\0440\0430\0442\0443\0440\0430;TEMP,\0426\0443\043A\043E\0440;SUG,\041A\0438\0441\0435\043D\044C;OXI')
,p_cSize=>30
,p_display_when=>':P601_CHARTS2SHOW like ''%TRA%'''
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78134057758343448)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DelState'
,p_static_id=>'delstate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_APPSTATE.delete_storage(:P601_STORAGE);',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(78096131891343270)
,p_internal_uid=>78134057758343448
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78133292743343443)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Init'
,p_static_id=>'init'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P601_STORAGE is null then ',
'    REHAB_APPSTATE.extract_jparams (',
'        P_APP_USER => v(''APP_USER''),',
'        P_APP_PAGE => v(''APP_PAGE_ID''));  ',
'    :P601_STORAGE := REHAB_APPSTATE.curr_storage_id; ',
'  else',
'    REHAB_APPSTATE.extract_jparams (',
'        p_storage_id => :P601_STORAGE,',
'        P_APP_USER => v(''APP_USER''),',
'        P_APP_PAGE => v(''APP_PAGE_ID''));  ',
'  end if;',
'',
'  --raise_application_error(-20000,''u: ''||v(''APP_USER'')||''; p: ''||v(''APP_PAGE_ID''));',
'  :P601_AVGMEASUR := REHAB_APPSTATE.get_jparam(''P601_AVGMEASUR'',null);',
'  :P601_CHARTS2SHOW := REHAB_APPSTATE.get_jparam(''P601_CHARTS2SHOW'',null);',
'  :P601_DRUGS := REHAB_APPSTATE.get_jparam(''P601_DRUGS'',null);',
'  --:P601_START := COREMOD_APPSTATE.get_jparam(''P601_START'',null);',
'  --:P601_END := COREMOD_APPSTATE.get_jparam(''P601_END'',null);',
'  :P601_MEASUR := REHAB_APPSTATE.get_jparam(''P601_MEASUR'',null);',
'  :P601_TRAININGS := REHAB_APPSTATE.get_jparam(''P601_TRAININGS'',null);',
'',
'  if :P601_START is null then :P601_START := to_char(sysdate-10,''YYYY-MON-DD''); end if;',
'  if :P601_END is null then :P601_END := to_char(sysdate+1,''YYYY-MON-DD''); end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>78133292743343443
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(78133646987343446)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SaveState'
,p_static_id=>'savestate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P601_STORAGE is null then ',
'    REHAB_APPSTATE.extract_jparams (',
'        P_APP_USER => v(''APP_USER''),',
'        P_APP_PAGE => v(''APP_PAGE_ID''));  ',
'    :P601_STORAGE := REHAB_APPSTATE.curr_storage_id; ',
'  else',
'    REHAB_APPSTATE.extract_jparams (',
'        p_storage_id => :P601_STORAGE,',
'        P_APP_USER => v(''APP_USER''),',
'        P_APP_PAGE => v(''APP_PAGE_ID''));  ',
'  end if;',
'   REHAB_APPSTATE.set_jparam(''P601_AVGMEASUR'',:P601_AVGMEASUR);',
'   REHAB_APPSTATE.set_jparam(''P601_CHARTS2SHOW'',:P601_CHARTS2SHOW);',
'   REHAB_APPSTATE.set_jparam(''P601_DRUGS'',:P601_DRUGS);',
'   --COREMOD_APPSTATE.set_jparam(''P601_START'',:P601_START);',
'   --COREMOD_APPSTATE.set_jparam(''P601_END'',:P601_END);',
'   REHAB_APPSTATE.set_jparam(''P601_MEASUR'',:P601_MEASUR);',
'   REHAB_APPSTATE.set_jparam(''P601_TRAININGS'',:P601_TRAININGS);',
'   REHAB_APPSTATE.store_jparams(:P601_NEW_VIEW);',
'   :P601_NEW_VIEW := null;',
'   :P601_STORAGE := REHAB_APPSTATE.curr_storage_id;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(78096517344343275)
,p_internal_uid=>78133646987343446
);
wwv_flow_imp.component_end;
end;
/
