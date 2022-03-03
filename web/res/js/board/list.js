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

    function itemDel(){
        let icart = "";
        const memberChk = document.getElementsByName("RowCheck");
        let chked = false;
        let indexid = false;
        for(let i=0; i < memberChk.length; i++){
            if(memberChk[i].checked){
                if(indexid){
                    icart = icart + '_';
                }
                icart = icart + memberChk[i].value;
                indexid = true;
            }
        }
        if(!indexid){
            alert("삭제할 사용자를 체크해 주세요");
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

    // num(수량) +, - 버튼
    document.querySelectorAll('.upDown').forEach(
        function(item, idx){
            //수량 감소버튼 클릭
            item.children[0].addEventListener('click', function(){
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
                            alert('수량을 변경했습니다.');
                            window.location.reload();
                            break;
                    }
                }, param);
            });

            //수량 증가버튼 클릭
            item.children[1].addEventListener('click', function(){
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
                            alert('수량을 변경했습니다.');
                            window.location.reload();
                            break;
                    }
                }, param);

            });
        }
    );
}