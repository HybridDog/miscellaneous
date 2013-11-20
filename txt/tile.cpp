// A special texture modification

/*infostream<<"generate_image(): generating special "
		<<"modification \""<<part_of_name<<"\""
		<<std::endl;*/

/*
	This is the simplest of all; it just adds stuff to the
	name so that a separate texture is created.

	It is used to make textures for stuff that doesn't want
	to implement getting the texture from a bigger texture
	atlas.
*/


/*
	[crackN
	Adds a cracking texture
*/


/*
	[combine:WxH:X,Y=filename:X,Y=filename2
	Creates a bigger texture from an amount of smaller ones
*/


/*
	"[brighten"
*/


/*
	"[noalpha"
	Make image completely opaque.
	Used for the leaves texture when in old leaves mode, so
	that the transparent parts don't look completely black 
	when simple alpha channel is used for rendering.
*/


/*
	"[makealpha:R,G,B"
	Convert one color to transparent.
*/


/*
	"[transformN"
	Rotates and/or flips the image.

	N can be a number (between 0 and 7) or a transform name.
	Rotations are counter-clockwise.
	0  I      identity
	1  R90    rotate by 90 degrees
	2  R180   rotate by 180 degrees
	3  R270   rotate by 270 degrees
	4  FX     flip X
	5  FXR90  flip X then rotate by 90 degrees
	6  FY     flip Y
	7  FYR90  flip Y then rotate by 90 degrees

	Note: Transform names can be concatenated to produce
	their product (applies the first then the second).
	The resulting transform will be equivalent to one of the
	eight existing ones, though (see: dihedral group).
*/


/*
	[inventorycube{topimage{leftimage{rightimage
	In every subimage, replace ^ with &.
	Create an "inventory cube".
	NOTE: This should be used only on its own.
	Example (a grass block (not actually used in game):
	"[inventorycube{grass.png{mud.png&grass_side.png{mud.png&grass_side.png"
*/


/*
	[lowpart:percent:filename
	Adds the lower part of a texture
*/


/*
	[verticalframe:N:I
	Crops a frame of a vertical animation.
	N = frame count, I = frame index
*/
