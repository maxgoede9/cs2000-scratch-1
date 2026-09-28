use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

"hello CS2000!"


fun print-conference-badge-minimal(name :: String, gender :: String, email :: String) -> Image:
  doc: "prints a conference attendee badge"
 
  overlay(
  above(
    text(name, 25, "black"),
    above(
      text(gender, 20, "black"),
        text(email, 15, "black"))),
    circle(200, "solid", "white"))
   
            
end

       


print-conference-badge-minimal("Max", "Male", "1234northeastern")
