prompt --application/pages/page_00032
begin
--   Manifest
--     PAGE: 00032
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
 p_id=>32
,p_name=>'Charts'
,p_alias=>'CHARTS'
,p_step_title=>'Charts'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(245424869275051121)
,p_plug_name=>'Avg Measurements'
,p_static_id=>'avg-measurements'
,p_parent_plug_id=>wwv_flow_imp.id(249070424960953491)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P32_CHARTS2SHOW like ''%AVGM%'''
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(77282017451875642)
,p_region_id=>wwv_flow_imp.id(245424869275051121)
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
 p_id=>wwv_flow_imp.id(77283770385875656)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'dia-avg'
,p_seq=>90
,p_name=>'Dia Avg'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A Dia \0441\0435\0440\0435\0440\0434\043D\0456\0439'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PRESSURE_DIA) MT_PRESSURE_DIA',
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_DIA is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'--and pressure_lr=''R''',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_DIA'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%DIA-A%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77284311968875660)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'dia-left'
,p_seq=>70
,p_name=>'Dia Left'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A Dia \043B\0456\0432\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PRESSURE_DIA) MT_PRESSURE_DIA',
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_DIA is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'and MT_PRESSURE_LR=''L''',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_DIA'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%DIA#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77284993315875662)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'dia-right'
,p_seq=>80
,p_name=>'Dia Right'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A Dia \043F\0440\0430\0432\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PRESSURE_DIA) MT_PRESSURE_DIA',
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_DIA is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'and MT_PRESSURE_LR=''R''',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_DIA'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%DIA#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77067845369873140)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'oxigenation'
,p_seq=>130
,p_name=>'Oxigenation'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0412\0430\0433\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_OXIGENATION) MT_OXIGENATION',
' from REHAB_MEASUREMENTS',
'where MT_OXIGENATION is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_OXIGENATION'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%OXI%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77285506509875664)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'pulse'
,p_seq=>30
,p_name=>'Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041F\0443\043B\044C\0441'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PULSE) MT_PULSE',
' from REHAB_MEASUREMENTS',
'where MT_PULSE is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PULSE'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%PULSE%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77067767235873139)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'sugar'
,p_seq=>120
,p_name=>'Sugar'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0412\0430\0433\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_SUGAR) MT_SUGAR',
' from REHAB_MEASUREMENTS',
'where MT_SUGAR is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_SUGAR'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%SUG%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77286171765875665)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'syst-avg'
,p_seq=>60
,p_name=>'Syst Avg'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A SYS \0441\0435\0440\0435\0440\0434\043D\0456\0439'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PRESSURE_SYS) MT_PRESSURE_SYS',
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_SYS is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'--and pressure_lr=''R''',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_SYS'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%SYST-A%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77286725377875667)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'syst-left'
,p_seq=>40
,p_name=>'Syst Left'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A SYS \043B\0456\0432\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PRESSURE_SYS) MT_PRESSURE_SYS',
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_SYS is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'and MT_PRESSURE_LR=''L''',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_SYS'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%SYST#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77287337889875668)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'syst-right'
,p_seq=>50
,p_name=>'Syst Right'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0422\0438\0441\043A SYS \043F\0440\0430\0432\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_PRESSURE_SYS) MT_PRESSURE_SYS',
' from REHAB_MEASUREMENTS',
'where MT_PRESSURE_SYS is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'and MT_PRESSURE_LR=''R''',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_PRESSURE_SYS'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%SYST#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77067675365873138)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'temperature'
,p_seq=>110
,p_name=>'Temperature'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0412\0430\0433\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_TEMPERATURE) MT_TEMPERATURE',
' from REHAB_MEASUREMENTS',
'where MT_TEMPERATURE is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_TEMPERATURE'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%TEMP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77068222353873144)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'tot-avg-pulse'
,p_seq=>200
,p_name=>'Tot Avg Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0421\0435\0440\0435\0434\043D\0456\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_TOTAL_AVG_PULSE) WL_TOTAL_AVG_PULSE',
' from REHAB_WATCH_LOGS',
'where WL_TOTAL_AVG_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_TOTAL_AVG_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%TAP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77068176437873143)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'tot-max-pulse'
,p_seq=>190
,p_name=>'Tot Max Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041C\0430\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_TOTAL_MAX_PULSE) WL_TOTAL_MAX_PULSE',
' from REHAB_WATCH_LOGS',
'where WL_TOTAL_MAX_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_TOTAL_MAX_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%TMIP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77068095915873142)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'tot-min-pulse'
,p_seq=>180
,p_name=>'Tot Min Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_TOTAL_MIN_PULSE) WL_TOTAL_MIN_PULSE',
' from REHAB_WATCH_LOGS',
'where WL_TOTAL_MIN_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_TOTAL_MIN_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%TMAP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77287917485875670)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'weight'
,p_seq=>100
,p_name=>'Weight'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0412\0430\0433\0430'' nm,'),
'       trunc(MT_TAKEN,''dd'') MT_TAKEN, ',
'       avg(MT_WEIGHT) MT_WEIGHT',
' from REHAB_MEASUREMENTS',
'where MT_WEIGHT is not null and MT_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(MT_TAKEN,''dd'')',
'order by MT_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'MT_WEIGHT'
,p_items_label_column_name=>'MT_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%WEI%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77067916421873141)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'wl-avg-calm'
,p_seq=>170
,p_name=>'Calm Avg pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\0421\0435\0440\0435\0434\043D\0456\0439 \043F\0443\043B\044C\0441 \0441\043F\043E\043A\043E\044E'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_CALM_AVG_PULSE) WL_CALM_AVG_PULSE',
' from REHAB_WATCH_LOGS',
'where WL_CALM_AVG_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_CALM_AVG_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%CAVP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77288572033875672)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'wl-avg-pulse'
,p_seq=>160
,p_name=>'Night Avg Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441 \0441\0435\0440\0435\0440\0434\043D\0456\0439'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_NIGHT_AVG_PULSE) WL_NIGHT_AVG_PULSE',
' from REHAB_WATCH_LOGS',
'where WL_NIGHT_AVG_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_NIGHT_AVG_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%NAVP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77289160102875673)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'wl-max-pulse'
,p_seq=>150
,p_name=>'Night Max Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441 \043C\0430\043A\0441\0438\043C\0443\043C'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_NIGHT_MAX_PULSE) WL_NIGHT_MAX_PULSE',
' from REHAB_WATCH_LOGS',
'where WL_NIGHT_MAX_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_NIGHT_MAX_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%NMAP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77289727597875675)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
,p_static_id=>'wl-min-pulse'
,p_seq=>140
,p_name=>'Night Min Pulse'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''\041D\0456\0447\043D\0438\0439 \043F\0443\043B\044C\0441 \043C\0456\043D\0456\043C\0443\043C'' nm,'),
'       trunc(WL_TAKEN,''dd'') WL_TAKEN, ',
'       avg(WL_NIGHT_MIN_PULSE) WL_NIGHT_MIN_PULSE',
' from REHAB_WATCH_LOGS',
'where WL_NIGHT_MIN_PULSE is not null and WL_PAT_ID = REHAB_CONTEXT_PKG.getPATIENT()',
'and trunc(WL_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(WL_TAKEN,''dd'')',
'order by WL_TAKEN'))
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'WL_NIGHT_MIN_PULSE'
,p_items_label_column_name=>'WL_TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_AVGMEASUR like ''%NMIP%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(77283129299875650)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
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
 p_id=>wwv_flow_imp.id(77282559910875648)
,p_chart_id=>wwv_flow_imp.id(77282017451875642)
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
 p_id=>wwv_flow_imp.id(77309687479875730)
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
 p_id=>wwv_flow_imp.id(249070424960953491)
,p_plug_name=>'Charts'
,p_static_id=>'charts'
,p_title=>unistr('\0414\0456\0430\0433\0440\0430\043C\0438')
,p_parent_plug_id=>wwv_flow_imp.id(249070256334953490)
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
 p_id=>wwv_flow_imp.id(249070635452953493)
,p_plug_name=>'Drug Use'
,p_static_id=>'drug-use'
,p_parent_plug_id=>wwv_flow_imp.id(249070424960953491)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P32_CHARTS2SHOW like ''%DRU%'''
,p_plug_display_when_cond2=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(77302929498875710)
,p_region_id=>wwv_flow_imp.id(249070635452953493)
,p_chart_type=>'bar'
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
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
 p_id=>wwv_flow_imp.id(77304658421875714)
