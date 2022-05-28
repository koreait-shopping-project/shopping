
// pageNum 값마다 번호에 'active' class 부여
$(document).ready(function(){
    const url = window.location.pathname + window.location.search;
    let ele = $(`.num a[href="${url}"]`);

    if(ele.length > 0) {
        ele.addClass('active');
    }else {
        document.querySelector('.num a').classList.add('active');
    }
});

