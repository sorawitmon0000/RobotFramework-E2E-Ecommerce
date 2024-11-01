*** Settings ***
Documentation    set up key word open and close browser.
Library    SeleniumLibrary

*** Variables ***
${browser_name}    Chrome
${website_url}    https://www.saucedemo.com

*** Keywords ***
Open the website
    Open Browser    ${website_url}    ${browser_name}
Close browser session
    Close Browser
