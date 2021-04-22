*** Settings ***
Documentation   Keywords dos cenários da API Weather

Library             RequestsLibrary
Library             Collections

*** Variables ***
${TOKEN_API_WEATHER}            c21f45524ab916fdb09557f7a1caafce

*** Keywords ***
Requisitar os dados do clima da cidade
    [Arguments]     ${DESC_CIDADE}
    Set Test Variable       ${DESC_CIDADE}
    ${RESPOSTA}     GET On Session     WEATHER      weather/    params=q=${DESC_CIDADE},BR&appid=${TOKEN_API_WEATHER}
    Set Test Variable      ${RESPOSTA}
    Log     ${RESPOSTA.text}

Validar os dados do atributo name do clima retornado
    Dictionary Should Contain Item      ${RESPOSTA.json()}      name        ${DESC_CIDADE}

Validar os dados do atributo sys.country do clima retornado
    Dictionary Should Contain Item      ${RESPOSTA.json()["sys"]}      country        BR

