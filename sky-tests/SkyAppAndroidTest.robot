*** Settings ***
Documentation   Cenários de Testes da Sky referentes ao escopo Mobile Android

### Realizando a importação do arquivo base, Resource.robot
Resource        ../sky-resources/Resource.robot

### Realizando a importação dos arquivos Screen dos cenários Mobile Android
Resource        ../sky-resources/mobile/resources/screens/AndroidPlayHomeScreen.robot
Resource        ../sky-resources/mobile/resources/screens/AndroidPlayAoVivoScreen.robot

### Setup e Teardown
Test Setup      Abrir Sessão Android
Test Teardown   Fechar Sessão Android

*** Test Cases ***
Cenário 01: Validar programação atual mobile appium
    [tags]          mobile     done
    Dado que usuario esteja na tela home do app Sky
    Quando acessar o menu de Ao Vivo
    E acessar o submenu Entretenimento
    E selecionar a primeira programacao atual do submenu Entretenimento para exibição do detalhamento
    Então deve validar o titulo da programação atual no detalhamento