,p_chart_id=>wwv_flow_imp.id(77302929498875710)
,p_static_id=>'drug'
,p_seq=>10
,p_name=>'Drug 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P32_START,''YYYY-MON-DD'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P32_END,''YYYY-MON-DD'') - to_date(:P32_START,''YYYY-MON-DD'')),',
'dr_data1 as ',
'(select d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''YYYY-MON-DD'')||'')'' nm,',
'        (select pat_id from PATIENTS where apex_user=v(''APP_USER'')) pat_id,',
'        pr.pr_id',
' from PRESCRIPTION pr, DRUGS d, PRESCRIPTOR prr',
'where pr.prr_id=prr.prr_id ',
'  and pr.pr_id=(select c from (select column_value c, rownum rn from table(apex_string.split(:P32_DRUGS,'':''))) where rn=1)',
'  and pr.DR_ID=d.dr_id)',
'select',
'  nm, dates.dd CONSUMED, ACTUAL_DOSAGE',
'from',
' dr_data1, ',
' dates,',
' (select trunc(CONSUMED,''dd'') CONSUMED, ',
'         sum(ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from DRUG_USE du, dr_data1 d',
'  where du.ACTUAL_DOSAGE is not null',
'    and du.pat_id = d.pat_id',
'    and du.pr_id = d.pr_id',
'    and trunc(CONSUMED,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'    group by trunc(CONSUMED,''dd'')) duu',
'where duu.CONSUMED(+)=dates.dd',
'order by CONSUMED'))
,p_series_type=>'bar'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77305242291875716)
,p_chart_id=>wwv_flow_imp.id(77302929498875710)
,p_static_id=>'drug-2'
,p_seq=>20
,p_name=>'Drug 2'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P32_START,''YYYY-MON-DD'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P32_END,''YYYY-MON-DD'') - to_date(:P32_START,''YYYY-MON-DD'')),',
'dr_data1 as ',
'(select d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''YYYY-MON-DD'')||'')'' nm,',
'        (select pat_id from PATIENTS where apex_user=v(''APP_USER'')) pat_id,',
'        pr.pr_id',
' from PRESCRIPTION pr, DRUGS d, PRESCRIPTOR prr',
'where pr.prr_id=prr.prr_id ',
'  and pr.pr_id=(select c from (select column_value c, rownum rn from table(apex_string.split(:P32_DRUGS,'':''))) where rn=2)',
'  and pr.DR_ID=d.dr_id)',
'select',
'  nm, dates.dd CONSUMED, ACTUAL_DOSAGE',
'from',
' dr_data1, ',
' dates,',
' (select trunc(CONSUMED,''dd'') CONSUMED, ',
'         sum(ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from DRUG_USE du, dr_data1 d',
'  where du.ACTUAL_DOSAGE is not null',
'    and du.pat_id = d.pat_id',
'    and du.pr_id = d.pr_id',
'    and trunc(CONSUMED,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'    group by trunc(CONSUMED,''dd'')) duu',
'where duu.CONSUMED(+)=dates.dd',
'order by CONSUMED'))
,p_series_type=>'bar'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77305891326875718)
,p_chart_id=>wwv_flow_imp.id(77302929498875710)
,p_static_id=>'drug-3'
,p_seq=>30
,p_name=>'Drug 3'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P32_START,''YYYY-MON-DD'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P32_END,''YYYY-MON-DD'') - to_date(:P32_START,''YYYY-MON-DD'')),',
'dr_data1 as ',
'(select d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''YYYY-MON-DD'')||'')'' nm,',
'        (select pat_id from PATIENTS where apex_user=v(''APP_USER'')) pat_id,',
'        pr.pr_id',
' from PRESCRIPTION pr, DRUGS d, PRESCRIPTOR prr',
'where pr.prr_id=prr.prr_id ',
'  and pr.pr_id=(select c from (select column_value c, rownum rn from table(apex_string.split(:P32_DRUGS,'':''))) where rn=3)',
'  and pr.DR_ID=d.dr_id)',
'select',
'  nm, dates.dd CONSUMED, ACTUAL_DOSAGE',
'from',
' dr_data1, ',
' dates,',
' (select trunc(CONSUMED,''dd'') CONSUMED, ',
'         sum(ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from DRUG_USE du, dr_data1 d',
'  where du.ACTUAL_DOSAGE is not null',
'    and du.pat_id = d.pat_id',
'    and du.pr_id = d.pr_id',
'    and trunc(CONSUMED,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'    group by trunc(CONSUMED,''dd'')) duu',
'where duu.CONSUMED(+)=dates.dd',
'order by CONSUMED'))
,p_series_type=>'bar'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77306450294875720)
,p_chart_id=>wwv_flow_imp.id(77302929498875710)
,p_static_id=>'drug-4'
,p_seq=>40
,p_name=>'Drug 4'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P32_START,''YYYY-MON-DD'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P32_END,''YYYY-MON-DD'') - to_date(:P32_START,''YYYY-MON-DD'')),',
'dr_data1 as ',
'(select d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''YYYY-MON-DD'')||'')'' nm,',
'        (select pat_id from PATIENTS where apex_user=v(''APP_USER'')) pat_id,',
'        pr.pr_id',
' from PRESCRIPTION pr, DRUGS d, PRESCRIPTOR prr',
'where pr.prr_id=prr.prr_id ',
'  and pr.pr_id=(select c from (select column_value c, rownum rn from table(apex_string.split(:P32_DRUGS,'':''))) where rn=4)',
'  and pr.DR_ID=d.dr_id)',
'select',
'  nm, dates.dd CONSUMED, ACTUAL_DOSAGE',
'from',
' dr_data1, ',
' dates,',
' (select trunc(CONSUMED,''dd'') CONSUMED, ',
'         sum(ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from DRUG_USE du, dr_data1 d',
'  where du.ACTUAL_DOSAGE is not null',
'    and du.pat_id = d.pat_id',
'    and du.pr_id = d.pr_id',
'    and trunc(CONSUMED,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'    group by trunc(CONSUMED,''dd'')) duu',
'where duu.CONSUMED(+)=dates.dd',
'order by CONSUMED'))
,p_series_type=>'bar'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77307066871875722)
,p_chart_id=>wwv_flow_imp.id(77302929498875710)
,p_static_id=>'drug-5'
,p_seq=>50
,p_name=>'Drug 5'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P32_START,''YYYY-MON-DD'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P32_END,''YYYY-MON-DD'') - to_date(:P32_START,''YYYY-MON-DD'')),',
'dr_data1 as ',
'(select d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''YYYY-MON-DD'')||'')'' nm,',
'        (select pat_id from PATIENTS where apex_user=v(''APP_USER'')) pat_id,',
'        pr.pr_id',
' from PRESCRIPTION pr, DRUGS d, PRESCRIPTOR prr',
'where pr.prr_id=prr.prr_id ',
'  and pr.pr_id=(select c from (select column_value c, rownum rn from table(apex_string.split(:P32_DRUGS,'':''))) where rn=5)',
'  and pr.DR_ID=d.dr_id)',
'select',
'  nm, dates.dd CONSUMED, ACTUAL_DOSAGE',
'from',
' dr_data1, ',
' dates,',
' (select trunc(CONSUMED,''dd'') CONSUMED, ',
'         sum(ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from DRUG_USE du, dr_data1 d',
'  where du.ACTUAL_DOSAGE is not null',
'    and du.pat_id = d.pat_id',
'    and du.pr_id = d.pr_id',
'    and trunc(CONSUMED,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'    group by trunc(CONSUMED,''dd'')) duu',
'where duu.CONSUMED(+)=dates.dd',
'order by CONSUMED'))
,p_series_type=>'bar'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77307611993875724)
,p_chart_id=>wwv_flow_imp.id(77302929498875710)
,p_static_id=>'drug-6'
,p_seq=>60
,p_name=>'Drug 6'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P32_START,''YYYY-MON-DD'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P32_END,''YYYY-MON-DD'') - to_date(:P32_START,''YYYY-MON-DD'')),',
'dr_data1 as ',
'(select d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''YYYY-MON-DD'')||'')'' nm,',
'        (select pat_id from PATIENTS where apex_user=v(''APP_USER'')) pat_id,',
'        pr.pr_id',
' from PRESCRIPTION pr, DRUGS d, PRESCRIPTOR prr',
'where pr.prr_id=prr.prr_id ',
'  and pr.pr_id=(select c from (select column_value c, rownum rn from table(apex_string.split(:P32_DRUGS,'':''))) where rn=6)',
'  and pr.DR_ID=d.dr_id)',
'select',
'  nm, dates.dd CONSUMED, ACTUAL_DOSAGE',
'from',
' dr_data1, ',
' dates,',
' (select trunc(CONSUMED,''dd'') CONSUMED, ',
'         sum(ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from DRUG_USE du, dr_data1 d',
'  where du.ACTUAL_DOSAGE is not null',
'    and du.pat_id = d.pat_id',
'    and du.pr_id = d.pr_id',
'    and trunc(CONSUMED,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'    group by trunc(CONSUMED,''dd'')) duu',
'where duu.CONSUMED(+)=dates.dd',
'order by CONSUMED'))
,p_series_type=>'bar'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77308269203875725)
,p_chart_id=>wwv_flow_imp.id(77302929498875710)
,p_static_id=>'drug-7'
,p_seq=>70
,p_name=>'Drug 7'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P32_START,''YYYY-MON-DD'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P32_END,''YYYY-MON-DD'') - to_date(:P32_START,''YYYY-MON-DD'')),',
'dr_data1 as ',
'(select d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''YYYY-MON-DD'')||'')'' nm,',
'        (select pat_id from PATIENTS where apex_user=v(''APP_USER'')) pat_id,',
'        pr.pr_id',
' from PRESCRIPTION pr, DRUGS d, PRESCRIPTOR prr',
'where pr.prr_id=prr.prr_id ',
'  and pr.pr_id=(select c from (select column_value c, rownum rn from table(apex_string.split(:P32_DRUGS,'':''))) where rn=7)',
'  and pr.DR_ID=d.dr_id)',
'select',
'  nm, dates.dd CONSUMED, ACTUAL_DOSAGE',
'from',
' dr_data1, ',
' dates,',
' (select trunc(CONSUMED,''dd'') CONSUMED, ',
'         sum(ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from DRUG_USE du, dr_data1 d',
'  where du.ACTUAL_DOSAGE is not null',
'    and du.pat_id = d.pat_id',
'    and du.pr_id = d.pr_id',
'    and trunc(CONSUMED,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'    group by trunc(CONSUMED,''dd'')) duu',
'where duu.CONSUMED(+)=dates.dd',
'order by CONSUMED'))
,p_series_type=>'bar'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77308877455875727)
,p_chart_id=>wwv_flow_imp.id(77302929498875710)
,p_static_id=>'drug-8'
,p_seq=>80
,p_name=>'Drug 8'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dates as (select trunc(to_date(:P32_START,''YYYY-MON-DD'') + level - 1,''DD'') dd',
'from dual ',
'connect by level <= to_date(:P32_END,''YYYY-MON-DD'') - to_date(:P32_START,''YYYY-MON-DD'')),',
'dr_data1 as ',
'(select d.DR_NAME||'' - ''||PRR_PRESCRIPTED_BY||'' (''||to_char(PRR_PRESCRIPTED_WHEN,''YYYY-MON-DD'')||'')'' nm,',
'        (select pat_id from PATIENTS where apex_user=v(''APP_USER'')) pat_id,',
'        pr.pr_id',
' from PRESCRIPTION pr, DRUGS d, PRESCRIPTOR prr',
'where pr.prr_id=prr.prr_id ',
'  and pr.pr_id=(select c from (select column_value c, rownum rn from table(apex_string.split(:P32_DRUGS,'':''))) where rn=8)',
'  and pr.DR_ID=d.dr_id)',
'select',
'  nm, dates.dd CONSUMED, ACTUAL_DOSAGE',
'from',
' dr_data1, ',
' dates,',
' (select trunc(CONSUMED,''dd'') CONSUMED, ',
'         sum(ACTUAL_DOSAGE) ACTUAL_DOSAGE',
'  from DRUG_USE du, dr_data1 d',
'  where du.ACTUAL_DOSAGE is not null',
'    and du.pat_id = d.pat_id',
'    and du.pr_id = d.pr_id',
'    and trunc(CONSUMED,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'    group by trunc(CONSUMED,''dd'')) duu',
'where duu.CONSUMED(+)=dates.dd',
'order by CONSUMED'))
,p_series_type=>'bar'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'ACTUAL_DOSAGE'
,p_items_label_column_name=>'CONSUMED'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(77303425193875711)
,p_chart_id=>wwv_flow_imp.id(77302929498875710)
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
 p_id=>wwv_flow_imp.id(77304068710875713)
