list.of.packages <- c("jsonlite","httr","purrr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
lapply(list.of.packages, require, character.only=T)


# Change WD to git repo if needed
wd = "~/git/datahub-api-documentation"
setwd(wd)

url = "http://212.111.41.68:3000/graphql"

GQL <- function(query,
                .variables = NULL, 
                .operationName = NULL, 
                .url = url){
  pbody <- list(query = query, variables = .variables, operationName = .operationName)
  res <- POST(.url, body = pbody, encode="json")
  res <- content(res, as = "parsed", encoding = "UTF-8")
  if(!is.null(res$errors)){
    warning(toJSON(res$errors))
  }
  return(res$data)
}

query = '{
    mapData(id: "data_series.largest_intl_flow") {
      map {
        id
        name
        color
        year
        detail
        value
        slug
      }
    }
  }'

result = GQL(query)

largest_intl_flow = result$mapData$map %>% map_df(simplify_all)
