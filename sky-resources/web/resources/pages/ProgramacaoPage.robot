*** Settings ***
Documentation   Elementos e Ações da Page 'ProgramacaoPage.robot'

Library    SeleniumLibrary

*** Variables ***
${PROGRAMACAO_TXT_TITULO_PROGRAMACAO}           xpath=//*[@class='gadget_title_area clearfix']//*[text()='Programação']
${PROGRAMACAO_BTN_PROGRAMACAO_ATUAL}            xpath=//div[@class='virtual-list']//div[@class='channel-schedule-container'][1]//div[@class='schedule-inner schedule-live']
${PROGRAMACAO_TXT_TITULO_PROG_ATUAL}            xpath=//div[@class='virtual-list']//div[@class='channel-schedule-container'][1]//div[@class='schedule-inner schedule-live']//h2[@class='program-schedule-title']
${PROGRAMACAO_TXT_HORARIO_PROG_ATUAL}           xpath=//div[@class='virtual-list']//div[@class='channel-schedule-container'][1]//div[@class='schedule-inner schedule-live']//div[@class='program-duration']/p
${PROGRAMACAO_TXT_MODAL_TITULO_PROG_ATUAL}      class=sky-modal-program-title
${PROGRAMACAO_TXT_MODAL_HORA_PROG_ATUAL}        class=sky-modal-program-date-time

*** Keywords ***
### Ações de Apoio
Capturar titulo e horario da programacao atual
    ${TITULO_PROG_ATUAL}        SeleniumLibrary.Get Text    ${PROGRAMACAO_TXT_TITULO_PROG_ATUAL}
    Set Test Variable       ${TITULO_PROG_ATUAL}
    Log                     ${TITULO_PROG_ATUAL}
    ${HORARIO_PROG_ATUAL}       SeleniumLibrary.Get Text    ${PROGRAMACAO_TXT_HORARIO_PROG_ATUAL}
    Set Test Variable       ${HORARIO_PROG_ATUAL}
    Log                     ${HORARIO_PROG_ATUAL}

### Steps
E selecionar a programacao atual
    SeleniumLibrary.Wait Until Page Contains Element    ${PROGRAMACAO_TXT_TITULO_PROG_ATUAL}
    SeleniumLibrary.Scroll Element Into View            ${PROGRAMACAO_TXT_TITULO_PROG_ATUAL}
    Capturar titulo e horario da programacao atual
    SeleniumLibrary.Click Element                       ${PROGRAMACAO_BTN_PROGRAMACAO_ATUAL}

Então deve validar o titulo da programacao atual e horarios na modal
    SeleniumLibrary.Wait Until Element Is Visible   ${PROGRAMACAO_TXT_MODAL_TITULO_PROG_ATUAL}
    SeleniumLibrary.Wait Until Element Is Visible   ${PROGRAMACAO_TXT_MODAL_HORA_PROG_ATUAL}
    SeleniumLibrary.Element Text Should Be      ${PROGRAMACAO_TXT_MODAL_TITULO_PROG_ATUAL}      ${TITULO_PROG_ATUAL}
    SeleniumLibrary.Element Text Should Be      ${PROGRAMACAO_TXT_MODAL_HORA_PROG_ATUAL}        ${HORARIO_PROG_ATUAL}