#' Obtém cotações de fechamento para uma moeda nos últimos dias especificados
#'
#' Esta função consulta uma API de cotações econômicas para obter as cotações de
#' fechamento de uma moeda específica para o número de dias especificado.
#' Os dados são retornados como um tibble, facilitando análises e manipulações
#' subsequentes.
#'
#' @param moeda Uma string que especifica o par de moedas a ser consultado,
#'   formatado como "MOEDA1-MOEDA2" (por exemplo, "EUR-BRL").
#' @param numero_dias Um inteiro que determina o número de dias para os quais
#'   as cotações de fechamento são retornadas. Por padrão, são 15 dias.
#'
#' @return Retorna um tibble contendo as cotações de fechamento para a moeda
#'   especificada ao longo dos dias indicados. As colunas incluem código da moeda,
#'   nome, data de criação da cotação e outros detalhes relevantes.
#' @export
#'
#' @examples
#' fechamento_dias()  # Retorna as últimas 15 cotações de fechamento para EUR-BRL
#' fechamento_dias("USD-BRL", 30)  # Retorna as últimas 30 cotações de fechamento para USD-BRL

fechamento_dias <- function(moeda = "EUR-BRL",
                            numero_dias = 15){
  url <- "https://economia.awesomeapi.com.br/json/daily/"


  paste0(url,
         moeda , "/",
         numero_dias) %>%
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
