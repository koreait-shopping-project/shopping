let totalData; //총 데이터 수
let maxPage = 1;
let recordCount; //한 페이지에 나타낼 글 수
let pageCount = 10; //페이징에 나타낼 페이지 수
let currentPage = 1; //현재 페이지

const searchParams = new URL(window.location.href).searchParams;
const isubcategory = searchParams.get('isubcategory');

const boardListElem = document.querySelector('#product_list');
const pageContainerElem = document.querySelector('#page_container');
const pagingUl = pageContainerElem.querySelector('#paginul');

const getList = () => {
    myFetch.get(`ajax/board/${isubcategory}`, list => {
        makeRecodeList(list);
    }, { currentPage, recordCount });
}
const getMaxPageVal = () => {
    myFetch.get(`/ajax/board/maxpage`, data => {
        maxPage = data.result;
        makePaging();
    }, { isubcategory, recordCount });
}
getMaxPageVal();

const makePaging = () => {
    pagingUl.innerHTML = null;

    const calcPage = parseInt((currentPage - 1) / pageCount);
    const startPage = (calcPage * pageCount) + 1;
    const lastPage = (calcPage + 1) * pageCount;

    if(startPage > 1){
        makePagingItem('&lt;', () => {
           currentPage = startPage - 1;
           getList();
           makePaging();
        });
    }

    for(var i=startPage; i<=(lastPage > maxPage ? maxPage : lastPage); i++){
        makePagingItem(i, () => {
            if(currentPage !== i){
                currentPage = i;
                getList();
            }
        });
    }

    if(maxPage > lastPage){
        makePaging('&gt;', () => {
            currentPage = lastPage + 1;
            getList();
            makePaging();
        });
    }
}

const makePagingItem = (val, cb) => {
    const liElem = document.createElement('li');
    liElem.classList = 'page-item page-link pointer';
    liElem.innerHTML = val;
    liElem.addEventListener('click', cb);
    pagingUl.appendChild(liElem);
}