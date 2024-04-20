#' Obtém a última cotação disponível para uma moeda específica
#'
#' Esta função realiza uma consulta à API de cotações econômicas para obter a última
#' cotação disponível para a moeda especificada. Os dados são processados e devolvidos
#' como um tibble, facilitando análises e manipulações subsequentes.
#'
#' @param moeda Uma string que especifica o par de moedas a ser consultado,
#'   formatado como "MOEDA1-MOEDA2" (por exemplo, "USD-BRL").
#'
#' @return Retorna um tibble contendo a última cotação disponível para a moeda
#'   especificada. Inclui detalhes como código da moeda, nome, data de criação
#'   da cotação e outros detalhes relevantes.
#' @export
#'
#' @examples
#' ultima_cotacao()  # Última cotação disponível para USD-BRL
#' ultima_cotacao("EUR-BRL")  # Última cotação disponível para EUR-BRL
ultima_cotacao <- function(moeda = "USD-BRL"){
  url <- "https://economia.awesomeapi.com.br/json/last/"


  paste0(url, moeda)%>%
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
