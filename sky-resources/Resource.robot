*** Settings ***
Documentation   Keywords básicas para o Setup e Teardown relacionadas os cenários de todos os escopos de testes da Sky. 

Library     SeleniumLibrary
Library     AppiumLibrary
Library     RequestsLibrary

*** Variables ***
${BROWSER}      chrome
${URL_BASE_API_WEATHER}         http://api.openweathermap.org/data/2.5/
${URL_BASE_API_SWAPI}           https://swapi.dev/api/

*** Keywords ***
### Setup e Teardown dos fluxos Web
Abrir navegador
    Open Browser    about:blank      ${BROWSER}
    Delete All Cookies
    Maximize Browser Window

Fechar navegador
    Close Browser

### Setup e Teardown dos fluxos Mobile Android
Abrir Sessão Android
    Open Application        http://localhost:4723/wd/hub
    ...                     automationName=UiAutomator2
    ...                     platformName=Android
    ...                     deviceName=emulator-5554
    ...                     appPackage=br.com.sky.selfcare
    ...                     appActivity=br.com.sky.selfcare.features.main.launch.LaunchActivity
    ...                     adbExecTimeout=60000

Fechar Sessão Android
    Close Application

### Setup e Teardown dos fluxos API
Conectar a API SWAPI
    Create Session      SWAPI       ${URL_BASE_API_SWAPI}
    ${HEADERS}     Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}

Conectar a API Weather
    Create Session      WEATHER       ${URL_BASE_API_WEATHER}
    ${HEADERS}     Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}