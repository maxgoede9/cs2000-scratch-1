use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/10-voters.csv", default-options)
end

fun blank-to-indep(s :: String) -> String:
  doc: "replaces an empty string with Independent"
  if s == "":
    "Independent"
  else:
    s
  end
where:
  blank-to-indep("") is "Independent"
  blank-to-indep("blah") is "blah"
end
voters-with-indep = transform-column(voter-data, "Party", blank-to-indep)


#3
fun normalize-phone(p :: String)-> String:
  doc:"replaces every digit of the number with 'N'"
  
  string-repeat("N", string-length(p))

where:
  normalize-phone("123456") is "NNNNNN"
  normalize-phone("12") is "NN"
  normalize-phone("123") is "NNN"
end

any-phone = transform-column(voters-with-indep, "Phone", normalize-phone)