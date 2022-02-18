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
        const color = e.target.value;
        console.log(color);
        const size = e.target.value;
        console.log(size);
        const param = {
            'iboard' : iboard,
            'color' : color,
        }
    });

}