local seed = 8
local s = 20

local function get_random(a, b)
	return PseudoRandom(math.abs(a+b*5)+seed)
end

local function dif(z1, z2)
	local n1, n2 = math.abs(z1), math.abs(z2)
	if n1 < n2 then
		return n2-n1
	end
	return n1-n2
end

local r_ch = math.floor(s/3+0.5)

local function w_test(ps)
	local pos = vector.chunkcorner(ps)
	local minp = pos
	local maxp = vector.add(pos, 16)

	local tab,n = {},1
	local sm = s*3
	for i = -sm, 16+sm, s do
		for j = -sm, 16+sm, s do
			local pr = get_random(i+minp.x, j+minp.z)
			tab[n] = {x=i+pr:next(-r_ch, r_ch), y=0, z=j+pr:next(-r_ch, r_ch)}
			n = n+1
		end
	end

	for x = 1, 16 do
		for z = 1, 16 do
			local h = sm
			for _,i in ipairs(tab) do
				--local dist = vector.distance(i, {x=x, y=0, z=z})
				h = math.min(h, math.max(dif(x, i.x), dif(z, i.z)))
			end
			local p = vector.subtract(maxp, {x=x, y=h, z=z})
			if minetest.get_node(p).name ~= "default:stone" then
				minetest.set_node(p, {name="default:stone"})
			end
		end
	end
end

minetest.register_node("ac:wmg", {
	description = "wmg",
	tiles = {"ac_block.png"},
	groups = {snappy=1,bendy=2,cracky=1},
	sounds = default_stone_sounds,
	on_construct = function(pos)
		w_test(pos)
	end,
})
