--
--
Util = {}

-- quick lua implementation of "random" UUID
-- https://gist.github.com/jrus/3197011
--
function Util:uuid()
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return _.__gsub(template, '[xy]', function (c)
        local v = (c == 'x') and _.__random(0, 0xf) or _.__random(8, 0xb)
        return _.__format('%x', v)
    end)
end

function Util:sign(value)
    if     value > 0 then return  1
    elseif value < 0 then return -1
    end

    return 0
end

-- Create boolean hash table for convenience
--
function Util:toBoolean(value)
	local t = {}

	for __, v in pairs(value) do
		t[v] = true
	end

	return t
end

-- A better modulus method for Lua.
--
function Util:mod(value, max)
    return _.__max(1, value % max)
end

--
--
function Util:flashColor(tbl, c1, c2)
    Timer.script(function(wait)
         while true do
             Timer.tween(1, tbl, c1, 'linear')
             wait(1)
             --
             Timer.tween(1, tbl, c2, 'linear')
             wait(1)
         end
    end)
end

--
--
function Util:drawTriangle(tx, ty, r, sx, sy, color)
    lg.push()
    lg.translate(tx, ty)
    lg.rotate(r or 0)
    lg.scale(sx or 1, sy or 1)
    --
        lg.setColor(color or Config.color.white)
        lg.polygon('fill', {-1, -1, 1, -1, 0, 1})
    --
    lg.pop()
end

function new(name, ...)
    local path = LUA_PATH and LUA_PATH or os.getenv "LUA_PATH" or "./?.lua"
    local name = _.__gsub(name, "%p+", "/")

    for path in string.gfind(path, '[^;]+') do
        path = _.__gsub(path, '?', name)

        if loadfile(path) then
            return dofile(path)(...)
        end
    end
    
    error('No such module exists: ' .. name)
end

function Util:buildDir(path, tbl)
    local files = lf.getDirectoryItems(path)
    local info, name

    tbl = tbl or {}

    for __, file in pairs(files) do
        if not _:startsWith(file, '[.]') then
            info = lf.getInfo(path .. '/' .. file)
            name = string.match(file, "([%a|%-_|%d]+)")

            if info.type == 'directory' then
                tbl = Util:buildDir(path .. '/' .. file, tbl)
            else
                tbl[name] = require(path .. '/' .. name)
            end
        end
    end

    return tbl
end

-- Create gradient image
-- Credit: https://love2d.org/wiki/Gradients
--
function Util:gradient(dir, ...)
    local img, x, y

    if dir == 'horizontal' then
        img = li.newImageData(1, #{...})
    else
        img = li.newImageData(#{...}, 1)
    end

    for idx, color in ipairs({...}) do
        --
        if dir == 'horizontal' then
            x, y = 0, idx - 1
        else
            x, y = idx - 1, 0
        end

        --
        img:setPixel(x, y, color[1], color[2], color[3], color[4] or 1)
    end

    img = lg.newImage(img)
    img:setFilter('linear', 'linear')

    return img
end