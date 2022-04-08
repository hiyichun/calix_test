*** Settings ***
Library           Selenium2Library
Library           utils/CustomSeleniumKeywords.py
Library           test_files/user_manage/safe_link.py
*** Keywords ***
打开登录页面
    [Arguments]    ${url}
    Open Browser    ${url}    chrome
    Maximize Browser Window
    ${webdriver}    get_webdriver_instance
    SET GLOBAL VARIABLE    ${webdriver}
    [Return]    ${webdriver}

安全链接
    [Arguments]
    safe_link

输入登录用户信息
    [Arguments]    ${username}    ${password}    ${code}    ${testtxt}
    Input Text    id=name    ${username}
    Input Text    id=password    ${password}
    Input Text    id=captcha_v    ${code}
    sleep    2
    click element    class=login_btn
    sleep    3
    Page Should Contain    ${testtxt}
