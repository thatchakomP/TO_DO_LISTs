*** Settings ***
Library  Selenium2Library

*** Variables ***
${WORD}
@{LETTERSLIST}

*** Keywords ***
Navigate to ADD ITEMS Tabs
    ${WORD} =  Generate Random String  10  [UPPER][NUMBER]
    set global variable  ${WORD}
    click element  ${ADD_ITEMS_TABS}
    page should contain element  xpath=//a[@class="mdl-tabs__tab is-active"]

Add item
    click element  ${INPUT_TEXT_FIELD}
    input text  ${INPUT_TEXT_FIELD}  ${WORD}

Click add button
    click element  ${ADD_BUTTON}

Add multiple items
    @{LETTERSLIST} =  create list
    set global variable  @{LETTERSLIST}
    FOR  ${i}  IN RANGE  3
        ${word} =  Generate Random String  17  [LETTERS]
        append to list  ${LETTERSLIST}  ${WORD}
        click element  ${ADD_ITEMS_TABS}
        page should contain element  xpath=//a[@class="mdl-tabs__tab is-active"]
        click element  ${INPUT_TEXT_FIELD}
        input text  ${INPUT_TEXT_FIELD}  ${WORD}
        click element  ${ADD_BUTTON}
    END