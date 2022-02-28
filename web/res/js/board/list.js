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
                if(data.result) {
                    // tr.remove();
                    console.log('이제 지웁시다!')
                } else {
                    alert('장바구니가 비었습니다.');
                }
            });
        }
    }
}