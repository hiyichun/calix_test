*** Settings ***
Library           test_files/test_manage/add_test_topu.py
Library           test_files/test_manage/check_floatingip_detail.py
Library           test_files/test_manage/creat_exp_detail.py
Library           test_files/test_manage/delete_exp_detail.py
Library           test_files/test_manage/export_model_detail.py
Library           test_files/test_manage/delete_model_detail.py
Library           test_files/test_manage/delete_test_topu.py
Library           test_files/test_manage/mutil_creat_exp.py

*** Keywords ***
创建试验
    [Arguments]    ${driver}    ${name}    ${desc}
    ${res}    creat_exp    ${driver}    ${name}    ${desc}
    [Return]    ${res}

创建试验拓扑
    [Arguments]    ${driver}
    ${res}    creat_test_topu    ${driver}
    [Return]    ${res}

创建流量
    [Arguments]    ${driver}
    ${res}    creat_stream    ${driver}
    [Return]    ${res}

暂停虚拟机
    [Arguments]    ${driver}
    ${res}    stop_virtual    ${driver}
    [Return]    ${res}

启动虚拟机
    [Arguments]    ${driver}
    ${res}    start_virtual    ${driver}
    [Return]    ${res}

导出模版
    [Arguments]    ${driver}
    ${res}    export_template    ${driver}
    [Return]    ${res}

导入模版
    [Arguments]    ${driver}
    ${res}    import_template    ${driver}
    [Return]    ${res}

创建快照
    [Arguments]    ${driver}
    ${res}    snapshot    ${driver}
    [Return]    ${res}

恢复快照
    [Arguments]    ${driver}
    ${res}    snapshot_recover    ${driver}
    [Return]    ${res}

删除快照
    [Arguments]    ${driver}
    ${res}    snapshot_delete    ${driver}
    [Return]    ${res}

删除试验拓扑
    [Arguments]    ${driver}    ${name}
    ${res}    del_test_topu    ${driver}    ${name}
    [Return]    ${res}

删除试验
    [Arguments]    ${driver}    ${name}
    ${res}    delete_exp    ${driver}    ${name}
    [Return]    ${res}
