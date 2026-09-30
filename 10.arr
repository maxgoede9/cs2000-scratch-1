use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


fun subtract-1(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  n - 1
where:
  subtract-1(10) is 9
  subtract-1(0) is -1
  subtract-1(-3.5) is -4.5
end


bo = table: x-coord :: Number, y-coord :: Number
  row: 1, 2
  row: 3, 4
end
transform-column(bo, "x-coord", lam(n :: Number) -> Number: n - 1 end)

fun apply-discount( t :: Table ) -> Table:
  doc:"reduces 'price' column by 20%"
  
  transform-column(t, "price", lam(p): p * 0.8 end)
  
where:
  test-table = table: price :: Number
    row: 50
    row: 100
  end
  
  test-output = table: price :: Number
    row: 40
    row: 80
  end
  
  apply-discount(test-table) is test-output
end

#Design a function that takes a table that has a "price" column and adds a new column "tax", which is the sales tax amount (look up the sales tax where you are; to calculate the sales tax rate, multiply that by the price. If you live somewhere with no sales tax, you can use 5%). You can assume there is not already a tax column.

#Create a function to carry out the "obfuscation" exercise from last class, and write tests for it. Note, your test tables should only need an "item" column!



#0.0625%

fun take-tax( tab :: Table) -> Table:
  doc: "takes 6.25% Tax to the price"
  
  tax * 0.9375
  
where:
  take-tax(100) is 93.75
  
  price-tax = table: price :: Number
  row: 30
  row: 40
end
  
end

tranform-column(price-tax, "price", take-tax)






orders-with-total = build-column(
  orders, 
  "total", 
  lam(r :: Row) -> Number:
    get-column(r, "quantity") * get-column(r, "price")
  end
)



fun calc-total(r :: Row) -> Number:
  get-column(r, "quantity") * get-column(r, "price")
end
orders-with-total = build-column(orders, "total", calc-total)