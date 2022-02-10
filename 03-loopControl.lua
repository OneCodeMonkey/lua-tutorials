-- while loop
a=10
while (a<20) do
    print("a value is:", a)
    a=a+1
end

-- for loop
sum=0
for i=1,100,1 do
    sum = sum + i
end
print("sum from 1 to 100 is: ", sum)

-- iterator for tables
a = {"apple","orange","banana","grape","pear","watermelon","peach"}
for k,v in pairs(a) do
    print(k .. " - " .. v)
end

-- repeat...until
a=10
repeat
  print("a value is:", a)
  a = a + 1
until(a >= 20)

-- loop nesting

