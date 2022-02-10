-- coroutine
-- coroutine.create(): create a coroutine, return this coroutine, and input param is a function
-- coroutine.resume(): wakeup a pending coroutine, used with yield()
-- coroutine.yield(): hang up a coroutine, means temporarily stop it from running
-- coroutine.status(): get status of a coroutine, which is dead, suspended, running
-- coroutine.wrap(): create a coroutine, return a function. similar as coroutine.create()
-- coroutine.running(): return the coroutine which is running, since coroutine means a thread, it returns a thread id.

print("using create() to create coroutine\n")
co=coroutine.create(
    function (i)
        if i >= 1 then
            for i = 1,i,1 do
	        print(i)
	    	os.execute("sleep 1")
	    end
        end
    end
)
coroutine.resume(co, 3)
print(coroutine.status(co))

print("using wrap() to create coroutine\n")
co2=coroutine.wrap(
    function (i)
        if i >= 1 then
            for i = 1,i,1 do
                print(i)
 	        os.execute("sleep 1")
            end
        end
    end 
)
co2(3)

coroutine.resume(co,3)

-- two coroutine running concurrently
function producer()
    local i = 0
    while i <= 10 do
        i = i + 1
        send(i)
	os.execute("sleep 1")
    end
end

function send(x)
    print("produced message: ", x)
    coroutine.yield(x)
end

function consumer(producer)
    while true do
        if (coroutine.status(producer) ~= "dead") then
	    local i = receive(producer)
            print("consumed message: ", i)
   	else
	    return
	end
    end
end

function receive(producer)
    local status, value=coroutine.resume(producer)
    return value
end

-- start producer and consumer
myProducer = coroutine.create(producer)
consumer(myProducer)
