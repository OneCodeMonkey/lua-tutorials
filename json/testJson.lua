json = require "json"

jsonEncodedStr = json.encode({ 1, 2, 3, { x = 10 } })
print(jsonEncodedStr)
jsonDecoded = json.decode(jsonEncodedStr)
print(jsonDecoded)
print(jsonDecoded[1])
print(jsonDecoded[2])
print(jsonDecoded[3])
print(jsonDecoded[4])
print(jsonDecoded[4]["x"])
