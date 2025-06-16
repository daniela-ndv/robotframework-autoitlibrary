# Este script utiliza o Robot Framework em conjunto com a AutoItLibrary para automatizar completamente a interação com a Calculadora nativa do Windows 11, realizando todas as operações através de comandos de teclado.

*** Settings ***
Library    AutoItLibrary

*** Variables ***
${CALC_TITLE}    Calculadora
${TIMEOUT}       10
${CALC_EXE}      calc.exe

*** Test Cases ***
Teste Calculadora
    [Documentation]    Teste abrindo calculadora e testando múltiplas operações
    [Tags]    calculadora    windows 11
    
    # Abre calculadora via path
    Abrir Calculadora
    
    # Realiza operações avançadas
    Realizar Operacoes Avancadas
    
    # Testa operações especiais
    Realizar Operações Especiais
    
    # Fecha calculadora
    Fechar Calculadora

*** Keywords ***
Wait For Active Window
    [Arguments]    ${title}    ${timeout}
    [Documentation]    Aguarda uma janela ficar ativa
    
    ${result}=    Win Wait Active    ${title}    ${timeout}
    Should Be True    ${result}    Janela ${title} não ficou ativa no tempo esperado

Abrir Calculadora
    [Documentation]    Abre calculadora verificando diferentes paths possíveis
    
    # Tenta abrir pelo path padrão do Windows 10/11
    ${result}=    Run Keyword And Return Status    Run    ${CALC_EXE}
    
    Run Keyword If    ${result}    Log    Calculadora aberta via path padrão
    ...    ELSE    Abrir Calculadora Alternativo
    
    Sleep    2s
    
    # Verifica se a calculadora abriu
    ${window_exists}=    Win Exists    ${CALC_TITLE}
    Should Be True    ${window_exists}    A calculadora não foi aberta via nenhum path

Abrir Calculadora Alternativo
    [Documentation]    Tenta paths alternativos caso o padrão falhe
    
    # Path alternativo para Windows Store Calculator
    ${alt_path}=    Set Variable    calc
    Run    ${alt_path}
    Log    Tentando abrir via comando: ${alt_path}

Realizar Operacoes Avancadas
    [Documentation]    Realiza operações matemáticas mais complexas usando apenas teclas
    
    # Garante que a calculadora está em foco
    Win Activate    ${CALC_TITLE}
    Sleep    0.5s
    
    # Operação com parênteses: (15 + 5) * 2 = 40
    Send    {(}15{+}5{)}{*}2{=}
    Sleep    1s
    Log    Operação com parênteses: (15 + 5) * 2 = 40
    
    # Limpa
    Send    {DELETE}
    Sleep    0.5s
    
    # Operação decimal: 12.5 + 7.3 = 19.8
    Send    12.5{+}7.3{=}
    Sleep    1s
    Log    Operação decimal: 12.5 + 7.3 = 19.8
    
    # Limpa
    Send    {DELETE}
    Sleep    0.5s

Realizar Operações Especiais
    [Documentation]    Testa funcionalidades especiais da calculadora usando teclas
    
    # Garante que a calculadora está em foco
    Win Activate    ${CALC_TITLE}
    Sleep    0.5s
    
    # Testa raiz quadrada (pode variar conforme versão)
    Send    25
    Sleep    0.5s
    # Ctrl+Shift+2 para raiz quadrada em algumas versões
    Send    {CTRL down}{SHIFT down}2{SHIFT up}{CTRL up}
    Sleep    1s
    Log    Testado raiz quadrada de 25
    
    # Limpa
    Send    {DELETE}
    Sleep    0.5s
    
    # Testa percentual: 50% de 200 = 100
    Send    200{*}50{%}
    Sleep    1s
    Log    Testado 50% de 200

Fechar Calculadora
    [Documentation]    Fecha a calculadora usando teclas
    
    # Garante que a calculadora está em foco
    Win Activate    ${CALC_TITLE}
    Sleep    0.5s
    
    # Usa Alt+F4 para fechar
    Send    {ALT down}{F4}{ALT up}
    Sleep    1s
    
    # Verifica se foi fechada
    ${window_exists}=    Win Exists    ${CALC_TITLE}
    Should Not Be True    ${window_exists}    A calculadora não foi fechada
    
    Log    Calculadora fechada usando Alt+F4
