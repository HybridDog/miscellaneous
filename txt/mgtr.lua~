minetest.register_on_mapgen_init(function(mgparams)
	minetest.set_mapgen_params({flags="", flagmask="trees"}) -- I turn off the default tree generation
end)

minetest.register_on_generated(function(minp, maxp)
	local biomes = minetest.get_perlin(289, 1, 0.6, 200)
-- biomes is the perlin noise who give for each point of map a biome numero.
-- This numero means nothing as such, but in an other file I have defined a biome numero for each tree.
	local grass_area = minetest.find_nodes_in_area(minp, maxp, "default:dirt_with_grass") -- I search all grass nodes in the concerned area.
	for grass, pos in pairs(grass_area) do
		if math.random(12) == 12 then
			local total = 0
			local temperature = get_average_temperature(pos) -- it's a function that I have defined
			local biome = biomes:get3d(pos) * 50 + 50
			local candidates = {} -- the list of trees which can grow at this point
			local water = true
			for specie, def in pairs(apportionment) do -- I have defined a table who contains informations about apportionment for each tree
				local difference = (def.biome - biome) ^ 2 -- difference with the tree's ideal biome numero
				if def.water_proximity then -- some trees needs water
					if minetest.find_node_near(pos, def.water_proximity, {"group:water"}) == nil then
						water = false
					end
				end
				if temperature <= def.temperature.max and temperature >= def.temperature.min and water then -- checks the temperature
					if difference < def.tolerance ^ 2 then
						local chance = def.frequency * (def.tolerance ^ 2 - difference)
						total = total + chance
						candidates[specie] = total
					end
				end
			end
			local num = math.random() * total
			local max = 0
			local tree = nil
			for specie, num_chance in pairs(candidates) do -- choose the tree
				if num >= num_chance and num_chance > max then
					tree = specie
					max = num_chance
				end
			end
			local def = apportionment[tree]
			pos = {x = pos.x, y = pos.y + 1, z = pos.z}
			if def then
				if math.random(20) <= def.density then
					trees[tree].method(pos, tree) -- make the tree grow
				end
			end
		end
	end
end)
