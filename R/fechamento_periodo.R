#' Obtém cotações de fechamento para uma moeda em um período específico
#'
#' Esta função consulta uma API de cotações econômicas para obter as cotações de
#' fechamento de uma moeda específica entre as datas de início e fim especificadas.
#' Os dados são retornados como um tibble, que facilita análises subsequentes.
#'
#' @param moeda Uma string que especifica o par de moedas a ser consultado,
#'   formatado como "MOEDA1-MOEDA2" (por exemplo, "EUR-BRL").
#' @param start_date Uma string que representa a data de início do período das
#'   cotações, formatada como "AAAAMMDD" (por exemplo, "20240201").
#' @param end_date Uma string que representa a data final do período das
#'   cotações, formatada como "AAAAMMDD" (por exemplo, "20240301").
#'
#' @return Retorna um tibble com as cotações de fechamento para a moeda especificada
#'   no período definido. Inclui detalhes como código da moeda, nome, data de criação
#'   da cotação e outros detalhes relevantes.
#' @export
#'
#' @examples
#' fechamento_periodo()  # Cotações de fechamento para EUR-BRL de 01/02/2024 a 01/03/2024
#' fechamento_periodo("USD-BRL", "20240101", "20240201")  # Cotações de fechamento para USD-BRL de janeiro a fevereiro de 2024

fechamento_periodo <- function(moeda = "EUR-BRL",
                               start_date = "20240201",
                               end_date = "20240301"){
  url <- "https://economia.awesomeapi.com.br/json/daily/"


  paste0(url,
         moeda , "?",
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
