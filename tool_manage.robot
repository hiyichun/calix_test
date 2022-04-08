*** Settings ***
Library           test_files/tool_manage/creat_toolset_detail.py
Library           test_files/tool_manage/delete_toolset_detail.py

*** Keywords ***
新增工具
    [Arguments]    ${driver}    ${name}    ${desc}
    ${res}    creat_toolset    ${driver}    ${name}    ${desc}
    [Return]    ${res}

删除工具
    [Arguments]    ${driver}    ${name}
    ${res}    delete_toolset    ${driver}    ${name}
    [Return]    ${res}

新增工具镜像
    [Arguments]    ${driver}    ${name}
    ${res}    creat_toolimage    ${driver}    ${name}
    [Return]    ${res}

删除工具镜像
    [Arguments]    ${driver}    ${name}
    ${res}    delete_toolimage    ${driver}    ${name}
    [Return]    ${res}

新增工具规格
    [Arguments]    ${driver}    ${name}
    ${res}    creat_flavor   ${driver}    ${name}
    [Return]    ${res}

规格同步查询
    [Arguments]    ${driver}    ${name}
    ${res}    flavor_sync   ${driver}    ${name}
    [Return]    ${res}

镜像同步查询
        [Arguments]    ${driver}    ${name}
    ${res}    toolimage_sync   ${driver}    ${name}
    [Return]    ${res}

删除工具规格
    [Arguments]    ${driver}    ${name}
    ${res}    delete_tool_specification   ${driver}    ${name}
    [Return]    ${res}