,p_chart_id=>wwv_flow_imp.id(77302929498875710)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Dose, milligrams'
,p_format_type=>'decimal'
,p_decimal_places=>1
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(249040851354668339)
,p_plug_name=>'Measurements'
,p_static_id=>'measurements'
,p_title=>unistr('\0412\0438\043C\0456\0440\0438')
,p_parent_plug_id=>wwv_flow_imp.id(249070424960953491)
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
,p_plug_display_when_condition=>':P32_CHARTS2SHOW like ''%MEA%'''
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(77296623767875693)
,p_region_id=>wwv_flow_imp.id(249040851354668339)
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
 p_id=>wwv_flow_imp.id(77298393607875698)
,p_chart_id=>wwv_flow_imp.id(77296623767875693)
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
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
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
,p_display_when_condition=>':P32_MEASUR like ''%DIA-A%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77298912441875699)
,p_chart_id=>wwv_flow_imp.id(77296623767875693)
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
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
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
,p_display_when_condition=>':P32_MEASUR like ''%DIA#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77299527261875701)
,p_chart_id=>wwv_flow_imp.id(77296623767875693)
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
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
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
,p_display_when_condition=>':P32_MEASUR like ''%DIA#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77300128082875702)
,p_chart_id=>wwv_flow_imp.id(77296623767875693)
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
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
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
,p_display_when_condition=>':P32_MEASUR like ''%PULSE%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77300771768875704)
,p_chart_id=>wwv_flow_imp.id(77296623767875693)
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
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
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
,p_display_when_condition=>':P32_MEASUR like ''%SYST-A%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77301212844875705)
,p_chart_id=>wwv_flow_imp.id(77296623767875693)
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
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
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
,p_display_when_condition=>':P32_MEASUR like ''%SYST#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77301871309875707)
,p_chart_id=>wwv_flow_imp.id(77296623767875693)
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
'and trunc(MT_TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
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
,p_display_when_condition=>':P32_MEASUR like ''%SYST#%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(77297101344875695)
,p_chart_id=>wwv_flow_imp.id(77296623767875693)
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
 p_id=>wwv_flow_imp.id(77297763283875696)
