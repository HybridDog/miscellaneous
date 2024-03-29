#!/bin/bash

#delete existing links
#trash *.png

while [[ "$#" -gt 0 ]]; do
	case $1 in
		--show-failed-links)
			show_failed_links=1
			shift
			;;
		*)
			echo "Unknown parameter: $1" >&2
			exit 1
			;;
	esac
	shift
done


# Path to the Minecraft texture pack folder
mctp_path=./mctp

# Path to the textures
textures_path=${mctp_path}/assets/minecraft/textures

if [[ ! -d $textures_path ]]; then
	echo "I could not find the textures folder at ${textures_path}." >&2
	exit
fi

# the linking function
link() {
	in=${1}.png
	out=${2}.png
	if [[ -e $in ]] && [[ ! -L $out ]]; then
		ln --relative --symbolic "$in" "$out"
	fi
	if [[ -n $show_failed_links ]] && [[ ! -L $out ]]; then
		echo "I could not link [93m${in}[m to [93m${out}[m" >&2
	fi
}

# a linking function for blocks
link_block() {
	link "${textures_path}/block/$1" "$2"
}

# a linking function for items
link_item() {
	link "${textures_path}/item/$1" "$2"
}

echo "Linking textures…"

link "${mctp_path}/pack" screenshot

link_item diamond_boots 3d_armor_inv_boots_diamond
link_item iron_boots 3d_armor_inv_boots_steel
link_item diamond_chestplate 3d_armor_inv_chestplate_diamond
link_item iron_chestplate 3d_armor_inv_chestplate_steel
link_item diamond_helmet 3d_armor_inv_helmet_diamond
link_item iron_helmet 3d_armor_inv_helmet_steel
link_item diamond_leggings 3d_armor_inv_leggings_diamond
link_item iron_leggings 3d_armor_inv_leggings_steel
link_item boat boats_inventory
link_item bucket bucket
link_item bucket_empty bucket
link_item lava_bucket bucket_lava
link_item bucket_lava bucket_lava
link_item bucketLava bucket_lava
link_item water_bucket bucket_water
link_item bucket_water bucket_water
link_item bucketWater bucket_water
link_item apple default_apple
link_item book default_book
link_item book_normal default_book
link_item brick default_clay_brick
link_item clay default_clay_lump
link_item clay_ball default_clay_lump
link_item coal default_coal_lump
link_item ingotGold default_gold_ingot
link_item goldNugget default_gold_lump
link_item paper default_paper
link_item sign default_sign_wall
link_item snowball default_snowball
link_item ingotIron default_steel_ingot
link_item iron_ingot default_steel_ingot
link_item stick default_stick
link_item diamond_axe default_tool_diamondaxe
link_item hatchetDiamond default_tool_diamondaxe
link_item diamond_pickaxe default_tool_diamondpick
link_item pickaxeDiamond default_tool_diamondpick
link_item diamond_shovel default_tool_diamondshovel
link_item shovelDiamond default_tool_diamondshovel
link_item diamond_sword default_tool_diamondsword
link_item swordDiamond default_tool_diamondsword
link_item hatchetIron default_tool_steelaxe
link_item iron_axe default_tool_steelaxe
link_item iron_pickaxe default_tool_steelpick
link_item pickaxeIron default_tool_steelpick
link_item iron_shovel default_tool_steelshovel
link_item shovelIron default_tool_steelshovel
link_item iron_sword default_tool_steelsword
link_item swordIron default_tool_steelsword
link_item hatchetStone default_tool_stoneaxe
link_item stone_axe default_tool_stoneaxe
link_item pickaxeStone default_tool_stonepick
link_item stone_pickaxe default_tool_stonepick
link_item shovelStone default_tool_stoneshovel
link_item stone_shovel default_tool_stoneshovel
link_item stone_sword default_tool_stonesword
link_item swordStone default_tool_stonesword
link_item hatchetWood default_tool_woodaxe
link_item wooden_axe default_tool_woodaxe
link_item wood_axe default_tool_woodaxe
link_item pickaxeWood default_tool_woodpick
link_item wooden_pickaxe default_tool_woodpick
link_item wood_pickaxe default_tool_woodpick
link_item shovelWood default_tool_woodshovel
link_item wooden_shovel default_tool_woodshovel
link_item wood_shovel default_tool_woodshovel
link_item swordWood default_tool_woodsword
link_item wooden_sword default_tool_woodsword
link_item wood_sword default_tool_woodsword
link_item doorIron door_steel
link_item doorWood door_wood
link_item black_dye dye_black
link_item dyePowder_black dye_black
link_item blue_dye dye_blue
link_item dyePowder_blue dye_blue
link_item brown_dye dye_brown
link_item dyePowder_brown dye_brown
link_item cyan_dye dye_cyan
link_item dyePowder_cyan dye_cyan
link_item green_dye dye_dark_green
link_item dyePowder_green dye_dark_green
link_item gray_dye dye_dark_grey
link_item dyePowder_gray dye_dark_grey
link_item lime_dye dye_green
link_item dyePowder_lime dye_green
link_item light_gray_dye dye_grey
link_item dyePowder_silver dye_grey
link_item magenta_dye dye_magenta
link_item dyePowder_magenta dye_magenta
link_item orange_dye dye_orange
link_item dyePowder_orange dye_orange
link_item pink_dye dye_pink
link_item dyePowder_pink dye_pink
link_item red_dye dye_red
link_item dyePowder_red dye_red
link_item purple_dye dye_violet
link_item dyePowder_purple dye_violet
link_item white_dye dye_white
link_item dyePowder_white dye_white
link_item yellow_dye dye_yellow
link_item dyePowder_yellow dye_yellow
link_item bread farming_bread
link_item string farming_string
link_item iron_hoe farming_tool_steelhoe
link_item stone_hoe farming_tool_stonehoe
link_item wooden_hoe farming_tool_woodhoe
link_item wood_hoe farming_tool_woodhoe
link_item arrow throwing_arrow
link_item bow_standby throwing_bow_wood
link_item glassBottle vessels_glass_bottle
link_item potion_bottle_empty vessels_glass_bottle_inv

