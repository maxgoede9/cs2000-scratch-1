use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

high-value-orders = table: time, amount
  row: "08:00", 10.50
  row: "10:15", 8.00
end


fun is-high-value(r :: Row) -> Boolean:
  doc: "Returns whether amount column >= 8"
  get-column(r, "amount") >= 8
where:
  is-high-value(get-row(orders, 2)) is true
  is-high-value(get-row(orders, 3)) is false 
end 

check:
  filter-with(orders, is-high-value) is 
  high-value-orders
end

order-by(orders, "amount", true)


fun is-morning(t :: String) -> Boolean:
  doc: "checks whether it is morning or not"
  if (t >= "6:00") and (t < "8:30"):
    true
    else: false
  end
   
where: 
  is-morning("8:40") is false
  # t >= "6:00" is true
  #t < "8:30" is true
   
end