,p_chart_id=>wwv_flow_imp.id(77296623767875693)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('\0412\0438\043C\0456\0440')
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
 p_id=>wwv_flow_imp.id(245424219924051114)
,p_plug_name=>'Parameters'
,p_static_id=>'parameters'
,p_title=>unistr('\0424\0456\043B\044C\0442\0440\0438')
,p_parent_plug_id=>wwv_flow_imp.id(249070256334953490)
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
 p_id=>wwv_flow_imp.id(249070256334953490)
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
 p_id=>wwv_flow_imp.id(245426136948051133)
,p_plug_name=>'Trainings'
,p_static_id=>'trainings'
,p_parent_plug_id=>wwv_flow_imp.id(249070424960953491)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P32_CHARTS2SHOW like ''%TRA%'''
,p_plug_display_when_cond2=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(16869691178504232)
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(77290874185875678)
,p_region_id=>wwv_flow_imp.id(245426136948051133)
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
 p_id=>wwv_flow_imp.id(77292514568875682)
,p_chart_id=>wwv_flow_imp.id(77290874185875678)
,p_static_id=>'pulse-avg'
,p_seq=>40
,p_name=>'Pulse AVG'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Training Pulse AVG'' nm,',
'       trunc(TR_START,''dd'') TR_START, ',
'       avg(pulse_avg) pulse_avg',
' from TRAININGS',
'where pulse_avg is not null and pat_id in (select pat_id from PATIENTS where apex_user=v(''APP_USER''))',
'and trunc(TR_START,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_type=>'line'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'PULSE_AVG'
,p_items_label_column_name=>'TR_START'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'circle'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_TRAININGS like ''%PLSAVG%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77293178308875684)
,p_chart_id=>wwv_flow_imp.id(77290874185875678)
,p_static_id=>'pulse-max'
,p_seq=>60
,p_name=>'Pulse MAX'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Training Pulse MAX'' nm,',
'       trunc(TR_START,''dd'') TR_START, ',
'       avg(pulse_max) pulse_max',
' from TRAININGS',
'where pulse_max is not null and pat_id in (select pat_id from PATIENTS where apex_user=v(''APP_USER''))',
'and trunc(TR_START,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_type=>'line'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'PULSE_MAX'
,p_items_label_column_name=>'TR_START'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'diamond'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_TRAININGS like ''%PLSMAX%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77293747348875686)
,p_chart_id=>wwv_flow_imp.id(77290874185875678)
,p_static_id=>'pulse-min'
,p_seq=>50
,p_name=>'Pulse MIN'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Training Pulse MIN'' nm,',
'       trunc(TR_START,''dd'') TR_START, ',
'       avg(pulse_min) pulse_min',
' from TRAININGS',
'where pulse_min is not null and pat_id in (select pat_id from PATIENTS where apex_user=v(''APP_USER''))',
'and trunc(TR_START,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_type=>'line'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'PULSE_MIN'
,p_items_label_column_name=>'TR_START'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'square'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_TRAININGS like ''%PLSMIN%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77294381068875687)
,p_chart_id=>wwv_flow_imp.id(77290874185875678)
,p_static_id=>'totsteps'
,p_seq=>10
,p_name=>'TotSteps'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Total day steps'' nm,',
'       trunc(TAKEN,''dd'') TAKEN, ',
'       avg(STEPS) STEPS',
' from WATCH_LOG',
'where STEPS is not null and pat_id in (select pat_id from PATIENTS where apex_user=v(''APP_USER''))',
'and trunc(TAKEN,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(TAKEN,''dd'')',
'order by taken'))
,p_series_type=>'line'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'STEPS'
,p_items_label_column_name=>'TAKEN'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'star'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_TRAININGS like ''%TOTST%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77294968073875689)
,p_chart_id=>wwv_flow_imp.id(77290874185875678)
,p_static_id=>'training-distance'
,p_seq=>30
,p_name=>'Training Distance'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Training distance'' nm,',
'       trunc(TR_START,''dd'') TR_START, ',
'       sum(DISTANCE_LENGTH) DISTANCE_LENGTH',
' from TRAININGS',
'where DISTANCE_LENGTH is not null and pat_id in (select pat_id from PATIENTS where apex_user=v(''APP_USER''))',
'and trunc(TR_START,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_type=>'line'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'DISTANCE_LENGTH'
,p_items_label_column_name=>'TR_START'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'plus'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_TRAININGS like ''%DIST%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(77295536510875690)
,p_chart_id=>wwv_flow_imp.id(77290874185875678)
,p_static_id=>'training-steps'
,p_seq=>20
,p_name=>'Training Steps'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Training steps'' nm,',
'       trunc(TR_START,''dd'') TR_START, ',
'       sum(STEPS) STEPS',
' from TRAININGS',
'where STEPS is not null and pat_id in (select pat_id from PATIENTS where apex_user=v(''APP_USER''))',
'and trunc(TR_START,''dd'') between to_date(:P32_START,''YYYY-MON-DD'') and to_date(:P32_END,''YYYY-MON-DD'')',
'group by trunc(TR_START,''dd'')',
'order by TR_START'))
,p_series_type=>'line'
,p_series_name_column_name=>'NM'
,p_items_value_column_name=>'STEPS'
,p_items_label_column_name=>'TR_START'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'on'
,p_marker_shape=>'triangleUp'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>':P32_TRAININGS like ''%TRST%'''
,p_display_when_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(77291392691875679)
,p_chart_id=>wwv_flow_imp.id(77290874185875678)
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
 p_id=>wwv_flow_imp.id(77291906347875681)
