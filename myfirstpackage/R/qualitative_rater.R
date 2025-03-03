#' @export
qualitative_rater <- function(content,
                              ratings,
                              system_prompt,
                              threadPool) {

  # Prepare the request body using the provided texts and parameters.
  endpoint = "https://qualitiative-analysis.onrender.com/quali-rater"



  body <- list(
    column = content,
    ratings = ratings,
    SystemPrompt = system_prompt,
    ThreadPoolExecutor = threadPool
  )

  # Convert the list to JSON.
  json_body <- toJSON(body, auto_unbox = TRUE)

  # Send the POST request.
  response <- POST(endpoint,
                   body = json_body,
                   encode = "json",
                   content_type_json())

  # Parse the response.
  output <- content(response, "parsed")

  # Extract and return the ratings vector.
  ratings_vector <- unlist(output$output)
  return(ratings_vector)
}


