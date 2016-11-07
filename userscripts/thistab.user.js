// ==UserScript==
// @name         This tab, Mofo.
// @namespace    https://github.com/xixa
// @updateURL    https://github.com/xixa/dotfiles/raw/master/userscripts/thistab.user.js
// @version      0.1
// @author       Marcio Ikematsu
// @match        http://ebooks.mengxiangbook.com/*
// @match        http://ebooks.sohuvv.com/*
// @grant        none
// @require      https://code.jquery.com/jquery-3.1.1.min.js
// ==/UserScript==

(function() {
    $("a").attr("target", "_self");
})();
