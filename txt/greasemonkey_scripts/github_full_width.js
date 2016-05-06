// ==UserScript==
// @name           Make GitHub pages full width
// @namespace      https://bitbucket.org/deadlydog/greasemonkeyscripts, edited by HybridDog
// @description    Makes the GitHub pages span the full width of the browser, rather than maxing out at the default ~900 pixels.
// @include        https://github.com*
// @grant          none
// @version        1.6.1, edit 2016.05.06
// ==/UserScript==

elements = document.getElementsByClassName('container');
for (index = 0; index < elements.length; index++)
{
	elements[index].style.width="95%";	// Only 95% to leave room for the "add comment" tooltip icon.
}

elements = document.getElementsByClassName('comment-body');
for (index = 0; index < elements.length; index++)
{
	elements[index].style["font-size"]="130%";	// Bigger comment font size
}

elements = document.getElementsByClassName('discussion-timeline');
for (index = 0; index < elements.length; index++)
{
	elements[index].style.width="77%";	// Comments left to 77%
}

elements = document.getElementsByClassName('discussion-sidebar');
for (index = 0; index < elements.length; index++)
{
	elements[index].style.width="20%";	// Suscribe button etc. right from 20%
}

elements = document.getElementsByClassName('repository-content context-loader-container');
for (index = 0; index < elements.length; index++)
{
	elements[index].style.width="96%";
}

// Remove the restriction that hides file names from view over a certain length, to use the available width of the element.
elements = document.getElementsByClassName('css-truncate css-truncate-target');
for (index = 0; index < elements.length; index++)
{
	elements[index].style.maxWidth="100%";
}
