*** Settings ***
Library  Selenium2Library

*** Variables ***


*** Keywords ***
Navigate to COMPLETED Tab
    click element  ${COMPLETED_TAB}
    page should contain element  xpath=//li[@class="mdl-list"] // i

Compare the item with the added item
    ${labelInCompletedTab} =  get text  xpath=//li[@class="mdl-list"] // span[contains(@class,"primary-content")]
    ${doneText} =  get text  xpath=//li[@class="mdl-list"] // i
    ${removeDoneText} =  remove string  ${labelInCompletedTab}  ${doneText}
    should be equal  ${removeDoneText}  ${word}

Delete item on the completed list
    click element  xpath=//ul[@id="completed-tasks"] // button
    page should not contain element  xpath=//li[@class="mdl-list"]