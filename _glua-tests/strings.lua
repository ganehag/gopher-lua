local function test_dump(a, b)
  return a + b
end
local new_func = loadstring(string.dump(test_dump))
assert(new_func(1,2) == test_dump(1,2))

assert(string.find("","aaa") == nil)
assert(string.gsub("hello world", "(%w+)", "%1 %1 %c") == "hello hello %c world world %c")
local ok, msg = pcall(function()
  string.gsub("aaa", "]", "")
end)
assert(not ok and string.find(msg, "invalid '%]'"))

local ok, msg = pcall(function()
  string.match("aaa", "]", -10)
end)
assert(not ok and string.find(msg, "invalid '%]'"))

local ok, msg = pcall(function()
  string.find("aaa", "]")
end)
assert(not ok and string.find(msg, "invalid '%]'"))

local ok, msg = pcall(function()
  string.gmatch("aaa", "]")
end)
assert(not ok and string.find(msg, "invalid '%]'"))

local ret1, ret2, ret3, ret4 = string.find("aaa bbb", "(%w+())")
assert(ret1 == 1)
assert(ret2 == 3)
assert(ret3 == "aaa")
assert(ret4 == 4)
