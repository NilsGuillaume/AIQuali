# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   https://r-pkgs.org
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'




# Define the endpoint URL
url <- "https://qualitiative-analysis.onrender.com/quali-rater"



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




















