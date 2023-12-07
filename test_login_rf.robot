*** Settings ***

Library  SeleniumLibrary

Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}       Chrome
${SIGNINBUTTON}     xpath=//button/span[1]
${SIGNOUTBUTTON}          xpath=//ul[2]//div[@role='button'][2]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${MAINPAGEBUTTON}     xpath=//ul[1]//div[@role='button'][1]
${INVALID DATA CAPTION}     xpath=//span[contains(@class, 'caption')]
${LOGIN FORM}               xpath=//*[@id='__next']/form
${LANGUAGELISTBOX}      xpath=//div[2]/div/div
${POLSKIOPTIONBUTTON}       xpath=//div[3]/ul/li[1]
${ADDPLAYERBUTTON}    xpath=//*[(text()='Add player')]
${PLAYEREMAILINPUT}    xpath=//*[@name='email']
${NAMEINPUT}    xpath=//*[@name='name']
${SURNAMEINPUT}    xpath=//*[@name='surname']
${PHONEINPUT}    xpath=//*[@name='phone']
${WEIGHTIPUT}    xpath=//*[@name='weight']
${HEIGHTINPUT}    xpath=//*[@name='height']
${AGEINPUT}    xpath=//*[@name='age']
${CLUBINPUT}    xpath=//*[@name='club']
${LEVELINPUT}    xpath=//*[@name='level']
${MAINPOSITIONINPUT}    xpath=//*[@name='mainPosition']
${SECONDPOSITIONINPUT}    xpath=//*[@name='secondPosition']
${ACHIEVEMENTSINPUT}    xpath=//*[@name='achievements']
${ADDLANGUAGEBUTTON}    xpath=//*/div[2]/div/div[15]/button
${LANGUAGEINPUT}    xpath=//*/div[15]/div/div/div/input
${LACZYNASPILKAINPUT}    xpath=//*[@name='webLaczy']
${DZIEWIECDZIESIATMINUTINPUT}    xpath=//*[@name='web90']
${FACEBOOKINPUT}    xpath=//*[@name='webFB']
${ADDLINKTOYOUTUBEBUTTON}    xpath=//*/div[2]/div/div[19]/button
${LINKTOYOUTUBEINPUT}    xpath=//*/div[19]/div/div/div/input
${SUBMITBUTTON}    xpath=//*[@type='submit']
${MAINPAGEBUTTON}    xpath=//*[text()='Main page']
${MATCHESBUTTON}    xpath=//*/div/div/ul[2]/div[2]
${LEGDROPDOWN}    xpath=//*[@id='mui-component-select-leg']
${RIGHTLEG}    xpath=//li[1]
${DISTRICTDROPDOWN}    xpath=//*[@id='mui-component-select-district']
${SILESIADISTRICT}    xpath=//*[@data-value='slaskie']

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    [Teardown]    Close Browser

Log in to the system with invalid password
    Open login page
    Type in email
    Type in incorrect password
    Click on the Sign in button
    Assert password error
    [Teardown]    Close Browser

Log out of the system
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Sign out button
    Assert Login page
    [Teardown]    Close Browser

Change language to Polish
    Open login page
    Click on the Change language button
    Assert language change
    [Teardown]    Close Browser

Add player
    Open Login Page
    Type In Email
    Type In Password
    Click On The Sign In Button
    Click On Add Player Button
    Type In Players Email
    Type In Name
    Type In Surname
    Type In Phone
    Type In Weight
    Type In Height
    Type In Age
    Select Leg
    Type In Club
    Type In Level
    Type In Main Position
    Type In Second Position
    Select District
    Type In Achievements
    Click On Add Language Button
    Type In Language
    Type In Laczy Nas Pilka
    Type In 90 Minut
    Type In Facebook
    Click On Add Link To Youtube Button
    Type In Link To Youtube
    Click On Submit Button
    Assert Edit Page
    [Teardown]    Close Browser


