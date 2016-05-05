// ==UserScript==
// @name        Minetest Forum width fix
// @namespace   stylefix
// @description fixes limited minetest forum width
// @include     https://forum.minetest.net/*
// @include     http://forum.minetest.net/*
// @version     2016.05.05
// @grant       none
// ==/UserScript==

query = document.querySelector("#wrap");
query.style["max-width"] = "100%";
