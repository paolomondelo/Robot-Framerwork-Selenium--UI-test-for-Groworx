
*** Settings ***
Library           BuiltIn
Library           OperatingSystem
Library           RequestsLibrary
Library           SeleniumLibrary




Suite Setup    Precondition
Suite Teardown    Postcondition

*** Variables ***
${iframe1}      launcher
${iframe2}     webWidget
${support_logo}     //*[@id="Embed"]/button/span[2]
${name}      //*[@id="garden-0--input"]
${email}       //*[@id="garden-2--input"]
${buyer_or_seller}     //*[@id="garden-4--input"]
${seller}      //*[@id="garden-4--input--item-Seller"]
${concern}    garden-8--input
${shipping_option}    garden-8--input--item-Shipping options


*** Test Cases ***
User should be allowed to send a contact us form
    Login to to site
    Locate and go to support contact form
    Fill up form
    Submit form
    Assert that the form has been submitted




*** Keyword ***
Precondition
    log to console     Start of testing

Postcondition
    log to console     End of testing
    delete all sessions

Login to to site
    [Tags]    PDFMINE
    Log    Opening Browser
    open browser    http://zuuki.com.ph/    chrome
    maximize browser window
    Log    Entering Credentials

Locate and go to support contact form
    select frame    ${iframe1}
    wait until page contains    Support
    wait until page contains element    ${support_logo}

Fill up form
    Sleep    5
    Click element     ${support_logo}
    unselect frame    #launcher
    select frame    ${iframe2}
    input text     ${name}    Paolo Mondelo
    input text   ${email}    paolomondelo@yahoo.com
    click element    ${buyer_or_seller}
    click element    ${seller}
    click element    ${concern}
    click element    ${shipping_option}
    input text    garden-12--input    09178978978954
    input text    garden-14--input    test only

Submit form
    click element    //*[@id="Embed"]/div/div/div/div/form/div/footer/div/button[2]
    wait until page contains element    //*[@id="Embed"]/div/div/div/div/div/footer/div/button
    click element    //*[@id="Embed"]/div/div/div/div/div/footer/div/button

Assert that the form has been submitted
    Wait Until Page Does Not Contain Element    //*[@id="Embed"]/div/div/div/div/div/footer/div/button