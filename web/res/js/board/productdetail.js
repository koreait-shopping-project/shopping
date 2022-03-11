{
    dataElem = document.querySelector('#data');
    iboard = dataElem.dataset.iboard;

    const colorBox = document.querySelector('#colorbox');
    const sizeBox = document.querySelector('#sizebox');

    colorBox.addEventListener('change', (e) => {
        const color = e.target.value;
        const param = {
            'iboard' : iboard,
            'color' : color
        }

        myFetch.get('/board/size', data => {
            const dataResult = data.result;
            switch (dataResult) {
                case dataResult:
                    sizeBox.options[1] = new Option('sm', `${dataResult.sm}`);
                    sizeBox.options[2] = new Option('md', `${dataResult.md}`);
                    sizeBox.options[3] = new Option('lg', `${dataResult.lg}`);
                    sizeBox.options[4] = new Option('xl', `${dataResult.xl}`);
                    break;
            }
        }, param);
    });

    const colorSizeObj = {};

    let totalPrice = document.querySelector('#purchase_wrap').dataset.price;
    const allPrice = document.querySelector('#allPrice');

    let listNum = 0;
    //전체 수량
    let totalCnt = 0;

    sizeBox.addEventListener('change', (e) => {
        const color = colorBox.options[colorBox.selectedIndex].value;
        const colorTxt = colorBox.options[colorBox.selectedIndex].text;
        const size = sizeBox.options[sizeBox.selectedIndex].text;
        const price = document.querySelector('#purchase_wrap').dataset.price;
        const ul = document.querySelector('#selected_items');
        const li = document.createElement("li");
        li.className = 'selected_item';
        const colorSize = colorTxt.concat(size);

        if (isKeyExits(colorSizeObj, colorSize)) {
            alert(`이미 선택한 옵션입니다.`);
            reAllBox();
            return;
        } else {
            ul.append(li);
            colorSizeObj[colorSize] = colorSize;
        }

        let i = 1;
        li.innerHTML= `
            <span class="selected_color">컬러 : ${colorTxt}</span>
            <span class="selected_size">사이즈 : ${size}</span>
            <input id="size" name="productList[${listNum}].size" value="${size}" type="hidden"/>
            <input id="color" name="productList[${listNum}].color" value="${color}" type="hidden"/>
            <input id="price" name="productList[${listNum}].price" value="${totalPrice}" type="hidden"/>
            <input id="itemNum" name="productList[${listNum}].itemNum" value="${i}" type="hidden"/>
            <input id="iboard" name="productList[${listNum}].iboard" value="${iboard}" type="hidden"/>
        `;
        listNum++;
        totalCnt++;

        //가격
        const priceVo = document.createElement('div');
        priceVo.innerHTML = `가격 : ${priceToString(totalPrice)}원`;
        priceVo.className = 'selected_price';
        // num(수량) +, - 버튼
        const numMinusBtn = document.createElement('button');
        numMinusBtn.innerHTML = `-`;
        numMinusBtn.className = 'increase_minus';

        const num = document.createElement('span');
        num.innerHTML = `${i}`;
        num.className = 'increase_num';

        const numPlusBtn = document.createElement('button');
        numPlusBtn.innerHTML = `+`;
        numPlusBtn.className = 'increase_plus';

        numMinusBtn.addEventListener('click', function(e) {
            if (i === 1) {
                numMinusBtn.disabled = true;
                alert('더 이상 줄일 수 없습니다.');
            } else {
                e.preventDefault();
                i--;
                num.innerHTML = `${i}`;
                li.querySelector('#itemNum').value = `${i}`;

                totalPrice = totalPrice * i;
                priceVo.innerHTML = `가격 : ${priceToString(totalPrice)}원`;
                li.querySelector('#price').value = `${totalPrice}`;
                totalPrice = price;

                totalCnt--;

                allPrice.innerHTML=`total : ${allPlusPrice(price, totalCnt)}`;
            }
        });

        numPlusBtn.addEventListener('click', function(e) {
            if (i === 1) {
                e.preventDefault();
                numMinusBtn.disabled = false;
                i++;
                num.innerHTML = `${i}`;
                li.querySelector('#itemNum').value = `${i}`;

                totalPrice = totalPrice * i;
                priceVo.innerHTML = `가격 : ${priceToString(totalPrice)}원`;
                li.querySelector('#price').value = `${totalPrice}`;
                totalPrice = price;

                totalCnt++;

                allPrice.innerHTML=`total : ${allPlusPrice(price, totalCnt)}`;
            } else {
                e.preventDefault();
                i++;
                num.innerHTML = `${i}`;
                li.querySelector('#itemNum').value = `${i}`;

                totalPrice = totalPrice * i;
                priceVo.innerHTML = `가격 : ${priceToString(totalPrice)}원`;
                li.querySelector('#price').value = `${totalPrice}`;
                totalPrice = price;

                totalCnt++;

                allPrice.innerHTML=`total : ${allPlusPrice(price, totalCnt)}`;
            }
        });
        li.appendChild(priceVo);
        li.appendChild(numMinusBtn);
        li.appendChild(num);
        li.appendChild(numPlusBtn);
        ul.appendChild(li);

        //li 삭제
        const removeBtn = document.createElement('button');
        removeBtn.innerHTML = 'X';
        removeBtn.className = 'remove_btn';
        removeBtn.addEventListener('click', function() {
            li.parentNode.removeChild(li);
            delete colorSizeObj [`${colorSize}`];
            totalCnt = totalCnt - Number(li.querySelector('#itemNum').value);
            allPrice.innerHTML=`total : ${allPlusPrice(price, totalCnt)}`;
        });
        li.appendChild(removeBtn);
        //사이즈 선택후 options 첫번째만 보이게함
        sizeBox.options.length = 1;

        allPrice.innerHTML=`total : ${allPlusPrice(price, totalCnt)}`;

        reAllBox();
    });

    //전체 가격
    function allPlusPrice(price, totalCnt) {
        return priceToString(price * totalCnt);
    }
    //천단위 콤마 정규식
    function priceToString(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    function isKeyExits(colorSizeObj, colorSize) {
        return colorSizeObj[colorSize] !== undefined;
    }

    function reAllBox() {
        colorBox.value='';
        sizeBox.value='';
    }

    const form = document.querySelector('#frmSubmit');
    form.addEventListener('submit', function (e) {
        if (allPrice.innerHTML === "total : 0") {
            alert("상품을 선택해주세요.")
            e.preventDefault();
        }
    })

    //버튼 변경
    function submitBtn(addr) {
        const iuserElem = document.querySelector('#iuser');
        const iuser = iuserElem.dataset.iuser;
        if(iuser === '0') {
            event.preventDefault();
            alert('로그인 시 사용할 수 있습니다.');
            location.href="/user/login";
        }
        else if(addr == 'cart') {
            form.action = "/board/cart";
        }
        else if (addr == 'order') {
            form.action = "/board/order";
        }
    }
  
    //좋아요
    const likeIconElem = document.querySelector('#like_icon');

    const isLike = () => {
        myFetch.get(`/board/like/${iboard}`, (data) => {
            switch(data.result) {
                case 0:
                    disableLike();
                    break;
                case 1:
                    enableLike();
                    break;
            }
        });
    }

    const disableLike = () => {
        if(likeIconElem) {
            likeIconElem.classList.remove('fas');
            likeIconElem.classList.add('far');
        }
    }

    const enableLike = () => {
        if(likeIconElem) {
            likeIconElem.classList.remove('far');
            likeIconElem.classList.add('fas');
        }
    }

    const iuserElem = document.querySelector('#iuser');
    const iuser = iuserElem.dataset.iuser;
    if(iuser) {
        isLike();
        likeIconElem.addEventListener('click', () => {
            if(likeIconElem.classList.contains('far')) { //no 좋아요
                const param = { iboard };
                /*
                위 문장의 결과는 아래와 같다.
                const param = {'iboard': iboard }
                */
                myFetch.post(`/board/like`, data => {
                    switch (data.result) {
                        case 0:
                            alert('좋아요 처리에 실패하였습니다.');
                            break;
                        case 1:
                            enableLike();
                            break;
                    }
                }, param);
            } else { //yes 좋아요
                myFetch.delete(`/board/like/${iboard}`, data => {
                    switch (data.result) {
                        case 0:
                            alert('좋아요 처리에 실패하였습니다.');
                            break;
                        case 1:
                            disableLike();
                            break;
                    }
                });
            }
        });
    }
}