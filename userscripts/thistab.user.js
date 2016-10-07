// ==UserScript==
// @name         This tab, Mofo.
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       Marcio Ikematsu
// @match        http://ebooks.mengxiangbook.com/*
// @match        http://ebooks.sohuvv.com/*
// @grant        none
// @require      https://code.jquery.com/jquery-3.1.1.min.js
// ==/UserScript==

(function() {
    $("a").attr("target", "_self");
})();
