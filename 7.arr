use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv


table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Yoga", 45
  row: "2026-04-03", "Cycling", 60
end

workouts = 
  table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Yoga", 45
  row: "2026-04-03", "Cycling", 60
end


recipes = load-table:
  title :: String, servings :: Number, time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end

#get-row(recipes, 0)-> first line
#get-coloumn(get-row(recipes, 0) "serving")
#mean(workouts, "duration")


birthrate = load-table:
  gss-code :: Number,
  gss-name :: String,
  year-ending-date :: Number,
  measure :: String,
  geography :: String,
  source :: String,
  sex :: String,
  value :: Number
  
  source: csv-table-url("https://data.london.gov.uk/download/2lw83/vkz/annual_births.csv", default-options)
end