link_block rail_turn carts_rail_curved
link_block rail carts_rail_straight
link_block rail_normal carts_rail_straight
link_block bookshelf default_bookshelf
link_block bricks default_brick
link_block cactus_side default_cactus_side
link_block cactus_top default_cactus_top
link_block clay default_clay
link_block cobblestone default_cobble
link_block blockDiamond default_diamond_block
link_block diamond_block default_diamond_block
link_block dirt default_dirt
link_block deadbush default_dry_shrub
link_block furnace_top default_furnace_bottom
link_block furnace_front default_furnace_front
link_block furnace_front_off default_furnace_front
link_block furnace_front_lit default_furnace_front_active
link_block furnace_front_on default_furnace_front_active
link_block furnace_side default_furnace_side
link_block furnace_top default_furnace_top
link_block glass default_glass
link_block blockGold default_gold_block
link_block gold_block default_gold_block
link_block grass_top default_grass
link_block crops_0 default_grass_1
link_block crops_1 default_grass_2
link_block crops_2 default_grass_3
link_block crops_3 default_grass_4
link_block crops_4 default_grass_5
link_block grass_side_overlay default_grass_side
link_block gravel default_gravel
link_block ice default_ice
link_block tallgrass default_junglegrass
link_block leaves_jungle default_jungleleaves
link_block jungle_sapling default_junglesapling
link_block sapling_jungle default_junglesapling
link_block jungle_log default_jungletree
link_block log_jungle default_jungletree
link_block tree_jungle default_jungletree
link_block jungle_log_top default_jungletree_top
link_block log_jungle_top default_jungletree_top
link_block jungle_planks default_junglewood
link_block planks_jungle default_junglewood
link_block wood_jungle default_junglewood
link_block ladder default_ladder_wood
link_block lava_flow default_lava_flowing_animated
link_block lava default_lava_source_animated
link_block lava_still default_lava_source_animated
link_block leaves default_leaves
link_block oak_leaves default_leaves
link_block leaves_oak default_leaves
link_block coal_ore default_mineral_coal
link_block oreCoal default_mineral_coal
link_block diamond_ore default_mineral_diamond
link_block oreDiamond default_mineral_diamond
link_block gold_ore default_mineral_gold
link_block oreGold default_mineral_gold
link_block iron_ore default_mineral_iron
link_block oreIron default_mineral_iron
link_block cobblestone_mossy default_mossycobble
link_block stonemoss default_mossycobble
link_block obsidian default_obsidian
link_block reeds default_papyrus
link_block sand default_sand
link_block sandstone_normal default_sandstone
link_block sandstone_top default_sandstone
link_block sandstone_smooth default_sandstone_brick
link_block oak_sapling default_sapling
link_block sapling default_sapling
link_block snow default_snow
link_block blockIron default_steel_block
link_block iron_block default_steel_block
link_block stone default_stone
link_block stone_bricks default_stone_brick
link_block stonebricksmooth default_stone_brick
link_block torch_on default_torch
link_block torch default_torch_on_floor_animated
link_block log_oak default_tree
link_block oak_log default_tree
link_block tree_side default_tree
link_block log_oak_top default_tree_top
link_block oak_log_top default_tree_top
link_block tree_top default_tree_top
link_block water_flow default_water_flowing_animated
link_block water default_water_source_animated
link_block water_still default_water_source_animated
link_block oak_planks default_wood
link_block planks_oak default_wood
link_block wood default_wood
link_block door_iron_upper door_steel_a
link_block doorIron_upper door_steel_a
link_block doorIron_lower door_steel_b
link_block door_wood_upper door_wood_a
link_block doorWood_upper door_wood_a
link_block doorWood_lower door_wood_b
link_block fire_0 fire_basic_flame_animated
link_block flower_dandelion flowers_dandelion_yellow
link_block command_block jeija_commandblock_off
link_block tnt_bottom tnt_bottom
link_block tnt_side tnt_side
link_block tnt_top tnt_top
link_block cloth_15 wool_black
link_block wool_colored_black wool_black
link_block black_wool wool_black
link_block cloth_11 wool_blue
link_block wool_colored_blue wool_blue
link_block blue_wool wool_blue
link_block cloth_12 wool_brown
link_block wool_colored_brown wool_brown
link_block brown_wool wool_brown
link_block cloth_9 wool_cyan
link_block wool_colored_cyan wool_cyan
link_block cyan_wool wool_cyan
link_block cloth_13 wool_dark_green
link_block cloth_7 wool_dark_grey
link_block cloth_5 wool_green
link_block wool_colored_green wool_green
link_block green_wool wool_green
link_block cloth_8 wool_grey
link_block wool_colored_gray wool_grey
link_block gray_wool wool_grey
link_block cloth_2 wool_magenta
link_block wool_colored_magenta wool_magenta
link_block magenta_wool wool_magenta
link_block cloth_1 wool_orange
link_block wool_colored_orange wool_orange
link_block orange_wool wool_orange
link_block cloth_6 wool_pink
link_block wool_colored_pink wool_pink
link_block pink_wool wool_pink
link_block cloth_10 wool_purple
link_block cloth_14 wool_red
link_block wool_colored_red wool_red
link_block red_wool wool_red
link_block cloth_0 wool_white
link_block wool_colored_white wool_white
link_block white_wool wool_white
link_block cloth_4 wool_yellow
link_block wool_colored_yellow wool_yellow
link_block yellow_wool wool_yellow

echo "Done!"
echo "A command to delete the .png file links: trash ./*.png"


#stuff taken from:
#https://forum.minetest.net/viewtopic.php?id=7946
#https://github.com/jojoa1997/MC_TO_MT_CONV/blob/master/Tpconvert.bat
