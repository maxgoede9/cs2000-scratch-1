use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

weather-data =
  table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, -1
    row: "2025-01-05", 90, 0
  end

fun norm-temp(v) -> Number:
  doc:"given a number or a string that represents a number, convert to number"
  
  if is-string(v):
    string-to-number-unsafe(v)
  else:
    v
  end
  
where:
  norm-temp(10) is 10
  norm-temp("10") is 10
end

weather-norm = transform-column(weather-data, "temperature", norm-temp)


fun temp-cat(r :: Number) -> String:
  doc:"for value <40 results in 'cold', between 40 and 60 in 'mild', above 60 'hot' "
  if r < 40:
    "cold"
  else if r < 60:
    "mild"
  else:
    "hot"
  end
where:
  
  temp-cat(20) is "cold"
  temp-cat(45) is "mild"
  temp-cat(65) is "hot"
end 

  
  
  
weather-chart = build-column(weather-norm, "category", lam(r :: Row): temp-cat(get-column(r, "temperature")) end)


freq-bar-chart(weather-chart, "temperature")

employees =
  table: full-name :: String, department :: String
    row: "Jordan Smith", "Sales"
    row: "Alexandra Lee", "Engineering"
    row: "Sam", "Marketing"
    row: "Alice Ng", "Operations"
  end


fun first-name(n :: String)-> String:
  doc:"takes the first name out of the full-name column"
  
  ...
  
where:
  first-name("Jordan Smith") is "Jordan"
  first-name("Sam") is "Sam"
  first-name("Alice Ng") is "Alice"
end

#build-column(transform-column(employees, full-name, first-name), employees , "first-name")  