,p_chart_id=>wwv_flow_imp.id(77290874185875678)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Measure'
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77277267037875618)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(245424219924051114)
,p_button_name=>'Del'
,p_static_id=>'del'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--gapTop'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>'Delete'
,p_icon_css_classes=>'fa-eraser'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77277693369875621)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(245424219924051114)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--gapTop'
,p_button_template_id=>2350584059425431644
,p_button_image_alt=>'Save'
,p_icon_css_classes=>'fa-save'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(77278075877875622)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(245424219924051114)
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
 p_id=>wwv_flow_imp.id(249074365736953538)
,p_name=>'P32_AVGMEASUR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(245424219924051114)
,p_item_default=>'PULSE:SYST-A:DIA-A'
,p_prompt=>'Avg measurements'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>unistr('STATIC2:\041F\0443\043B\044C\0441;PULSE,\0422\0438\0441\043A SYS;SYST#,\0422\0438\0441\043A DIA;DIA#,\0422\0438\0441\043A SYS \0441\0435\0440\0435\0434\043D\0456\0439;SYST-A,\0422\0438\0441\043A DIA \0441\0435\0440\0435\0434\043D\0456\0439;DIA-A,\0412\0430\0433\0430;WEI,\041F\0443\043B\044C\0441 \043D\0456\0447\043D\0438\0439 \043C\0456\043D\0456\043C\0443\043C;NMIP,\041F\0443\043B\044C\0441 \043D\0456\0447\043D\0438\0439  \043C\0430\043A\0441\0456\043C\0443\043C;NMAP,\041F\0443\043B\044C\0441 \043D\0456\0447\043D\0438\0439  \0441\0435\0440\0435\0434\043D\0456\0439 ;NAVP,\0421\0435\0440\0435\0434\043D\0456\0439 \043F\0443\043B\044C\0441 \0441\043F\043E\043A\043E\044E;CAVP,\041C\0456\043D\0456\043C\0430\043B\044C\043D\0438\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441;TMIP,\041C\0430')
||unistr('\043A\0441\0438\043C\0430\043B\044C\043D\0438\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441;TMAP,\0421\0435\0440\0435\0434\043D\0456\0439 \0434\043E\0431\043E\0432\0438\0439 \043F\0443\043B\044C\0441;TAP,\041A\0438\0441\0435\043D\044C;OXI,\0422\0435\043C\043F\0435\0440\0430\0442\0443\0430;TEMP,\0426\0443\043A\043E\0440;SUG')
,p_cSize=>30
,p_display_when=>':P32_CHARTS2SHOW like ''%AVGM%'''
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
 p_id=>wwv_flow_imp.id(249073890734953534)
