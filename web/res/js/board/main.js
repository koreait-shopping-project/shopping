// position
var pos = 0;
// 슬라이드 총 길이
var totalSlides = $('.slider_item').length;
// 각 슬라이드 width
var sliderWidth = $('#slider_wrap').width();


$(document).ready(function(){

    $('#slider_wrap ul#slider').width(sliderWidth*totalSlides);

    //next slide button 클릭 이벤트
    $('#next').click(function(){
        slideRight(); // slideRight 함수 호출
    });

    //prev slide button 클릭 이벤트
    $('#prev').click(function(){
        slideLeft(); // slideLeft 함수 호출
    });



    $.each($('#slider_wrap ul li'), function() {

        // 페이지 매김
        var page = document.createElement('li');
        $('#pagination_wrap ul').append(page);
    });

    //counter
    countSlides();

    //pagination
    pagination();

    // slide 이벤트
    // var autoSlider = setInterval(slideRight, 3000);

    // slider-wrap에 마우스를 올렸을 때
    $('#slider_wrap').hover(
        function(){
            // active 생성
            $(this).addClass('active');
            // clearInterval(autoSlider);
        },
        function(){
            // active 제거
            $(this).removeClass('active');
            // autoSlider = setInterval(slideRight, 3000);
        }
    );

}); // document ready function 끝



// 왼쪽 이동
function slideLeft(){
    pos--;
    if(pos == -1){ pos = totalSlides - 1; }
    $('#slider_wrap ul#slider').css('left', -(sliderWidth*pos));

    countSlides();
    pagination();
}


// 오른쪽 이동
function slideRight(){
    pos++;
    if(pos == totalSlides){ pos = 0; }
    $('#slider_wrap ul#slider').css('left', -(sliderWidth*pos));

    countSlides();
    pagination();
}


// 카운터
function countSlides(){
    $('#counter').html(pos + 1 + ' / ' + totalSlides);
}

// 페이지 쪽수 변형 active
function pagination(){
    $('#pagination_wrap ul li').removeClass('active');
    $('#pagination_wrap ul li:eq('+ pos +')').addClass('active');
}