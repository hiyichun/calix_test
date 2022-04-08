*** Settings ***
Suite Teardown    Close Browser
Test Template
Resource          login.robot
Resource          org_manage.robot
Resource          test_manage.robot
Resource          tool_manage.robot
Resource          user_manage.robot
Library           String

*** Variables ***
${Version}        现网环境_回归测试
${enviroment}     'https://test.pvrtestbed.cn/ceni2/index.html?#/chinese/login'    # 现网环境'https://www.pvrtestbed.cn:9000/ceni2/index.html#/login'，测试'https://test.pvrtestbed.cn/ceni2/index.html#/login'

*** Test Cases ***
系统管理员登录
    ${words} =    Split String    ${enviroment}    '
    打开登录页面    ${words}[1]
    sleep    1
    安全链接
    sleep    3
    输入登录用户信息    sys_admin    W90$YuEb    9527    系统管理员

创建机构
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    sys_admin    W90$YuEb    9527    系统管理员
    ${myres}    创建机构    ${webdriver}    现网环境_机构_回归测试    ${Version}
    Should Be Equal As Strings    ${myres}    新增机构成功
    sleep    2

创建机构管理员
    ${myres}    创建机构管理员    ${webdriver}    现网环境_回归机构管理员    ${Version}    W90$YuEb    回归测试
    Should Be Equal As Strings    ${myres}    新增用户成功
    sleep    5

创建试验管理员
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    #Switch Window
    输入登录用户信息    现网环境_回归机构管理员    W90$YuEb    9527    机构管理员
    ${myres}    创建试验管理员    ${webdriver}    现网环境_回归试验管理员    ${Version}
    Should Be Equal As Strings    ${myres}    新增用户成功

新增工具规格
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    sys_admin    W90$YuEb    9527    系统管理员
    ${myres}    新增工具规格    ${webdriver}    现网环境_回归试验_工具规格
    Should Be Equal As Strings    ${myres}    新增工具规格成功

查询工具规格同步
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    sys_admin    W90$YuEb    9527    系统管理员
    ${myres}    规格同步查询    ${webdriver}    现网环境_回归试验_工具规格
    Should Be Equal As Strings    ${myres}    规格同步成功

新增工具镜像
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    新增工具镜像    ${webdriver}    现网环境_回归试验_工具镜像
    Should Be Equal As Strings    ${myres}    新增工具镜像成功

同步工具镜像查询
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    镜像同步查询    ${webdriver}    现网环境_回归试验_工具镜像
    Should Be Equal As Strings    ${myres}    镜像同步成功

新增工具
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    #Switch Window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    新增工具    ${webdriver}    回归试验    ${Version}
    Should Be Equal As Strings    ${myres}    新增工具成功

创建试验
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    #Switch Window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    创建试验    ${webdriver}    现网环境_回归试验    ${Version}
    Should Be Equal As Strings    ${myres}    创建试验成功

创建试验用户
    ${myres}    创建试验用户    ${webdriver}    现网环境_backtester    ${Version}
    Should Be Equal As Strings    ${myres}    新增用户成功

创建试验拓扑
    ${myres}    创建试验拓扑    ${webdriver}
    Should Be Equal As Strings    ${myres}    拓扑创建成功

创建流量
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    创建流量    ${webdriver}
    Should Be Equal As Strings    ${myres}    ping流量互通

暂停全部虚拟机
    ${words} =    Split String    ${enviroment}    '
    打开登录页面    ${words}[1]
    安全链接
    sleep    3
    输入登录用户信息    sys_admin    W90$YuEb    9527    系统管理员
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    暂停虚拟机    ${webdriver}
    Should Be Equal As Strings    ${myres}    当前所有设备已暂停

启动全部虚拟机
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    启动虚拟机    ${webdriver}
    Should Be Equal As Strings    ${myres}    当前所有设备已启动

导出拓扑模版
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    导出模版    ${webdriver}
    Should Be Equal As Strings    ${myres}    导出模板成功

试验用户虚机跳转
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    #Switch Window
    输入登录用户信息    现网环境_backtester    W90$YuEb    9527    试验用户
    ${myres}    检查试验用户虚拟机跳转    ${webdriver}
    Should Be Equal As Strings    ${myres}    试验用户虚拟机WEB跳转成功

创建快照
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    创建快照    ${webdriver}
    Should Be Equal As Strings    ${myres}    拍快照成功!

删除试验拓扑
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    #Switch Window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    删除试验拓扑    ${webdriver}    回归试验
    Should Be Equal As Strings    ${myres}    删除拓扑成功

导入拓扑模版
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    导入模版    ${webdriver}
    Should Be Equal As Strings    ${myres}    导入成功

恢复快照
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    恢复快照    ${webdriver}
    Should Be Equal As Strings    ${myres}    快照恢复成功!

删除快照
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    删除快照    ${webdriver}
    Should Be Equal As Strings    ${myres}    快照删除成功!

删除试验用户
    ${myres}    删除试验用户    ${webdriver}    backtester
    Should Be Equal As Strings    ${myres}    删除用户成功

删除试验
    ${myres}    删除试验    ${webdriver}    现网环境_回归试验
    Should Be Equal As Strings    ${myres}    试验删除成功

删除工具
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    现网环境_回归试验管理员    W90$YuEb    9527    试验管理员
    ${myres}    删除工具    ${webdriver}    现网环境_回归试验_工具
    Should Be Equal As Strings    ${myres}    删除工具成功

删除工具镜像
    ${myres}    删除工具镜像    ${webdriver}    现网环境_回归试验_工具镜像
    Should Be Equal As Strings    ${myres}    删除工具镜像成功

删除工具规格
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    输入登录用户信息    sys_admin    W90$YuEb    9527    系统管理员
    ${myres}    删除工具规格    ${webdriver}    现网环境_回归试验_工具规格
    Should Be Equal As Strings    ${myres}    删除工具规格成功

删除试验管理员
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    #Switch Window
    输入登录用户信息    现网环境_回归机构管理员    W90$YuEb    9527    机构管理员
    ${myres}    删除试验管理员    ${webdriver}    现网环境_回归试验管理员
    Should Be Equal As Strings    ${myres}    删除用户成功

删除机构管理员
    Execute Javascript    window.open(${enviroment});
    Close Window
    select window
    #Switch Window
    输入登录用户信息    sys_admin    W90$YuEb    9527    系统管理员
    ${myres}    删除机构管理员    ${webdriver}    现网环境_回归机构管理员
    Should Be Equal As Strings    ${myres}    删除用户成功

删除机构
    ${myres}    删除机构    ${webdriver}    现网环境_机构_回归测试
    Should Be Equal As Strings    ${myres}    删除机构成功