,p_name=>'P32_CHARTS2SHOW'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(245424219924051114)
,p_item_default=>'MEA:AVGM:TRA'
,p_prompt=>'Charts to show'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:Measurements;MEA,Avg Measurements;AVGM,Trainings;TRA,Drug Use;DRU'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '4')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(249074063146953535)
,p_name=>'P32_DRUGS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(245424219924051114)
,p_prompt=>'Drug Use'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  d.DR_NAME||''(''||DR_WORKING_SUBST||''; ''||TYPE_SHORT||'') - ''||p.PRR_PRESCRIPTED_BY||'' (''||to_char(p.PRR_PRESCRIPTED_WHEN,''YYYY-MON-DD'')||'')'' d, pr.pr_id r',
'from PRESCRIPTION pr, DRUGS d, PRESCRIPTOR p',
'where pr.pat_id in (select pat_id from PATIENTS where apex_user=v(''APP_USER''))',
'and d.DR_ID=pr.dr_id',
'and pr.PRR_ID=p.PRR_ID'))
,p_cSize=>30
,p_display_when=>':P32_CHARTS2SHOW like ''%DRU%'''
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
 p_id=>wwv_flow_imp.id(245427263174051152)
,p_name=>'P32_END'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(245424219924051114)
,p_prompt=>'End Date'
,p_format_mask=>'YYYY-MON-DD'
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
 p_id=>wwv_flow_imp.id(249074217156953537)
