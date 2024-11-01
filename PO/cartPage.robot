*** Settings ***
Documentation    All the page objects and keywords of cart page
Library    SeleniumLibrary
Library    Collections
Resource    setup.robot

*** Variables ***
${first_name}    limmy
${last_name}    tomson
${zip_code}    73000
${text_complete_statement}    Thank you for your order!

*** Keywords ***
Checkout cart
    Click Button    id:checkout
    Input Text    id:first-name    ${first_name}
    Input Text    id:last-name    ${last_name}
    Input Text    id:postal-code    text
    Click Button    id:continue
    Click Button    id:finish
Verify statement
    Element Text Should Be    css:.complete-header    ${text_complete_statement}    