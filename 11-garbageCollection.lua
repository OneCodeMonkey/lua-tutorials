-- garbage collection @see http://www.lua.org/manual/5.4/manual.html#2.5
-- collectgarbage("collect"): do a complete garbage collection cycle,
-- collectgarbage("count"): return the memory usage by kb.
-- collectgarbage("restart"): restart garbage collector
-- collectgarbage("setpause"): set interval of the garbage collector, return the former interval value
-- collectgarbage("setstepmul"): return step value
-- collectgarbage("step"): run garbage collector for one step, which the step value is set by arg.
-- collectgarbage("stop"): stop garbage collector.

fruits={"apple","orange","banana","pear","peach","watermelon","grape"}
print(collectgarbage("count"))
table.insert(fruits, "mango")
print(collectgarbage("count"))
fruits=nil
-- will not direct destroy
print(collectgarbage("count"))
-- explicitly collect
print(collectgarbage("collect"))
print(collectgarbage("count"))