,p_name=>'P32_MEASUR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(245424219924051114)
,p_item_default=>'PULSE:SYST-A:DIA-A'
,p_prompt=>'Measurements'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>'STATIC:Pulse;PULSE,Pressure SYS;SYST#,Pressure DIA;DIA#,Pressure SYS Avg;SYST-A,Pressure DIA Avg;DIA-A'
,p_cSize=>30
,p_display_when=>':P32_CHARTS2SHOW like ''%MEA%'''
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
 p_id=>wwv_flow_imp.id(278247225091740042)
,p_name=>'P32_NEW_VIEW'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(245424219924051114)
,p_prompt=>'New View'
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
 p_id=>wwv_flow_imp.id(245427115863051151)
,p_name=>'P32_START'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(245424219924051114)
,p_prompt=>'Start Date'
,p_format_mask=>'YYYY-MON-DD'
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
 p_id=>wwv_flow_imp.id(278247162478740041)
,p_name=>'P32_STORAGE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(245424219924051114)
,p_prompt=>'View'
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
 p_id=>wwv_flow_imp.id(249074412614953539)
,p_name=>'P32_TRAININGS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(245424219924051114)
,p_item_default=>'PLSAVG:PLSMAX:PLSMIN'
,p_prompt=>'Trainings'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>'STATIC:Total Steps;TOTST,Training steps;TRST,Distance;DIST,Pulse AVG;PLSAVG,Pulse MIN;PLSMIN,Pulse MAX;PLSMAX'
,p_cSize=>30
,p_display_when=>':P32_CHARTS2SHOW like ''%TRA%'''
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
 p_id=>wwv_flow_imp.id(77311388737875737)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DelState'
