# Desafio Sky
Automação de Testes Web, Mobile e API usando Robot Framework.

## Requerimentos  
- Python 3
- Robot Framework 4
- Lybraries: SeleniumLibrary, AppiumLibrary e RequestsLibrary   
- O arquivo ChromeDriver deve ser da mesma versão do navegador Chrome, e o mesmo deve estar configurado na variável PATH do Windows
- Appium
- Ter o aplicativo 'SKY: A gente se diverte junto!' instalado no dispositivo móvel

### Execução
digite no prompt de comando "robot -d ./results -i "web" sky-tests" para executar os testes do escopo Web
digite no prompt de comando "robot -d ./results -i "api" sky-tests" para executar os testes do escopo API
digite no prompt de comando "robot -d ./results -i "mobile" sky-tests" para executar os testes do escopo Mobile Android

___________________________________________________

#### Observações:
- Para a execução dos testes mobile, é necessário inicializar o servidor do Appium Client na porta 4723
- Na estrutura raiz do projeto, está presente a pasta "sky-tests" que contempla todas as suites de testes
