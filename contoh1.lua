nameLength = 9
data_id = [[
3c:a7:47:93:fb:a5|8E069E11207BADB40B43C62F869429F
]]

function generate_name(length)
    ::REGENERATENAME::
    local res = ''
    local bad_name = {'fuc','fck','uck','vck','fuk','fug','fag','bob','dick','dck','b0b','sex','s3x','gay','g4y','bitch','dick','d1ck'}
    local all = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    for i = 1, length do
        local pick = math.random(1, #all)
        res = res..all:sub(pick, pick)
    end
    for _, bn in pairs(bad_name) do
        if res:upper():find(bn:upper()) then
            goto REGENERATENAME
        end
    end
    return res:upper()
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

function ds(val)
    if val ~= nil and val ~= "" then
        return val:gsub('%s', '')
    end
    return false
end

listGuest = split(data_id, '\n')
for i, list in pairs(listGuest) do
    data = split(ds(list), '|')
    if tablelength(data) == 2 then
        growid = generate_name(nameLength)
        mac = data[1]
        rid = data[2]
        addBot(growid, mac, rid)
    end
    sleep(200)
end
