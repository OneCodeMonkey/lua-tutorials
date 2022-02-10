table1={}
print("table1's type is:", type(table1))

table1[1]="apple"
table1["X"]="banana"
print("table1 index 1 element is: " , table1[1])
print("table1 index X element is: " , table1["X"])

-- variable assign to other table means share the same variable memory space.
table2 = table1
print("table2 index 1 element is: " , table2[1])
print("table2 index X element is: " , table2["X"])

-- modify table2 will also affect table1, because they point to same memory area.
table2["X"]="orange"
print("table1 index X element is: ", table1["X"])

table2=nil
print("table2 is: ", table2)

print("table1 index X element is: ", table1["X"])

table1=nil
print("table1 is: ", table1)

-- table functions: concat, insert, remove, sort
fruits = {"apple", "orange", "banana", "pear", "peach", "watermelon"}
fruits["x"]="otherfruit"
print("concat and get string: ", table.concat(fruits))
print("concat and get string: ", table.concat(fruits, ","))
print("concat and get string by index range: ", table.concat(fruits, ",", 2, 6))

table.insert(fruits, "mango")
print("fruits index 7 element is: ", fruits[7])
table.insert(fruits, 2, "grape")
print("fruits index 2 element is: ", fruits[2])
print("fruits index 7 element is: ", fruits[7])

print("fruits last element is: ", fruits[8])
table.remove(fruits)
print("fruits last element is: ", fruits[7])
table.remove(fruits, 2)
print("fruits index 2 element is: ", fruits[2])


print("before sort:")
for k,v in ipairs(fruits) do
    print(k .. " -" .. v)
end
table.sort(fruits)
print("after sort:")
for k,v in ipairs(fruits) do
    print(k .. " -" .. v)
end

