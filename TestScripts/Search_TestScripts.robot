*** Settings ***
Library    Selenium2Library      
Resource    ../StepDefinitions/StepDefinition_Home_Page.robot
Resource    ../CommonAppFunctions/Common_App_Functions.robot

Suite Setup    Open Browser And Set For Testing    ${gv_URL}    ${gv_Browser_Name}
Suite Teardown    Close Browser
      
*** Variables ***
${gv_URL}    http://www.just-eat.co.uk/
${gv_Browser_Name}    chrome


*** Test Cases ***
Scenario: Search for restaurants in an area
    [Tags]    SearchModule    Smoke    
	Given I want food in "AR51 1AA"
	When I search for restaurants
	Then I should see some restaurants in "AR51 1AA"