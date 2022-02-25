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

    sizeBox.addEventListener('change', (e) => {
        const color = colorBox.options[colorBox.selectedIndex].value;
        const colorTxt = colorBox.options[colorBox.selectedIndex].text;
        const size = sizeBox.options[sizeBox.selectedIndex].text;
        const ul = document.querySelector('#selected_items');
        const li = document.createElement("li");
        ul.append(li);
        li.className = 'selected_item';
        const colorSize = colorTxt.concat(size);

        if (isKeyExits(colorSizeObj, colorSize)) {
            alert(`이미 선택한 옵션입니다.`);
            reAllBox();
            return;
        } else {
            colorSizeObj[colorSize] = colorSize;
        }

        let i = 1;

        li.innerHTML= `
            <span class="inner_color">컬러 : ${colorTxt}</span>
            <span class="inner_size">사이즈 : ${size}</span>
            <input id="size" name="size" value="${size}" type="hidden"/>
            <input id="color" name="color" value="${color}" type="hidden"/>
            <input id="itemNum" name="itemNum" value="${i}" type="hidden"/>
        `;

        // num(수량) +, - 버튼
        const numMinusBtn = document.createElement('button');
        numMinusBtn.innerHTML = `-`;
        numMinusBtn.className = 'increase_btn';
        const num = document.createElement('span');
        num.innerText = `${i}`;
        const numPlusBtn = document.createElement('button');
        numPlusBtn.innerHTML = `+`;
        numPlusBtn.className = 'increase_btn';

        numMinusBtn.addEventListener('click', function(e) {
            if (i === 1) {
                numMinusBtn.disabled = true;
                alert('더 이상 줄일 수 없습니다.');
            } else {
                e.preventDefault();
                i--;
                num.innerHTML = `${i}`;
                li.querySelector('#itemNum').value = `${i}`;
            }
        });

        numPlusBtn.addEventListener('click', function(e) {
            if (i === 1) {
                e.preventDefault();
                numMinusBtn.disabled = false;
                i++;
                num.innerHTML = `${i}`;
                li.querySelector('#itemNum').value = `${i}`;
            } else {
                e.preventDefault();
                i++;
                num.innerHTML = `${i}`;
                li.querySelector('#itemNum').value = `${i}`;
            }
        });
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

    function isKeyExits(colorSizeObj, colorSize) {
        return colorSizeObj[colorSize] !== undefined;
    }

    function reAllBox() {
        colorBox.value='';
        sizeBox.value='';
    }
}
