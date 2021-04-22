*** Settings ***
Documentation   Elementos e Ações da Screen 'AndroidPlayHomeScreen.robot'

Library     AppiumLibrary

*** Variables ***
${AND_PLAYHOME_BTN_CONT_SKY}                    xpath=//*[@text='CONTINUAR PARA SKY']
${AND_PLAYHOME_TEXT_TODO_CONTEUDO}              id=br.com.sky.selfcare:id/2131429834
${AND_PLAYHOME_TEXT_CANAIS_AO_VIVO}             id=br.com.sky.selfcare:id/tv_title
${AND_PLAYHOME_BTN_MENU_AO_VIVO}                xpath=//*[@text='Ao Vivo']
${AND_PLAYHOME_ALERT_NOVIDADE_CRIANCADA}        id=br.com.sky.selfcare:id/2131427528
${AND_PLAY_BTN_SUBMENU_ENTRETENIMENTO}          xpath=//*[@text='Entretenimento']


*** Keywords ***
### Steps
Dado que usuario esteja na tela home do app Sky
    AppiumLibrary.Wait Until Element Is Visible       ${AND_PLAYHOME_BTN_CONT_SKY}        15
    AppiumLibrary.Click Element                       ${AND_PLAYHOME_BTN_CONT_SKY}
    AppiumLibrary.Click Element                       ${AND_PLAYHOME_ALERT_NOVIDADE_CRIANCADA}
    AppiumLibrary.Wait Until Element Is Visible       ${AND_PLAYHOME_TEXT_TODO_CONTEUDO}
    AppiumLibrary.Wait Until Element Is Visible       ${AND_PLAYHOME_TEXT_CANAIS_AO_VIVO}

Quando acessar o menu de Ao Vivo
    AppiumLibrary.Wait Until Element Is Visible       ${AND_PLAYHOME_BTN_MENU_AO_VIVO}
    AppiumLibrary.Click Element                       ${AND_PLAYHOME_BTN_MENU_AO_VIVO}

