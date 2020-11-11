for i = 1, 100000, 1 do
    redis.call("SET", "ZzZ_MYKEY_ZzZ_"..i.."key", i)
end

return "Ok!"
