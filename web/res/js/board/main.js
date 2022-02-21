// position
var pos = 0;
// 슬라이드 총 길이
var totalSlides = $('.slider_item').length;
// 각 슬라이드 width
var sliderWidth = $('#slider_wrap').width();

// jQuery 시작 부분
jQuery(document).ready(function(){

    $('#slider_wrap ul#slider').width(sliderWidth * totalSlides);

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

    // slide (timeout)초마다 자동으로 넘겨주는 이벤트(setInterval)
    var autoSlider = setInterval(slideRight, 5000);

    // slider_wrap 에 마우스를 올렸을 때
    $('#slider_wrap').hover(
        function(){
            // active 생성
            $(this).addClass('active');
            // 마우스를 올렸을 때 active 생성과 동시에 setInterval 이벤트를 멈춰줌(clearInterval)
            clearInterval(autoSlider);
        },
        function(){
            // active 제거
            $(this).removeClass('active');
            // active 제거됨과 동시에 setInterval 이벤트를 다시 실행
            autoSlider = setInterval(slideRight, 5000);
        }
    );
}); // jQuery 끝 부분


// 왼쪽 이동
function slideLeft(){
    pos--; // position 증감식(감소)
    if(pos == -1){ pos = totalSlides - 1; }
    $('#slider_wrap ul#slider').css('left', -(sliderWidth * pos));

    countSlides();
    pagination();
}

// 오른쪽 이동
function slideRight(){
    pos++; // position 증감식(증가)
    if(pos == totalSlides){ pos = 0; }
    $('#slider_wrap ul#slider').css('left', -(sliderWidth * pos));

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