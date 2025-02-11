auth_env <- new.env()

auth_env$BASE_URL <- "https://accounts.zoho.com"

#' Função para buscar o access token
#'
#' @description
#' O access token é usado para manipular dados no Zoho.
#'
#' @param client_id ID do Cliente
#' @param client_secret secret code do Cliente
#' @param refresh_token token usado para geração de access tokens
#'
#' @export
get_access_token <- function(client_id, client_secret, refresh_token){
  # url para fazer o refresh token
  url <- glue("{auth_env$BASE_URL}/oauth/v2/token?refresh_token={refresh_token}&client_id={client_id}&client_secret={client_secret}&grant_type=refresh_token")

  # request the access token
  response_data <- request(url) |>
    req_method("POST") |>
    req_perform() |>
    resp_body_json()

  # returns the access token
  # TODO: retornar em quanto tempo expira o token
  return(response_data$access_token)
}
