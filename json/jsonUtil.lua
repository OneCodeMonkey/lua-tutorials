local function json2true(str, from, to)
    return true, from + 3
end

local function json2false(str, from, to)
    return false, from + 4
end

local function json2null(str, from, to)
    return nil, from + 3
end

local function json2nan(str, from, to)
    return nul, from + 2
end

local numberchars = {
    ['-'] = true,
    ['+'] = true,
    ['.'] = true,
    ['0'] = true,
    ['1'] = true,
    ['2'] = true,
    ['3'] = true,
    ['4'] = true,
    ['5'] = true,
    ['6'] = true,
    ['7'] = true,
    ['8'] = true,
    ['9'] = true,
}

local function json2number(str, from, to)
    local i = from + 1
    while (i <= to) do
        local char = string.sub(str, i, i)
        if not numberchars[char] then
            break
        end
        i = i + 1
    end
    local num = tonumber(string.sub(str, from, i - 1))
    if not num then
        error(_format('json格式错误，不正确的数字, 错误位置:{from}', from))
    end
    return num, i - 1
end

local function json2string(str, from, to)
    local ignor = false
    for i = from + 1, to do
        local char = string.sub(str, i, i)
        if not ignor then
            if char == '\"' then
                return string.sub(str, from + 1, i - 1), i
            elseif char == '\\' then
                ignor = true
            end
        else
            ignor = false
        end
    end
    error(_format('json格式错误，字符串没有找到结尾, 错误位置:{from}', from))
end

local function json2array(str, from, to)
    local result = {}
    from = from or 1
    local pos = from + 1
    local to = to or string.len(str)
    while (pos <= to) do
        local char = string.sub(str, pos, pos)
        if char == '\"' then
            result[#result + 1], pos = json2string(str, pos, to)
            --[[    elseif char == ' ' then

                    elseif char == ':' then

                    elseif char == ',' then]]
        elseif char == '[' then
            result[#result + 1], pos = json2array(str, pos, to)
        elseif char == '{' then
            result[#result + 1], pos = json2table(str, pos, to)
        elseif char == ']' then
            return result, pos
        elseif (char == 'f' or char == 'F') then
            result[#result + 1], pos = json2false(str, pos, to)
        elseif (char == 't' or char == 'T') then
            result[#result + 1], pos = json2true(str, pos, to)
        elseif (char == 'n') then
            result[#result + 1], pos = json2null(str, pos, to)
        elseif (char == 'N') then
            result[#result + 1], pos = json2nan(str, pos, to)
        elseif numberchars[char] then
            result[#result + 1], pos = json2number(str, pos, to)
        end
        pos = pos + 1
    end
    error(_format('json格式错误，表没有找到结尾, 错误位置:{from}', from))
end

function _G.json2table(str, from, to)
    local result = {}
    from = from or 1
    local pos = from + 1
    local to = to or string.len(str)
    local key
    while (pos <= to) do
        local char = string.sub(str, pos, pos)
        if char == '\"' then
            if not key then
                key, pos = json2string(str, pos, to)
            else
                result[key], pos = json2string(str, pos, to)
                key = nil
            end
            --[[    elseif char == ' ' then

                    elseif char == ':' then

                    elseif char == ',' then]]
        elseif char == '[' then
            if not key then
                key, pos = json2array(str, pos, to)
            else
                result[key], pos = json2array(str, pos, to)
                key = nil
            end
        elseif char == '{' then
            if not key then
                key, pos = json2table(str, pos, to)
            else
                result[key], pos = json2table(str, pos, to)
                key = nil
            end
        elseif char == '}' then
            return result, pos
        elseif (char == 'f' or char == 'F') then
            result[key], pos = json2false(str, pos, to)
            key = nil
        elseif (char == 't' or char == 'T') then
            result[key], pos = json2true(str, pos, to)
            key = nil
        elseif (char == 'n') then
            result[key], pos = json2null(str, pos, to)
            key = nil
        elseif (char == 'N') then
            result[key], pos = json2nan(str, pos, to)
            key = nil
        elseif numberchars[char] then
            if not key then
                key, pos = json2number(str, pos, to)
            else
                result[key], pos = json2number(str, pos, to)
                key = nil
            end
        end
        pos = pos + 1
    end
    error(_format('json格式错误，表没有找到结尾, 错误位置:{from}', from))
end

--json格式中表示字符串不能使用单引号
local jsonfuncs = {
    ['\"'] = json2string,
    ['['] = json2array,
    ['{'] = json2table,
    ['f'] = json2false,
    ['F'] = json2false,
    ['t'] = json2true,
    ['T'] = json2true,
}

function _G.json2lua(str)
    local char = string.sub(str, 1, 1)
    local func = jsonfuncs[char]
    if func then
        return func(str, 1, string.len(str))
    end
    if numberchars[char] then
        return json2number(str, 1, string.len(str))
    end
end


--print("test json2lua");
--print(json2lua("false"));
--print(json2lua("true"));
--jsonResult = json2lua("{\"abc\":\"fge\"}");
--print(jsonResult["abc"])
--jsonResult = json2lua("[\"afv\", 1, \"drrg\", false]");
--print(jsonResult[1]);
--print(jsonResult[2]);
--print(jsonResult[4]);
--print(jsonResult[5]);

