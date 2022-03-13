$(document).ready(function(){
    var url = window.location.pathname + window.location.search;
    $('.num a[href="'+ url +'"]').addClass('active');
});