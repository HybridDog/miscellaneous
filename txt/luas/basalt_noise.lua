--basalt_noise v1

local function get_random(a, b, seed)
	return PseudoRandom(math.abs(a+b*300)+seed)
end

local function olo(p, s)
	return {x=p.x-p.x%s, y=p.y-p.y%s, z=p.z-p.z%s}
end

local full_circles = {}
local function circlefill(r)
	local tab = full_circles[r]
	if tab then
		return tab
	end
	local tab,n = {},1
	local rq = r*r+r
	for z = -r,r do
		for x = -r,r do
			local xyq = z*z+x*x
			if xyq <= rq then
				if math.floor(xyq/rq*r+0.5) == r then
					tab[n] = {x=x, y=1, z=z}
				else
					tab[n] = {x=x, y=0, z=z}
				end
				n = n+1
			end
		end
	end
	full_circles[r] = tab
	return tab
end

local rt2 = math.sqrt(2)

local function basalt_noise(minp, maxp, s, h, h2, seed)
	local p1 = olo(minp, s)
	local p2 = olo(vector.add(maxp, s), s)
	--local maxp = vector.add(minp, 15)

	local tab = {}
	for x = p1.x, p2.x, s do
		for z = p1.z, p2.z, s do
			local pr = get_random(x, z, seed)
			tab[x.." "..z] = {x=x+pr:next(0, s-1), y=(math.abs(pr:next(0, h)+pr:next(0, h)-h))*pr:next(1,h2), z=z+pr:next(0, s-1)}
		end
	end

	local tab2 = {}
	for x = p1.x, p2.x, s do
		for z = p1.z, p2.z, s do
			local p = tab[x.." "..z]
			local pr = get_random(x, z, seed)
			local circle = circlefill(--[[math.floor(s*rt2+0.5)]]s+pr:next(0,3))
			for _,p2 in pairs(circle) do
				if p2.y == 0
				or pr:next(1,2) == 1 then
					local pos = {x=p.x+p2.x, y=p.y, z=p.z+p2.z}
					local y = tab2[pos.x.." "..pos.z]
					if y then
						y = math.max(y, pos.y)
					else
						y = pos.y
					end
					tab2[pos.x.." "..pos.z] = y
				end
			end
		end
	end

	tab,n = {},1
	for p,y in pairs(tab2) do
		local x,z = unpack(string.split(p, " "))
		tab[n] = {x=x, y=y, z=z}
		n = n+1
	end
	return tab
end

minetest.register_node(":ac:bmg", {
	description = "bmg",
	tiles = {"ac_block.png"},
	groups = {snappy=1,bendy=2,cracky=1},
	sounds = default_stone_sounds,
	on_construct = function(pos)
		local minp = vector.subtract(pos, 55)
		local nse = basalt_noise(minp, vector.add(pos, 55), 3, 4, 6, 1)
		for _,p in pairs(nse) do
			for y = 0, p.y do
				local p2 = {x=p.x, y=pos.y+y, z=p.z}
				if minetest.get_node(p2).name == "air" then
					minetest.set_node(p2, {name="default:basalt"})
				end
			end
		end
	end,
})

