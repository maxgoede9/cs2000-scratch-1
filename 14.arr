use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as L
include csv 

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]


unique-codes = L.distinct(discount-codes)

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = L.filter(is-real-code, unique-codes)


first-code = L.get(real-codes,0)

lower-codes = L.map(string-to-lower, real-codes)

#1 3
#2

answer = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]

cancel-out = L.distinct(answer)

fun cancel(c :: String)-> Boolean:
  not(string-to-lower(c) == "maybe")
end
  
maybe-answer = L.filter(cancel, cancel-out)
lower-answer = L.map(string-to-lower, maybe-answer)
L.distinct(lower-answer)


#3

  products =
  table: name :: String, price :: Number
    row: "laptop", 999.99
    row: "mouse", 25.50
    row: "keyboard", 75.00
    row: "monitor", 299.99
  end


prices = get-column(products, "price")

fun p100(n :: Number)-> Boolean:
  doc:"returns just prices below 100"
  n <= 100
end

hundert = L.filter(p100, prices)
L.map(lam(n:: Number)->Number: n * 0.9 end, hundert)

#4

frucht = [list: "apple", "banana", "cherry", "date", "elderberry"]

L.get(frucht, 2)

L.filter(lam(n :: String)->Boolean: string-length(n) <= 5 end ,frucht)

#5

employees = load-table:
  NAME,	DEPARTMENT_NAME,	TITLE,	REGULAR,	RETRO,	OTHER,	OVERTIME,	INJURED,	DETAIL,	QUINN_EDUCATION, TOTALGROSS, POSTAL

  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv", default-options)
end

Name = get-column(employees, "NAME")

fun nam(name :: String)-> Boolean:
  string-contains("Smith", "Smith")
end
  L.filter(nam, "Smith")