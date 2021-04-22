*** Settings ***
Documentation   Cenários de Testes da Sky referentes ao escopo API

### Realizando a importação do arquivo base, Resource.robot
Resource        ../sky-resources/Resource.robot

### Realizando a importação dos arquivos de Keywords dos cenários API Swapi
Resource        ../sky-resources/api/resources/SwuapiKeywords.robot

### Realizando a importação dos arquivos de Keywords dos cenários API Weather
Resource        ../sky-resources/api/resources/WeatherKeywords.robot


*** Test Cases ***
Buscar a listagem de todas as pessoas da star wars
    [tags]          api     swapi      done
    [Setup]         Conectar a API SWAPI 
    Requisitar todas as pessoas
    Conferir o status code      200
    Conferir se retornou uma lista com "4" pessoas

Validar o atributo nome da primeira pessoa da star wars
    [tags]          api     swapi      done
    [Setup]         Conectar a API SWAPI
    Requisitar os dados da 1 pessoa
    Conferir o status code      200
    Conferir que o atributo nome não está vazio

Buscar dados do clima de uma determinada cidade
    [tags]          api     weather      done
    [Setup]         Conectar a API Weather
    Requisitar os dados do clima da cidade       Fortaleza
    Conferir o status code      200
    Validar os dados do atributo name do clima retornado
    Validar os dados do atributo sys.country do clima retornado
