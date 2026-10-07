use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import math as M
import statistics as S
include csv


cafe-data =
  table: day :: String, drinks-sold :: Number
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end



sales = get-column(cafe-data, "drinks-sold")
M.max(sales)      # maximum sales     
M.sum(sales)      # total sold
S.mean(sales)     # average sales


M.min(get-column(cafe-data, "day")) #starts alphabetially


quiz-scores =
  table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end

#Extract each quiz column and calculate the class average for each quiz using S.mean. Which quiz had the highest average?

quiz-mean1 = S.mean(get-column(quiz-scores, "quiz1")) #2
quiz-mean2 = S.mean(get-column(quiz-scores, "quiz2")) #1
quiz-mean3 = S.mean(get-column(quiz-scores, "quiz3")) #3



#Create a list directly using the syntax [list: 12, 8, 15, 22, 5, 18] and use functions from the math library to find the minimum, maximum, and sum. What's the range (difference between max and min)?


liste = [list: 12, 8, 15, 22, 5, 18]

maxi = M.max(liste)
mini = M.min(liste)
M.sum(liste)

maxi - mini

earnings = load-table: Name, DEPARTMENT_NAME,	TITLE_REGULAR, RETRO, OTHER,	OVERTIME,	INJURED,	DETAIL,	QUINN_EDUCATION,	TOTAL, GROSS,	POSTAL
  
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv", default-options)
    
end


fun earnings-to-number(s :: String) -> Number:
  doc: "Converts a possibly comma-formatted earnings string to a number, using 0 if empty or invalid"
  string-to-number-default(0)(string-replace(s, ",", ""))
where:
  earnings-to-number("1234") is 1234
  earnings-to-number("1,234") is 1234
  earnings-to-number("-1.3") is -1.3
  earnings-to-number("hello") is 0
end


#regular = earnings-to-number(get-column(get-row(earnings, 0), "RETRO"))

regular = transform-column(earnings, "RETRO", earnings-to-number)

S.mean(get-column(regular, "RETRO")) # roughly 79786$


