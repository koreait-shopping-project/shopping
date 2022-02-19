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
            switch (data.result) {
                case data.result:
                    sizeBox.options[1] = new Option('sm', `${data.result.sm}`);
                    sizeBox.options[2] = new Option('md', `${data.result.md}`);
                    sizeBox.options[3] = new Option('lg', `${data.result.lg}`);
                    sizeBox.options[4] = new Option('xl', `${data.result.xl}`);
                    break;
            }
        }, param);
    });

    sizeBox.addEventListener('change', (e) => {
        const size = e.target.value;
        const color = colorBox.options[colorBox.selectedIndex].value;
        const ul = document.querySelector('#selecteditem');
        const li = document.createElement("li");
        ul.append(li);
        li.innerHTML= `
            사이즈 : 
            <span>${size}</span>
            컬러 : 
            <span>${color}</span>
        `;

        // num(수량) +, - 버튼
        let i = 1;
        const numMinusBtn = document.createElement('button');
        numMinusBtn.innerHTML = `-`
        const num = document.createElement('span');
        num.innerHTML = `${i}`
        const numPlusBtn = document.createElement('button');
        numPlusBtn.innerHTML = `+`
        numMinusBtn.addEventListener('click', function(e) {
            if (i === 1) {
                numMinusBtn.disabled = true;
                alert('더 이상 줄일 수 없습니다.');
            } else {
                i--;
                num.innerHTML = `${i}`
                e.preventDefault();
            }
        });
        numPlusBtn.addEventListener('click', function(e) {
            if (i === 1) {
                numMinusBtn.disabled = false;
                i++;
                num.innerHTML = `${i}`
                e.preventDefault();
            } else {
                i++;
                num.innerHTML = `${i}`
                e.preventDefault();
            }
        });
        li.appendChild(numMinusBtn);
        li.appendChild(num);
        li.appendChild(numPlusBtn);

        //li 삭제
        const removeBtn = document.createElement('button');
        removeBtn.innerHTML = `X`;
        removeBtn.addEventListener('click', function() {
            removeBtn.parentNode.removeChild(removeBtn);
            li.parentNode.removeChild(li);
        });
        li.appendChild(removeBtn);

        //    색상, 사이즈 추가
    //    수량 default 1 주고 증감버튼 생성, 최대수량보다 적으면 더 안올라가게 처리
    //    색생 선택, 사이즈 선택 default값으로 변경
    //     .colorBox.options[0].text;
    //     sizeBox.options[0].text;
    });


}
