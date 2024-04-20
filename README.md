
<!-- README.md is generated from README.Rmd. Please edit that file -->

# awesomeapiMOEDAS

`awesomeapiMOEDAS` é um pacote R wrapper do site
[awesomeapi](https://docs.awesomeapi.com.br/api-de-moedas#retorna-cotacoes-sequenciais-de-uma-unica-moeda)
desenvolvido por Baruque Rodrigues, destinado a facilitar a obtenção de
cotações econômicas de diversas moedas utilizando a API AwesomeAPI. Este
pacote é ideal para analistas financeiros, economistas e desenvolvedores
que necessitam de dados atualizados de cotações de moedas para análise,
relatórios ou aplicações em tempo real.

## Instalação

Você pode instalar a versão mais recente deste pacote diretamente do
GitHub utilizando o `devtools`:

Instale o pacote devtools caso ainda não tenha instalado

``` r
if(!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")
```

## **Funções Principais**

O pacote inclui várias funções úteis para acessar e manipular dados de
cotações de moedas:

- **`fechamento_dias(moeda, numero_dias)`**: Retorna as cotações de
  fechamento dos últimos dias especificados para a moeda desejada.

- **`fechamento_periodo(moeda, start_date, end_date)`**: Obtém cotações
  de fechamento para uma moeda em um intervalo de datas específico.

- **`ultima_cotacao(moeda)`**: Recupera a última cotação disponível para
  uma moeda específica.

### **Exemplos de Uso**

Abaixo, alguns exemplos de como utilizar as funções do pacote:

Obter as últimas 15 cotações de fechamento para o Euro em relação ao
Real

``` r
library(awesomeapiMOEDAS)

fechamento_dias(numero_dias = "EUR-BRL",
                moeda =  15)
```

Obter cotações de fechamento para o Dólar em relação ao Real entre
01/02/2024 e 01/03/2024

``` r
fechamento_periodo("USD-BRL",
                   end_date =  "20240201",
                   start_date = "20240301")
```

Recuperar a última cotação disponível para o Euro em relação ao Real

``` r
ultima_cotacao(moeda = "EUR-BRL")
```

## **Contato**

Para mais informações, dúvidas ou sugestões, não hesite em entrar em
contato com Baruque Rodrigues através do e-mail:
quemuel.baruque@ufpe.br.

Esperamos que o pacote **`awesomeapiMOEDAS`** ajude você a acessar
facilmente os dados econômicos de que precisa para suas análises e
aplicações!
