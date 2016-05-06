// ==UserScript==
// @name        Minetest Forum width fix
// @namespace   stylefix
// @description fixes limited minetest forum width
// @include     https://forum.minetest.net/*
// @include     http://forum.minetest.net/*
// @version     2016.05.06
// @grant       none
// ==/UserScript==

// alow full window width
query = document.querySelector("#wrap");
query.style["max-width"] = "100%";

// reduce the size of the headers, which are almost everywhere just rubbish text
elements = document.getElementsByTagName("h3");//document.getElementsByClassName('postbody');
for (index = 0; index < elements.length; index++)
{
	elements[index].style["font-size"]="0.8em";	// Bigger comment font size
}
