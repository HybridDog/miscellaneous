local affected_drawtypes = {
	"allfaces",
	"allfaces_optional",
	--"fencelike",
	"flowingliquid",
	"glasslike",
	"glasslike_framed",
	"liquid",
	--"nodebox",
	"normal",
	"plantlike",
	--"raillike",
	--"signlike ",
	--"torchlike ",
}

local function table_contains(t, v)
	for _,i in pairs(t) do
		if i == v then
			return true
		end
	end
	return false
end

local tmp = ""
for i,_ in pairs(minetest.registered_nodes) do
	tmp = tmp..i.." "
end
print("Following nodes are registered yet: "..tmp)

local prev_reg_nd = minetest.register_node
function minetest.register_node(a, b)
	if not b.inventory_image then
		local drawtype = b.drawtype or "normal"
		if table_contains(affected_drawtypes, drawtype) then
			if b.tiles then
				b.inventory_image = b.tiles[1]
			elseif b.tile_images then
				b.inventory_image = b.tile_images[1]
			end
		end
	end
	return prev_reg_nd(a, b)
end

if table_contains(affected_drawtypes, "normal") then
	function minetest.inventorycube(img)
		return img
	end
end
