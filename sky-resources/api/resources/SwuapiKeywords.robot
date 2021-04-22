*** Settings ***
Documentation   Keywords dos cenários da API Swapi
Library             RequestsLibrary
Library             Collections


*** Keywords ***
Requisitar todas as pessoas
    ${RESPOSTA}     GET On Session     SWAPI      people/
    Set Test Variable      ${RESPOSTA}
    Log     ${RESPOSTA.text}

Requisitar os dados da ${ID_PESSOA} pessoa
    ${RESPOSTA}     GET On Session     SWAPI      people/${ID_PESSOA}
    Set Test Variable      ${RESPOSTA}
    Log     ${RESPOSTA.text}

Conferir o status code
    [Arguments]     ${STATUS_CODE_DESEJADO}
    Should Be Equal As Strings      ${RESPOSTA.status_code}     ${STATUS_CODE_DESEJADO}

Conferir se retornou uma lista com "${QTD_PESSOAS}" pessoas
    Length Should Be    ${RESPOSTA.json()}      ${QTD_PESSOAS}

Conferir que o atributo nome não está vazio
    Should Not Be Empty    ${RESPOSTA.json()["name"]}