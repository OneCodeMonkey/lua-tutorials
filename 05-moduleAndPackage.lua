-- using custom defined modules
require("module")
-- local m1=require("module")

print(module.constant)
-- print(m1.constant)

module.func1()
-- m1.func2()
module.func3()
-- m1.func3()


-- using C package

-- local path="/usr/local/lua/lib/libluasocket.so"
-- local f = loadlib(path, "luaopen_socket")
-- local f = assert(loadlib(path, "luaopen_socket"))

