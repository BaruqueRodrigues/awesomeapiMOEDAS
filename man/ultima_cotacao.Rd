% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ultima_cotacao.R
\name{ultima_cotacao}
\alias{ultima_cotacao}
\title{Obtém a última cotação disponível para uma moeda específica}
\usage{
ultima_cotacao(moeda = "USD-BRL")
}
\arguments{
\item{moeda}{Uma string que especifica o par de moedas a ser consultado,
formatado como "MOEDA1-MOEDA2" (por exemplo, "USD-BRL").}
}
\value{
Retorna um tibble contendo a última cotação disponível para a moeda
especificada. Inclui detalhes como código da moeda, nome, data de criação
da cotação e outros detalhes relevantes.
}
\description{
Esta função realiza uma consulta à API de cotações econômicas para obter a última
cotação disponível para a moeda especificada. Os dados são processados e devolvidos
como um tibble, facilitando análises e manipulações subsequentes.
}
\examples{
ultima_cotacao()  # Última cotação disponível para USD-BRL
ultima_cotacao("EUR-BRL")  # Última cotação disponível para EUR-BRL
}
