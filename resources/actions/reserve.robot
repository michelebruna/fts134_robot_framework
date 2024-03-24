*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary

*** Variables ***
${num}  3

*** Keywords ***
Selecionar o primeiro voo da lista
    wait until element is enabled   class = btn.btn-small   30
    click button                    class = btn.btn-small

Selecionar o voo numero "${num}"
    [Arguments] ${num}
    ${selector} Set Variable xpath=//table[@class='table']//tbody//tr[${num}]//input
    wait until element is enabled ${selector} 5
    click element ${selector}

Validar o titulo de origem e destino
    [Arguments] ${origem}   ${destino}
    element should contain  xpath = //h3    Flights from ${origem} to ${destino}: