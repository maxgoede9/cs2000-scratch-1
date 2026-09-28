use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
  row: "Dragon Shield",           5,  12
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
  end

fun calc-dist(r :: Row) -> Number:
  doc: "calculates distance to origin using fields 'x-coordinates' and 'y-coordinates'"
  num-sqrt(num-sqr(get-column(r, 'x-coordinate')) + num-sqr(get-column(r, 'y-coordinate')))
where:
  calc-dist(get-row(items, 2))is-roughly 13
end

items-with-dist = build-column(items, "distance", calc-dist)


fun sub1(n :: Number) -> Number:
  
  doc:"substracts 1 from input"
  n - 1
where:
  sub1(10) is 9
  sub1(13) is 12
  sub1(-4) is -5
end


items-shifted = transform-column(items, "x-coordinate", sub1) 


fun sub10(f :: Number) -> Number:
  
  doc:"subtracts 10% of the value of the x and y coordinate"
  
  f * 0.90
  
where:
  sub10(10) is 9
  sub10(100) is 90
end

items-sub10x = transform-column(items, "x-coordinate", sub10)

items-sub10xy = transform-column(items-sub10x, "y-coordinate", sub10)

#Dragon Shield is the closest


fun calc-dist10(f :: Row) -> Number:
  doc: "calculates distance to origin using fields 'x-coordinates' and 'y-coordinates'"
  num-sqrt(num-sqr(get-column(f, 'x-coordinate')) + num-sqr(get-column(f, 'y-coordinate')))
where:
  calc-dist10(get-row(items-sub10xy, 2))is-roughly 11.7
end

items-with-dist10 = build-column(items-sub10xy, "distance", calc-dist10)

items-rational-dist = transform-column(items-with-dist10, "distance", num-to-rational)

#order-by(items-rational-dist,"distance", true)

fun obfuscate(r :: String) -> String:
  doc: "Converts the number of the letters of the item to an equal number of 'X'"
  
  string-repeat("X", (string-length(r)))
end

item-names = transform-column(items-rational-dist, "item", obfuscate)


employees = load-table:
  
  #ddddd
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv",default-options)
    
end

