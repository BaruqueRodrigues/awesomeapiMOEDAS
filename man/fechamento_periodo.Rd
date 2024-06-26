% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fechamento_periodo.R
\name{fechamento_periodo}
\alias{fechamento_periodo}
\title{Obtém cotações de fechamento para uma moeda em um período específico}
\usage{
fechamento_periodo(
  moeda = "EUR-BRL",
  start_date = "20240201",
  end_date = "20240301"
)
}
\arguments{
\item{moeda}{Uma string que especifica o par de moedas a ser consultado,
formatado como "MOEDA1-MOEDA2" (por exemplo, "EUR-BRL").}

\item{start_date}{Uma string que representa a data de início do período das
cotações, formatada como "AAAAMMDD" (por exemplo, "20240201").}

\item{end_date}{Uma string que representa a data final do período das
cotações, formatada como "AAAAMMDD" (por exemplo, "20240301").}
}
\value{
Retorna um tibble com as cotações de fechamento para a moeda especificada
no período definido. Inclui detalhes como código da moeda, nome, data de criação
da cotação e outros detalhes relevantes.
}
\description{
Esta função consulta uma API de cotações econômicas para obter as cotações de
fechamento de uma moeda específica entre as datas de início e fim especificadas.
Os dados são retornados como um tibble, que facilita análises subsequentes.
}
\examples{
fechamento_periodo()  # Cotações de fechamento para EUR-BRL de 01/02/2024 a 01/03/2024
fechamento_periodo("USD-BRL", "20240101", "20240201")  # Cotações de fechamento para USD-BRL de janeiro a fevereiro de 2024
}
