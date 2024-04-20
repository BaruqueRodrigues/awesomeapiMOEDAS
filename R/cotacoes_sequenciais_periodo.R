#' Obtém cotações sequenciais de uma moeda para um determinado período
#'
#' Esta função consulta uma API de cotações econômicas para obter uma sequência
#' de cotações para a moeda especificada. Os dados são retornados como um
#' tibble onde cada linha representa uma cotação em um momento específico.
#'
#' @param moeda Uma string que indica o par de moedas de interesse, no formato
#'   "MOEDA1-MOEDA2". Por exemplo, "EUR-BRL" para o par Euro e Real brasileiro.
#'   O valor padrão é "EUR-BRL".
#' @param numero_resultados Um inteiro que indica o número de resultados a ser
#'   retornado pela API. O valor padrão é 15.
#'
#' @return Um tibble contendo as cotações da moeda para os períodos solicitados.
#' @export
#'
#' @examples
#' cotacoes_sequenciais_periodo()  # Retorna as últimas 15 cotações para EUR-BRL
#' cotacoes_sequenciais_periodo("USD-BRL", 10)  # Retorna as últimas 10 cotações para USD-BRL

cotacoes_sequenciais_periodo <- function(moeda = "EUR-BRL",
                                         numero_resultados = 15){
  url <- "https://economia.awesomeapi.com.br/"


  paste0(url,
         moeda , "/",
         numero_resultados) %>%
    jsonlite::fromJSON() %>%
    dplyr::tibble(data =.) %>%
    tidyr::unnest_wider(data) %>%
    dplyr::mutate(
      create_date = lubridate::ymd_hms(create_date),
      dplyr::across(c(code:name, create_date),
                    ~ dplyr::coalesce(., dplyr::first(.[!is.na(.)]))
      )
    )

}
