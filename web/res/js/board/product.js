
// pageNum 값마다 번호에 'active' class 부여
$(document).ready(function(){
    var url = window.location.pathname + window.location.search;
    $('.num a[href="'+ url +'"]').addClass('active');
});