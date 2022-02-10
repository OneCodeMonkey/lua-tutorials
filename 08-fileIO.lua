f = io.open("testfile", "w+")
io.output(f)
for i=1,10,2 do
    io.write("adding to file: ", i, "\n")
end
-- set default input file
io.close(f)

fin = io.open("testfile", "r")
io.input(fin)
print(io.read())
print(io.read())
io.close(fin)

-- travel throught a file and get content
fin = io.open("testfile", "r")
io.input(fin)
repeat
    line = io.read()
    if line ~= nil then
        print(line)
    end
until(line == nil)

