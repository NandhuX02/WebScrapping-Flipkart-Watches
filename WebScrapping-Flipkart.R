library(robotstxt)
library(rvest)

#scrapping websites
url <- "https://www.flipkart.com/search?q=watch&otracker=search&otracker1=search&marketplace=FLIPKART&as-show=on&as=off&p%5B%5D=facets.rating%255B%255D%3D4%25E2%2598%2585%2B%2526%2Babove&sort=price_desc&p%5B%5D=facets.price_range.from%3DMin&p%5B%5D=facets.price_range.to%3D2000&p%5B%5D=facets.brand%255B%255D%3DFastrack&p%5B%5D=facets.ideal_for%255B%255D%3DMen%2B%2526%2BWomen"

#allowability
path = paths_allowed(url)

#HTML elements from website
web <- read_html(url)

#segregating brand
brand <- web %>% html_nodes("._2WkVRV") %>%html_text()
View(brand)

#segregating cost
cost <- web %>% html_nodes("._30jeq3") %>%html_text()
View(cost)

#segregating model
model <- web %>% html_nodes(".IRpwTa") %>%html_text()
View(model)

#segregating delivery
delivery <- web %>% html_nodes("._2AaDRY ._2Tpdn3") %>%html_text()
View(delivery)

#creating dataframe
watches <- data.frame(brand, cost, model, delivery)
View(watches)

#saving data
write.csv(watches,"watch.csv")

