use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

10 < 20

fun choose-hat(temp-in-F :: Number)->String:
  doc: "determines appropriate hat, sun if above 80, nothing below"
  spy:
    temp-in-F, comparison: temp-in-F >= 80
  end
  if temp-in-F >= 80:
  "sun hat"
  else if temp-in-F <= 50:
    "winter hat"
  else:
    "no hat"
  end
  
where: choose-hat(50) is "winter hat"
  choose-hat(85) is "sun hat"
  choose-hat(80) is "sun hat"
  choose-hat(55) is "no hat"
  
end

fun add-glasses(new-outfit :: String)->String:
  doc: "adds glasses to a new outfit"
  if temp-in-F >= 80:
    "wear sunglasses"
  else:
    "no glasses"
  end
  
where:
  add-glasses(80) is "wear sunglasses"
  add-glasses(79) is "no glasses"
  
  end

fun choose-outfit(temp-in-F :: Number)->String:
  
 
  


