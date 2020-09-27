local mapping = {
	ESC   = {'key_escape','btn_select'},
	SPACE = {'key_space','btn_start'},
	--
	L  = {'key_a','key_left','btn_dpleft'},
	R  = {'key_d','key_right','btn_dpright'},
	D  = {'key_s','key_down','btn_dpdown'},
	U  = {'key_w','key_up','btn_dpup'},
}
local codes = {}

for name, map in pairs(mapping) do
	for __, code in pairs (map) do
		codes[code] = name
	end 
end

return codes