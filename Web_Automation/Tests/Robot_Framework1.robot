*** Settings ***
Documentation    This is some basic info about the whole suite
Library          SeleniumLibrary

*** Variables ***
${URL}                  https://www.psegameshop.com/
${ELEMENT_LOGIN}        //*[@id="masthead"]/div[1]/div[4]/ul/li[3]/a
${VALID_USERNAME}       sarah_sasa17@yahoo.com
${VALID_PASSWORD}       Rynetta!7
${INVALID_USERAME}      sarah_sasa@yahoo.com
${INVALID_PASSWORD}     Rynetta
${INPUT_USERNAME}       //*[@id="username"]
${INPUT_PASSWORD}       //*[@id="password"]
${REMEMBER_ME}          //*[@id="rememberme"]
${LOGIN_BTN}            //*[@id="customer_login"]/div[1]/div/form/p[3]/button
${EYE_ICON}             //*[@id="customer_login"]/div[1]/div/form/p[2]/span/span

*** Test Cases ***
TC01. Verify that the user will be able to login with their acc with the correct credential
    [Documentation]         This is the login with valid username & password
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                     Starting the test case!
    open browser            ${URL}                  chrome
    click element           ${ELEMENT_LOGIN}
    input text              ${INPUT_USERNAME}       ${VALID_USERNAME}
    input password          ${INPUT_PASSWORD}       ${VALID_PASSWORD}
    select checkbox         ${REMEMBER_ME}
    click button            ${LOGIN_BTN}
    sleep                   3s
    close browser

TC02. Verify that the user will get into their dashboard screen after login in with the correct credential
    [Documentation]         This is the login with valid username & password
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                     Starting the test case!
    open browser            ${URL}                  chrome
    click element           ${ELEMENT_LOGIN}
    input text              ${INPUT_USERNAME}       ${VALID_USERNAME}
    input password          ${INPUT_PASSWORD}       ${VALID_PASSWORD}
    select checkbox         ${REMEMBER_ME}
    click button            ${LOGIN_BTN}
    click element           ${ELEMENT_LOGIN}
    page should contain     Hello sarah_sasa17
    sleep                   3s
    close browser

TC03. Verify that the user can login by entering valid credentials and pressing Enter key
    [Documentation]         This is the login with valid username & password
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                     Starting the test case!
    open browser            ${URL}                  chrome
    click element           ${ELEMENT_LOGIN}
    input text              ${INPUT_USERNAME}       ${VALID_USERNAME}
    input password          ${INPUT_PASSWORD}       ${VALID_PASSWORD}
    select checkbox         ${REMEMBER_ME}
    press keys              ${LOGIN_BTN}            [RETURN]
    click element           ${ELEMENT_LOGIN}
    sleep                   3s
    close browser

TC04. Verify whether an eye icon is added to the password field or not
    [Documentation]         This is the login with valid username & password
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL}                  chrome
    click element                   ${ELEMENT_LOGIN}
    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}
    input password                  ${INPUT_PASSWORD}       ${VALID_PASSWORD}
    element should be visible       ${EYE_ICON}
    sleep                           3s
    close browser

TC05. Verify that the user can be able to view the password by clicking on the eye icon
    [Documentation]         This is the login with valid username & password
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL}                  chrome
    click element                   ${ELEMENT_LOGIN}
    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}
    input password                  ${INPUT_PASSWORD}       ${VALID_PASSWORD}
    element should be visible       ${EYE_ICON}
    click element                   ${EYE_ICON}
    sleep                           3s
    close browser

TC06. Verify logged-in user doesn't log out by clicking the back button on the browsers tab
    [Documentation]         This is the login with valid username & password
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                     Starting the test case!
    open browser            ${URL}                  chrome
    click element           ${ELEMENT_LOGIN}
    input text              ${INPUT_USERNAME}       ${VALID_USERNAME}
    input password          ${INPUT_PASSWORD}       ${VALID_PASSWORD}
    select checkbox         ${REMEMBER_ME}
    click button            ${LOGIN_BTN}
    click element           ${ELEMENT_LOGIN}
    go back
    click element           ${ELEMENT_LOGIN}
    sleep                   3s
    close browser

TC07. Verify the error message should display after just entering a password and leaving the email field blank
    [Documentation]         This is the login with valid username & password
    [Tags]                  Negative Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                     Starting the test case!
    open browser            ${URL}                  chrome
    click element           ${ELEMENT_LOGIN}
    input password          ${INPUT_PASSWORD}       ${VALID_PASSWORD}
    click button            ${LOGIN_BTN}
    page should contain     Username is required.
    sleep                   3s
    close browser

TC08. Verify the error message should display after just entering a username and leaving the password field blank
    [Documentation]         This is the login with valid username & password
    [Tags]                  Negative Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                     Starting the test case!
    open browser            ${URL}                  chrome
    click element           ${ELEMENT_LOGIN}
    input text              ${INPUT_USERNAME}       ${VALID_USERNAME}
    click button            ${LOGIN_BTN}
    page should contain     The password field is empty.
    sleep                   3s
    close browser

TC09. Verify the error message should display after entering an invalid email format
    [Documentation]         This is the login with valid username & password
    [Tags]                  Negative Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                     Starting the test case!
    open browser            ${URL}                  chrome
    click element           ${ELEMENT_LOGIN}
    input text              ${INPUT_USERNAME}       ${INVALID_USERAME}
    input password          ${INPUT_PASSWORD}       ${VALID_PASSWORD}
    click button            ${LOGIN_BTN}
    page should contain     Unknown email address. Check again or try your username.
    sleep                   3s
    close browser

TC10. Verify the error message should display after entering an invalid password format
    [Documentation]         This is the login with valid username & password
    [Tags]                  Negative Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                     Starting the test case!
    open browser            ${URL}                  chrome
    click element           ${ELEMENT_LOGIN}
    input text              ${INPUT_USERNAME}       ${VALID_USERNAME}
    input password          ${INPUT_PASSWORD}       ${INVALID_PASSWORD}
    click button            ${LOGIN_BTN}
    page should contain     The password you entered for the email address sarah_sasa17@yahoo.com is incorrect.
    sleep                   3s
    close browser

*** Keywords ***