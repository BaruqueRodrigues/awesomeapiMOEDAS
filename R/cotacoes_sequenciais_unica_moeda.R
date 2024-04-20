#' Obtém cotações sequenciais de uma única moeda para um intervalo específico
#'
#' Esta função consulta uma API de cotações econômicas para obter uma sequência
#' de cotações para a moeda especificada dentro de um intervalo de datas definido.
#' Os dados são retornados como um tibble onde cada linha representa uma cotação
#' em um momento específico.
#'
#' @param moeda Uma string que indica o par de moedas de interesse, no formato
#'   "MOEDA1-MOEDA2". Por exemplo, "EUR-BRL" para o par Euro e Real brasileiro.
#'   O valor padrão é "EUR-BRL".
#' @param numero_resultados Um inteiro que indica o número de resultados a ser
#'   retornado pela API. O valor padrão é 15.
#' @param start_date Uma string que representa a data de início do período das
#'   cotações, no formato "AAAAMMDD". Por exemplo, "20240201" representa 1 de
#'   fevereiro de 2024. O valor padrão é "20240201".
#' @param end_date Uma string que representa a data final do período das
#'   cotações, no formato "AAAAMMDD". Por exemplo, "20240301" representa 1 de
#'   março de 2024. O valor padrão é "20240301".
#'
#' @return Um tibble contendo as cotações da moeda para os períodos solicitados,
#'   incluindo datas específicas, códigos e nomes da moeda.
#' @export
#'
#' @examples
#' cotacoes_sequenciais_unica_moeda()  # Retorna as cotações de EUR-BRL do período de 01/02/2024 a 01/03/2024
#' cotacoes_sequenciais_unica_moeda("USD-BRL", 10, "20240101", "20240201")  # Retorna 10 cotações de USD-BRL de 01/01/2024 a 01/02/2024

cotacoes_sequenciais_unica_moeda <- function(moeda = "EUR-BRL",
                                             numero_resultados = 15,
                                             start_date = "20240201",
                                             end_date = "20240301"){
  url <- "https://economia.awesomeapi.com.br/"


  paste0(url,
         moeda , "/",
         numero_resultados,"?",
         "start_date=", start_date, "&",
         "end_date=",end_date
  ) %>%
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
