*** Settings ***
Documentation   Elementos e Ações da Page 'HomePage.robot'

Library    SeleniumLibrary

*** Variables ***
${HOME_URL}                             https://www.sky.com.br/
${HOME_BTN_FECHAR_MODAL_BEM_VINDO}      xpath=//button[@class='close' and @data-gtm='3']
${HOME_LNK_PROGRAMACAO}                 link=Programação
${HOME_ACEITAR_COOKIES_SEC}             css=button[class='btn buttonSecondary btn-block btn-ok-cookie']

*** Keywords ***
### Ações de Apoio
Aceitar Cookies na Home
    SeleniumLibrary.Wait Until Page Contains Element    ${HOME_ACEITAR_COOKIES_SEC}
    SeleniumLibrary.Scroll Element Into View            ${HOME_ACEITAR_COOKIES_SEC}
    SeleniumLibrary.Click Element                       ${HOME_ACEITAR_COOKIES_SEC}

### Steps
Dado que usuario esteja na pagina home da Sky
    SeleniumLibrary.Go To               ${HOME_URL}
    SeleniumLibrary.Click Element       ${HOME_BTN_FECHAR_MODAL_BEM_VINDO}
    Aceitar Cookies na Home

Quando acessar o menu de Programacao
    SeleniumLibrary.Click Element       ${HOME_LNK_PROGRAMACAO}
