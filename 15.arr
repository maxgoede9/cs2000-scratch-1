use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as L

#var my-var = initial-value
#for each(my-elt from my-list):
#  code
#  to
#  handle
#  my-elt
#  and update
#  my-var
#end
#my-var # final result

fun my-sum(num-list :: List<Number>) -> Number block:
  var total = 0
  for each(n from num-list):
    total := total + n
  end
  total
where:
  my-sum([list: 0, 1, 2, 3]) is 6
end


fun product(lst :: List)-> Number block:
  doc:"multiply all items on the list"
  var multi = 1
  for each(x from lst):
    multi := multi * x
  end
  multi
  
where:
  product([list: 1, 2, 3, 4]) is 24
end

fun sum-even-number(lt :: List)-> Number block:
  doc:"adds just the even number from the list"
  var even = 0
  for each(y from lt):
    #even = even + num-modulo(n, 2) == 0 
    when num-modulo(y, 2) == 0:
      even := even + y
    end
  end
  even
where:
  sum-even-number([list: 1, 2, 3, 4]) is 6
end

#fun my-length(lst :: List)-> Number block:
#    doc:"takes a list of any value and returns the number of elements in the list"
  
  
#end


fun reverse-list(l :: List)-> List block:
  
  var acc = [list: ]
  for each(elt from l):
    acc := L.push(acc, elt)
  end
  acc
where:
  reverse-list([list:]) is [list:]
  reverse-list([list: 1, 2, 3]) is [list: 3, 2, 1]
end

