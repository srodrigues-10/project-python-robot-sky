*** Settings ***
Documentation   Cenários de Testes da Sky referentes ao escopo Web

### Realizando a importação do arquivo base, Resource.robot
Resource        ../sky-resources/Resource.robot

### Realizando a importação dos arquivos Page dos cenários Web
Resource        ../sky-resources/web/resources/pages/HomePage.robot
Resource        ../sky-resources/web/resources/pages/ProgramacaoPage.robot

### Setup e Teardown
Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***
Cenário 01: Validar programação atual
    [Tags]      web    done
    Dado que usuario esteja na pagina home da Sky
    Quando acessar o menu de Programacao
    E selecionar a programacao atual
    Então deve validar o titulo da programacao atual e horarios na modal