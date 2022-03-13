// // pageNum 값마다 번호에 'active' class 부여
$(document).ready(function(){
    var url = window.location.pathname + window.location.search;
    $('.num a[href="'+ url +'"]').addClass('active');
});

{
    const recordList = document.querySelectorAll('.record');
    const recordEvent = (item) => {
        item.addEventListener('click', () => {
            const iboard = item.dataset.iboard;
            console.log(iboard);
            location.href = `/board/detail?iboard=${iboard}`;
        });
    };
    recordList.forEach(recordEvent);


    
    //모두 선택
    function allChk(obj){
        const chkObj = document.getElementsByName("RowCheck");
        const rowCnt = chkObj.length - 1;
        const check = obj.checked;
        if (check) {
          for (let i=0; i<=rowCnt; i++){
              if(chkObj[i].type == "checkbox")
                  chkObj[i].checked = true;
          }
        } else {
            for (let i=0; i<=rowCnt; i++) {
                if(chkObj[i].type == "checkbox"){
                    chkObj[i].checked = false;
                }
            }
        }
    }
    //선택 삭제
    function itemDel(){
        let icart = "";
        const itemChk = document.getElementsByName("RowCheck");
        let indexid = false;
        for(let i=0; i < itemChk.length; i++){
            if(itemChk[i].checked){
                if(indexid){
                    icart = icart + '_';
                }
                icart = icart + itemChk[i].value;
                indexid = true;
            }
        }
        if(!indexid){
            alert("삭제할 제품을 선택해주세요");
            return;
        }
        const agree=confirm("삭제 하시겠습니까?");
        if (agree){
            myFetch.delete(`/board/cart/${icart}`, data => {
                if(data) {
                    document.querySelectorAll("input[name=RowCheck]:checked")
                        .forEach(function (item)
                        {item.parentElement.parentElement.remove();});
                } else {
                    alert('장바구니가 비었습니다.');
                }
            });
        }
    }

    //선택 주문
    function order(){
        let icart = "";
        const itemChk = document.getElementsByName("RowCheck");
        let indexid = false;
        for(let i=0; i < itemChk.length; i++){
            if(itemChk[i].checked){
                if(indexid){
                    icart = icart + '_';
                }
                icart = icart + itemChk[i].value;
                indexid = true;
            }
        }
        if(!indexid){
            alert("구매할 제품을 선택해주세요");
            return;
        }
        const agree=confirm("구매하시겠습니까?");
        if (agree){
            myFetch.put(`/board/selected/${icart}`, data => {
                if(data) {
                    location.href="/user/order";
                } else {
                    alert('구매에 실패하였습니다');
                }
            });
        }
    }

    //전체 가격
    function allPlusPrice(price, totalCnt) {
        return priceToString(price * totalCnt);
    }
    //천단위 콤마 정규식
    function priceToString(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    const reviewBtn = document.querySelector('.reviewBtn');
    const iboard = reviewBtn.dataset.iboard;
    const idetail = reviewBtn.dataset.idetail;
    const param = {
        'idetail' : idetail
    }
    console.log(idetail);

    reviewBtn.addEventListener('click', (e) => {
        myFetch.get('/user/selReview', data => {
            switch (data.result) {
                case 1:
                    alert('이미 리뷰를 남기신 상품입니다.');
                    e.preventDefault();
                    break;
                case 0:
                    window.location.href = `/user/review?iboard=${iboard}&idetail=${idetail}`
                    break;
            }
        }, param);
    });
}