*** Settings ***
Library           test_files/org_manage/creat_organization_detail.py
Library           test_files/org_manage/delete_organization_detail.py

*** Keywords ***
创建机构
    [Arguments]    ${driver}    ${org_name}    ${desc}
    ${res}    creat_organ    ${driver}    ${org_name}    ${desc}
    [Return]    ${res}

删除机构
    [Arguments]    ${driver}    ${name}
    ${res}    delete_organ     ${driver}    ${name}
    [Return]    ${res}
