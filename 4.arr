use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#fun welcome(name):
#"Welcome to class" + name
#end

#welcome --> function...
#name->"Caimi"

#fun welcome(name :: String)-> String:
#"welcome to class" + name 
#end

#same as above, just clarified what is allowed to get in and out


fun three-layer-cake(top :: String, middle :: String, bottom :: String)->Image:
  frame(
    above(rectangle(60, 30, "solid", top),
      above(rectangle(90, 30, "solid", middle),
        rectangle(120, 30, "solid", bottom))))
end 

tart = three-layer-cake("white","yellow","brown")
tart


