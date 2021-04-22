*** Settings ***
Documentation   Elementos e Ações da Screen 'AndroidPlayAoVivoScreen.robot'

Library     AppiumLibrary

*** Variables ***
${AND_PLAY_BTN_SUBMENU_ENTRETENIMENTO}          xpath=//*[@text='Entretenimento']
${AND_PLAY_ENTRET_DESC_PROGRAMACAO_ATUAL}       xpath=//*[@resource-id='br.com.sky.selfcare:id/2131430395']/android.view.ViewGroup[2]//android.widget.TextView[@resource-id='br.com.sky.selfcare:id/2131431105']
${AND_PLAY_ENTRET_PROGRAMACAO_ATUAL}            xpath=//*[@resource-id='br.com.sky.selfcare:id/2131430395']/android.view.ViewGroup[2]
${AND_PLAY_ENTRET_DET_DESC_PROG_ATUAL}          xpath=//*[@resource-id='br.com.sky.selfcare:id/2131430271']/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.TextView
${AND_PLAY_ENTRET_DET_TEXT_HORARIOS_NA_TV}      xpath=//*[@text='Horários na TV']

*** Keywords ***
### Steps
E acessar o submenu Entretenimento
    AppiumLibrary.Wait Until Element Is Visible       ${AND_PLAY_BTN_SUBMENU_ENTRETENIMENTO}        10
    AppiumLibrary.Click Element                       ${AND_PLAY_BTN_SUBMENU_ENTRETENIMENTO}

E selecionar a primeira programacao atual do submenu Entretenimento para exibição do detalhamento
    AppiumLibrary.Wait Until Element Is Visible             ${AND_PLAY_ENTRET_DESC_PROGRAMACAO_ATUAL}   15
    ${TITULO_PROG_ATUAL}        AppiumLibrary.Get Text      ${AND_PLAY_ENTRET_DESC_PROGRAMACAO_ATUAL}
    Set Test Variable       ${TITULO_PROG_ATUAL}
    Log                     ${TITULO_PROG_ATUAL}
    AppiumLibrary.Click Element                             ${AND_PLAY_ENTRET_PROGRAMACAO_ATUAL}

Então deve validar o titulo da programação atual no detalhamento
    AppiumLibrary.Wait Until Element Is Visible             ${AND_PLAY_ENTRET_DET_TEXT_HORARIOS_NA_TV}      10
    Sleep   2
    AppiumLibrary.Swipe By Percent      50      90      50        50
    Sleep   2
    AppiumLibrary.Element Text Should Be      ${AND_PLAY_ENTRET_DET_DESC_PROG_ATUAL}      ${TITULO_PROG_ATUAL}