,p_static_id=>'delstate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  REHAB_APPSTATE.delete_storage(:P32_STORAGE);',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77277267037875618)
,p_internal_uid=>77311388737875737
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77310505855875735)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Init'
,p_static_id=>'init'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P32_STORAGE is null then ',
'    REHAB_APPSTATE.extract_jparams (',
'        P_APP_USER => v(''APP_USER''),',
'        P_APP_PAGE => v(''APP_PAGE_ID''));  ',
'    :P32_STORAGE := REHAB_APPSTATE.curr_storage_id; ',
'  else',
'    REHAB_APPSTATE.extract_jparams (',
'        p_storage_id => :P32_STORAGE,',
'        P_APP_USER => v(''APP_USER''),',
'        P_APP_PAGE => v(''APP_PAGE_ID''));  ',
'  end if;',
'',
'  --raise_application_error(-20000,''u: ''||v(''APP_USER'')||''; p: ''||v(''APP_PAGE_ID''));',
'  :P32_AVGMEASUR := REHAB_APPSTATE.get_jparam(''P32_AVGMEASUR'',null);',
'  :P32_CHARTS2SHOW := REHAB_APPSTATE.get_jparam(''P32_CHARTS2SHOW'',null);',
'  :P32_DRUGS := REHAB_APPSTATE.get_jparam(''P32_DRUGS'',null);',
'  --:P32_START := COREMOD_APPSTATE.get_jparam(''P32_START'',null);',
'  --:P32_END := COREMOD_APPSTATE.get_jparam(''P32_END'',null);',
'  :P32_MEASUR := REHAB_APPSTATE.get_jparam(''P32_MEASUR'',null);',
'  :P32_TRAININGS := REHAB_APPSTATE.get_jparam(''P32_TRAININGS'',null);',
'',
'  if :P32_START is null then :P32_START := to_char(sysdate-10,''YYYY-MON-DD''); end if;',
'  if :P32_END is null then :P32_END := to_char(sysdate+1,''YYYY-MON-DD''); end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>77310505855875735
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(77310971078875736)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SaveState'
,p_static_id=>'savestate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P32_STORAGE is null then ',
'    REHAB_APPSTATE.extract_jparams (',
'        P_APP_USER => v(''APP_USER''),',
'        P_APP_PAGE => v(''APP_PAGE_ID''));  ',
'    :P32_STORAGE := REHAB_APPSTATE.curr_storage_id; ',
'  else',
'    REHAB_APPSTATE.extract_jparams (',
'        p_storage_id => :P32_STORAGE,',
'        P_APP_USER => v(''APP_USER''),',
'        P_APP_PAGE => v(''APP_PAGE_ID''));  ',
'  end if;',
'   REHAB_APPSTATE.set_jparam(''P32_AVGMEASUR'',:P32_AVGMEASUR);',
'   REHAB_APPSTATE.set_jparam(''P32_CHARTS2SHOW'',:P32_CHARTS2SHOW);',
'   REHAB_APPSTATE.set_jparam(''P32_DRUGS'',:P32_DRUGS);',
'   --COREMOD_APPSTATE.set_jparam(''P32_START'',:P32_START);',
'   --COREMOD_APPSTATE.set_jparam(''P32_END'',:P32_END);',
'   REHAB_APPSTATE.set_jparam(''P32_MEASUR'',:P32_MEASUR);',
'   REHAB_APPSTATE.set_jparam(''P32_TRAININGS'',:P32_TRAININGS);',
'   REHAB_APPSTATE.store_jparams(:P32_NEW_VIEW);',
'   :P32_NEW_VIEW := null;',
'   :P32_STORAGE := REHAB_APPSTATE.curr_storage_id;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(77277693369875621)
,p_internal_uid=>77310971078875736
);
wwv_flow_imp.component_end;
end;
/
