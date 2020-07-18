*** Settings ***
Library  Selenium2Library

*** Variables ***
${TEXT_TO_DO}
${FIRSTLABELTEXT}
${NUM_LIST_BEFORE_CLICK}
${NUM_LIST_AFTER_CLICK}

*** Keywords ***
Navigate to TO DO TASKS Tab
    click element  ${TO_DO_TASKS_TAB}
    page should contain element  xpath=//a[@class="mdl-tabs__tab is-active"]

Confirm the added item
    ${TEXT_TO_DO} =  get text  xpath=//ul[@id="incomplete-tasks"] / li // span[contains(@id,"text-")]
    set global variable  ${TEXT_TO_DO}
    should be equal  ${TEXT_TO_DO}  ${WORD}

Check the to do list with added items
    ${numList} =  get length  ${LETTERSLIST}
    FOR  ${a}  IN RANGE  ${numList}
        ${TEXT_TO_DO} =  get text  xpath=//ul[@id="incomplete-tasks"] / li // span[@id="text-${a+1}"]
        should be equal  ${TEXT_TO_DO}  ${LETTERSLIST}[${a}]
    END

Count number of to do items
    ${NUM_LIST_BEFORE_CLICK} =  get element count  xpath=//ul[@id="incomplete-tasks"] // button
    set global variable  ${NUM_LIST_BEFORE_CLICK}

Get text of first item
    ${FIRSTLABELTEXT} =  get text  xpath=//ul[@id="incomplete-tasks"] / li[1]
    set global variable  ${FIRSTLABELTEXT}

Click on the delete button
    click element  xpath=//ul[@id="incomplete-tasks"] // button[1]

Double check that item is deleted
    page should not contain  ${FIRSTLABELTEXT}
    ${NUM_LIST_AFTER_CLICK} =  get element count  xpath=//ul[@id="incomplete-tasks"] // button
    set global variable  ${NUM_LIST_AFTER_CLICK}
    run keyword if  ${NUM_LIST_AFTER_CLICK} >= ${NUM_LIST_BEFORE_CLICK}  fatal error

Check that list is empty
    page should not contain element  xpath=//ul[@id="incomplete-tasks"] / li

Compare text in the list with the added item
    ${TEXT_TO_DO} =  get text  xpath=//ul[@id="incomplete-tasks"] / li // span[contains(@id,"text-")]
    should be equal  ${TEXT_TO_DO}  ${WORD}

Click on checkbox and check that that the item is disappear
    click element  xpath=//ul[@id="incomplete-tasks"] // label[1]
    page should not contain element  xpath=//ul[@id="incomplete-tasks"] / li