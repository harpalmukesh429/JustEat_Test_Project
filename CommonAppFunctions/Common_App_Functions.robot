*** Settings ***
Library    Selenium2Library
Library    Collections
Library    String      
Resource    ../PageObjects/PageObjects_Home_Page.robot

*** Keywords ***
Open Browser And Set For Testing
    [Arguments]    ${gv_URL}    ${gv_Browser_Name}
    Selenium2Library.Open Browser    ${gv_URL}    ${gv_Browser_Name}
    Maximize Browser Window
    Delete All Cookies
    