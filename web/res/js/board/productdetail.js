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
    let listNum = 0;

    const price = document.querySelector('.price_total').dataset.price;
    let totalPrice = price;

    sizeBox.addEventListener('change', (e) => {
        const color = colorBox.options[colorBox.selectedIndex].value;
        const colorTxt = colorBox.options[colorBox.selectedIndex].text;
        const size = sizeBox.options[sizeBox.selectedIndex].text;
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
            <span>컬러 : ${colorTxt}</span>
            <span>사이즈 : ${size}</span>
            <input id="size" name="productList[${listNum}].size" value="${size}" type="hidden"/>
            <input id="color" name="productList[${listNum}].color" value="${color}" type="hidden"/>
            <input id="totalPrice" name="productList[${listNum}].price" value="${totalPrice}" type="hidden">
            <input id="itemNum" name="productList[${listNum}].itemNum" value="${i}" type="hidden"/>
            <input id="iboard" name="productList[${listNum}].iboard" value="${iboard}" type="hidden"/>
        `;
        listNum++;
        // num(수량) +, - 버튼
        const totalPriceTag = document.createElement('span');
        const numMinusBtn = document.createElement('button');
        const num = document.createElement('span');
        const numPlusBtn = document.createElement('button');

        totalPriceTag.innerHTML = `price : ${totalPrice}`;
        totalPriceTag.className = 'totalPriceTag';

        numMinusBtn.innerHTML = `-`;
        numMinusBtn.className = 'increase_minus';

        num.innerHTML = `${i}`;
        num.className = 'increase_num';

        numPlusBtn.innerHTML = `+`;
        numPlusBtn.className = 'increase_plus';

        let itemNum = li.querySelector('#itemNum').value;

        numMinusBtn.addEventListener('click', function(e) {
            if (i === 1) {
                numMinusBtn.disabled = true;
                alert('더 이상 줄일 수 없습니다.');
            } else {
                e.preventDefault();
                i--;
                num.innerHTML = `${i}`;
                itemNum = i;
                totalPrice = price * i;
                totalPriceTag.innerHTML = `price : ${totalPrice}`;
                totalPrice = price
                getAllPrice();
            }
        });

        numPlusBtn.addEventListener('click', function(e) {
            if (i === 1) {
                e.preventDefault();
                numMinusBtn.disabled = false;
                i++;
                num.innerHTML = `${i}`;
                itemNum = i;
                totalPrice = price * i;
                totalPriceTag.innerHTML = `price : ${totalPrice}`;
                totalPrice = price
                getAllPrice();
            } else {
                e.preventDefault();
                i++;
                num.innerHTML = `${i}`;
                itemNum = i;
                totalPrice = price * i;
                totalPriceTag.innerHTML = `price : ${totalPrice}`;
                totalPrice = price
                getAllPrice();
            }
        });
        li.appendChild(totalPriceTag);
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
        });
        li.appendChild(removeBtn);

        sizeBox.options.length = 1;

        reAllBox();
    });

    const price_total = document.querySelector('.price_total');
    const allPrice = document.createElement('div');
    price_total.appendChild(allPrice);

    function getAllPrice() {
        let choices = document.getElementsByClassName('totalPriceTag');
        console.log(choices);
        let price = 0;
        console.log(choices.length);
        for (let i=0;choices.length;i++) {
            console.log(choices[i].innerHTML.trim().split(':')[1]);
            price = price + Number();
        }
        allPrice.innerHTML = `total : ${price}`
    }

    function isKeyExits(colorSizeObj, colorSize) {
        return colorSizeObj[colorSize] !== undefined;
    }

    function reAllBox() {
        colorBox.value='';
        sizeBox.value='';
    }

    //버튼 변경
    function submitBtn(addr) {
        const form = document.querySelector(`#frmSubmit`);
        if(addr === 'cart') {
            form.action = "/board/cart"
        }
        else if (addr === 'purchase') {
            form.action = "/board/purchase"
        }
    }
}