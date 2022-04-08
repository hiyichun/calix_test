*** Settings ***
Library           test_files/user_manage/creat_orgadmin_detail.py
Library           test_files/user_manage/creat_expadmin_detail.py
Library           test_files/user_manage/creat_expuser_detail.py
Library           test_files/user_manage/delete_expuser_detail.py
Library           test_files/user_manage/delete_expadmin_detail.py
Library           test_files/user_manage/delete_orgadmin_detail.py
Library           test_files/user_manage/expuser_checkvmweb_detail.py

*** Keywords ***
创建机构管理员
    [Arguments]    ${driver}    ${name}    ${desc}    ${passwd}    ${org_name}
    ${res}    creat_orgadmin    ${driver}    ${name}    ${desc}    ${passwd}    ${org_name}
    [Return]    ${res}

创建试验管理员
    [Arguments]    ${driver}    ${name}    ${desc}
    ${res}    creat_expadmin    ${driver}    ${name}    ${desc}
    [Return]    ${res}

创建试验用户
    [Arguments]    ${driver}    ${name}    ${desc}
    ${res}    creat_expuser    ${driver}    ${name}    ${desc}
    [Return]    ${res}

检查试验用户虚拟机跳转
    [Arguments]    ${driver}
    ${res}    expuser_checkvmweb     ${driver}
    [Return]    ${res}

删除试验用户
    [Arguments]    ${driver}    ${name}
    ${res}    delete_expuser     ${driver}    ${name}
    [Return]    ${res}

删除试验管理员
    [Arguments]    ${driver}    ${name}
    ${res}    delete_expadmin     ${driver}    ${name}
    [Return]    ${res}

删除机构管理员
    [Arguments]    ${driver}    ${name}
    ${res}    delete_orgadmin     ${driver}    ${name}
    [Return]    ${res}
