-- 1.nil
-- `a` is not defined
print(a)
-- set global variable or table with value nil, means delete it
table1={k1="val1","valX"}
for key,val in pairs(table1) do
    -- not necessary for 4 whitespaces.
    print(key .. " - " .. val)
end

-- table1=nil   -- set nil means to delete table or global variable
for key,val in pairs(table1) do
    -- not necessary for 4 whitespaces.
    print(key .. " - " .. val)
end

-- 2.boolean
print(type(true))

-- 3.number
print(type(2))
print(type(2.2))
print(type(2e+1))
print(type(0.2e-1))
print(7.111e-06)
print(type(7.111e-06))

-- 4.string
str1="this is a string!"
print(str1)

-- multi-line string
str2=[[
line1: 1111
line2: 112222
]]
print(str2)

-- get string length
print(#str1)

-- 5.userdata
-- used to load struct definition which is defined by C/C++
--

-- 6.function
function fibonacci(n)
    if n == 2 or n == 1 then
        return 1
    else
        return fibonacci(n - 1) + fibonacci(n - 2)
    end
end

print("fibonacci 31:" .. fibonacci(31))
foobar=fibonacci
print("foobar 31:" .. foobar(31))

-- function can pass param with other functions.
function sumFibonacci(n, func)
    sum=0
    for i=1,n,1 do
    	sum=sum+func(i)
    end
    return sum
end

print("sum of fibonacci number from 1 to 31:" .. sumFibonacci(31, fibonacci))

-- pass func param can also pass an anonymous function
print("sum of odd number from 1 to 31:" .. sumFibonacci(31, 
function(n)
    if n % 2 == 0 then
        return 0
    else
        return n
    end
end))


-- 7.thread
-- in lua, it use coroutine, which is very similar to thread. coroutine has its own independent stack, local variable, and other necessary parts.

-- 8.table
table1={}
print(table1)
table2={"apple","pear","orange","grape"}
print(table2)
for k,v in pairs(table2) do
    print(k .. " - " .. v)
end
-- this indicates that lua array's start index is from 1, instead of 0.

table2[5]="watermelon"
for k,v in pairs(table2) do
    print(k .. " - " .. v)
end

table2["fruitX"]="somekindoffruit"
for k,v in pairs(table2) do
    print(k .. " - " .. v)
end


