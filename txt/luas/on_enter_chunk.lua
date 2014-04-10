local step = 1 --every <step> second(s) for every player the position is fetched and...

--minetest.register_on_chunk_enter(func(player, pos, oldpos))

local function chunkcorner(pos) --vector.chunkcorner(pos)
	return {x=pos.x-pos.x%16, y=pos.y-pos.y%16, z=pos.z-pos.z%16}
end

local registered_chunkloads = {}
local num = 1

function minetest.register_on_chunk_enter(func)
	registered_chunkloads[num] = func
	num = num+1
end

local t_old = tonumber(os.clock())
local oldps = {}

minetest.register_globalstep(function()
	local tn = tonumber(os.clock())
	if tn - t_old < step then
		return
	end
	t_old = tn
	for _,player in ipairs(minetest.get_connected_players()) do
		local playername = player:get_player_name()
		local pos = chunkcorner(player:getpos())
		local oldpos = oldps[playername] or {x=0, y=0, z=0}
		if not vector.equals(pos, oldpos) then
			oldps[playername] = pos
			for _,func in ipairs(registered_chunkloads) do
				func(player, pos, oldpos)
			end
		end
	end
end)
