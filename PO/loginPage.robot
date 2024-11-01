*** Settings ***
Documentation    All the page objects and keywords of login page
Library    SeleniumLibrary
Resource    setup.robot

*** Variables ***
${username_valid}    standard_user
${username_invalid}    test
${password_valid}    secret_sauce
${password_invalid}    1234
${message_invalid}    Epic sadface: Username and password do not match any user in this service

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:user-name    ${username}
    Input Password    id:password    ${password}
    Click Button    css:.submit-button
Verify unsuccesful login
    Wait Until Element Is Visible    xpath:.//*[@class='error-message-container error']
    Element Text Should Be    css:h3[data-test='error']    ${message_invalid}