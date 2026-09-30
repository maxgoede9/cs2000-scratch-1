use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# Username

#Later parts should **call** the functions from earlier parts rather than repeating that logic. Functions from [Pyret's strings library](https://pyret.org/docs/latest/strings.html) will be useful, especially `string-length` and `string-index-of`. (`string-index-of` returns `-1` when the piece you search for is not in the string.)

## Part 1: Long enough?

#A username must be at least 5 characters.

#Design and implement `is-long-enough`, which takes a String and returns a Boolean.

#Example behavior:

#- `"ada"` → `false`
#- `"adaly"` → `true`
#- `"hello"` → `true`
#- `"hi"` → `false`
  
fun is-long-enough( w :: String )-> Boolean:
    doc: "Username must be atleast 5 characters long"
    if string-length(w) >= 5:
      true 
    else: 
      false
    end
where:
    is-long-enough("adaly") is true
    is-long-enough("ada") is false
  is-long-enough("emil") is false
  is-long-enough("hannes") is true
  end

## Part 2: No spaces?

#Design and implement `has-no-space`, which takes a String and returns whether it does **not** contain a space.

#Example behavior:

#- `"ada-l"` → `true`
#- `"hello"` → `true`
#- `"ada l"` → `false`
#- `"a b c"` → `false`


fun has-no-space( s :: String) -> Boolean:
  doc: "takes a String and returns whether it does or does not contain a space."
  
  if string-contains(s, " ") == true:
    false
  else:
    true
  end
where:
  has-no-space("ada-ly") is true
  has-no-space("hello") is true
  has-no-space("ada l") is false
end 



## Part 3: Available?


  
fun is-available( a :: String ) -> Boolean:
    doc: "The username needs to be more or exactly 5 letters, is not allowed to have a space in between the letters and must not be admin or root in any form"
    
    lower = string-to-lower(a)
    
    if (is-long-enough == true) and (has-no-space == true) and (lower <> ("root")) and (lower <> ("admin")) :
      true
      
    else:
    false 
    end
    
    
  where:
  is-available("adaly") is true
  is-available("Adaly") is false
  is-available("ada ly") is false
  end

