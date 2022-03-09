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

    const tbody = document.querySelector('.tbody');
    const allCheck = document.querySelector('#allCheck');
    const boxList = document.querySelectorAll("input[name=RowCheck]");
    let allPrice = document.querySelector('#allPrice');
    let cost = 0;

    allCheck.addEventListener('click', function () {
        if(allCheck.checked) {
            for(let i = 0; i < boxList.length; i++) {
                const tr = tbody.children[i];
                let itemNum = parseInt(tr.querySelector("input[name=itemNum]").value);
                let price = parseInt(tr.querySelector("input[name=price]").value);
                let mul = itemNum * price;
                cost = cost + mul;
            }
            allPrice.innerHTML = cost;
        } else {
            for(let i = 0; i < boxList.length; i++) {
                const tr = tbody.children[i];
                let itemNum = parseInt(tr.querySelector("input[name=itemNum]").value);
                let price = parseInt(tr.querySelector("input[name=price]").value);
                let mul = itemNum * price;
                cost = cost - mul;
            }
        }
        allPrice.innerHTML = cost;
    })

    boxList.forEach(
        function(item, idx){
            let itemNum = parseInt(item.parentElement.parentElement.querySelector("input[name=itemNum]").value);
            let price = parseInt(item.parentElement.parentElement.querySelector("input[name=price]").value);
            let mul = itemNum * price;

            item.addEventListener('click', function () {
                if(item.checked) {
                    cost = cost + mul;
                    allPrice.innerHTML = cost;
                }
                else {
                    cost = cost - mul;
                    allPrice.innerHTML = cost;
                }
            })
        }
    );

    // num(수량) +, - 버튼
    document.querySelectorAll('.upDown').forEach(
        function(item, idx){
            //수량 감소버튼 클릭
            item.children[0].addEventListener('click', function(e){
                if(parseInt(item.children[1].value) === 1) {
                    e.preventDefault();
                    item.children[0].disabled = true;
                    alert('더 이상 줄일 수 없습니다.');
                }
                else {
                    const icart = item.parentElement.querySelector("input[name=RowCheck]").value;
                    const size = item.parentElement.querySelector("input[name=size]").value;

                    const param = {
                        'icart' : icart,
                        'size' : size
                    }
                    myFetch.put('/board/dCart', data => {
                        const dataResult = data.result;
                        switch (dataResult) {
                            case 0:
                                alert('수량이 변경에 실패하였습니다');
                                break;
                            case 1:
                                window.location.reload();
                                break;
                        }
                    }, param);
                }
            });


            //수량 증가버튼 클릭
            item.children[3].addEventListener('click', function(){
                const icart = item.parentElement.querySelector("input[name=RowCheck]").value;
                const size = item.parentElement.querySelector("input[name=size]").value;
                
                const param = {
                    'icart' : icart,
                    'size' : size
                }

                myFetch.put('/board/pCart', data => {
                    const dataResult = data.result;
                    switch (dataResult) {
                        case 0:
                            alert('수량이 변경에 실패하였습니다');
                            break;
                        case 1:
                            window.location.reload();
                            break;
                    }
                }, param);
            });
        }
    );

}