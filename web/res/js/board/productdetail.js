{
    dataElem = document.querySelector('#data');
    iboard = dataElem.dataset.iboard;

    const selectElement = document.querySelector('#colorbox');

    selectElement.addEventListener('change', (event) => {
        const color = event.target.value;
        // console.log(color);
        const param = {
            'iboard': iboard,
            'color': color
        }

        myFetch.get('/board/size', data => {
            switch (data.result) {
                case 1:
                    console.log('성공');
                    break
                case 0:
                    console.log('실패');
                    break
            }
        }, param);
    });

}