*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}     user10@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}     Test-1234
Type in incorrect password
    Input Text    ${PASSWORDINPUT}     Test123456
Click on the Sign in button
    Click Element       ${SIGNINBUTTON}
Click on the Sign out button
    Wait Until Element Is Visible   ${MAINPAGEBUTTON}       20s
    Click Element    ${SIGNOUTBUTTON}
Assert dashboard
    Wait Until Element Is Visible       ${MAINPAGEBUTTON}       20s
    Title Should Be     Scouts panel
    Capture Page Screenshot    alert.png
Assert password error
    Wait Until Element Is Visible    ${INVALID DATA CAPTION}
    Element Text Should Be      ${INVALID DATA CAPTION}     Identifier or password invalid.
    Capture Page Screenshot     screenshots/login/password-error.png
Assert login page
    Wait Until Element Is Visible    ${LOGIN FORM}      20s
    Title Should Be     Scouts panel - sign in
    Capture Page Screenshot    screenshots/login/login-page.png
Click on the Change language button
    Click Element    ${LANGUAGELISTBOX}
    Click Element    ${POLSKIOPTIONBUTTON}
Assert language change
    Wait Until Element Is Visible    ${SIGNINBUTTON}
    Title Should Be     Scouts panel - zaloguj
Click On Add Player Button
    Wait Until Element Is Visible    ${ADDPLAYERBUTTON}    20s
    Click Element    ${ADDPLAYERBUTTON}
Type In Players Email
    Wait Until Element Is Visible    ${PLAYEREMAILINPUT}
    Input Text    ${PLAYEREMAILINPUT}    John.test@test.com
Type In Name
    Input Text    ${NAMEINPUT}    John
Type In Surname
    Input Text    ${SURNAMEINPUT}    Smith
Type In Phone
    Input Text    ${PHONEINPUT}    99999999
Type In Weight
    Input Text    ${WEIGHTIPUT}    64
Type In Height
    Input Text    ${HEIGHTINPUT}    178
Type In Age
    Input Text    ${AGEINPUT}    01.01.1999
Select Leg
    Click Element    ${LEGDROPDOWN}
    Wait Until Element Is Visible    ${RIGHTLEG}
    Click Element    ${RIGHTLEG}
Type In Club
    Input Text    ${CLUBINPUT}    FC Barca
Type In Level
    Input Text    ${LEVELINPUT}    5
Type In Main Position
    Input Text    ${MAINPOSITIONINPUT}    goalkeeper
Type In Second Position
    Input Text    ${SECONDPOSITIONINPUT}    Striker
Select District
    Click Element    ${DISTRICTDROPDOWN}
    Wait Until Element Is Visible    ${SILESIADISTRICT}
    Click Element    ${SILESIADISTRICT}
Type In Achievements
    Input Text    ${ACHIEVEMENTSINPUT}    NA
Click On Add Language Button
    Click Element    ${ADDLANGUAGEBUTTON}
Type In Language
    Input Text    ${LANGUAGEINPUT}    English
Type In Laczy Nas Pilka
    Input Text    ${LACZYNASPILKAINPUT}    www.laczynaspilka.pl
Type In 90 Minut
    Input Text    ${DZIEWIECDZIESIATMINUTINPUT}    www.90minut.pl
Type In Facebook
    Input Text    ${FACEBOOKINPUT}    www.facebook.com
Click On Add Link To Youtube Button
    Click Element    ${ADDLINKTOYOUTUBEBUTTON}
Type In Link To Youtube
    Input Text    ${LINKTOYOUTUBEINPUT}    www.youtube.com
Click On Submit Button
    Click Element    ${SUBMITBUTTON}
Assert Edit Page
    Wait Until Location Is Not    https://scouts-test.futbolkolektyw.pl/en/players/add
    Title Should Be    Edit player John Smith
    Capture Page Screenshot    alert.png