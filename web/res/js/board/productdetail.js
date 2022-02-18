{
    dataElem = document.querySelector('#data');
    iboard = dataElem.dataset.iboard;

    const selectElem = document.querySelector('#colorbox');
    const sizeElem = document.querySelector('#sizebox');

    selectElem.addEventListener('change', (event) => {
        const color = event.target.value;
        // console.log(color);
        const param = {
            'iboard' : iboard,
            'color' : color
        }

        myFetch.get('/board/size', data => {
            switch (data.result) {
                case data.result:
                    sizeElem.options[1] = new Option('sm', `${data.result.sm}`);
                    sizeElem.options[2] = new Option('md', `${data.result.md}`);
                    sizeElem.options[3] = new Option('lg', `${data.result.lg}`);
                    sizeElem.options[4] = new Option('xl', `${data.result.xl}`);
                    break
            }
        }, param);
    });
}