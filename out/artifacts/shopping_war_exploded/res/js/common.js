const msg = {
    isDel: '삭제하시겠습니까?',
    fnIsDel : function(target) {
        return `${target}을(를) ` + this.isDel;
    }
};

//정규식 테스트 사이트
//https://www.regextester.com/

const regex = {
    id: /^([a-zA-Z0-9]{4,15})$/,       //대소문자_숫자조합으로 4~15글자
    pw: /^([a-zA-Z0-9!@_]{4,20})$/,    //대소문자+숫자+!@_ 조합으로 4~20글자
    nm: /^([가-힣]{2,5})$/,             //한글조합으로2~5글자
    ctnt: /^[^><]*$/,
    msg: {
        id: '대소문자_숫자조합으로 4~15글자',
        pw: '대소문자+숫자+!@_ 조합으로 4~20글자',
        nm: '한글조합으로 2~5글자',
        ctnt: '<, >는 사용할 수 없습니다.',
    },
    isWrongWith: function(target, val) {
        return (target && val) ? !this[target].test(val) : true;
    }
};

const myFetch = {
    send: function(fetchObj, cb) {
        return fetchObj
            .then(res => res.json())
            .then(cb)
            .catch(e => { console.log(e) });
    },
    get: function(url, cb, param) {
        if(param) {
            const queryString = '?' + Object.keys(param).map(key => `${key}=${param[key]}`).join('&');
            //Object.keys()는 키값하나만 넣어줘도 0번방을 key로  1번방을 value로 만들어서 배열만들어준다
            //우리는 param을 넣는데 iboard와 ctnt가 각각 key에 들어가서 새로운 배열을 만들어준다.
            //map은 기존의 배열과 똑같은 배열을 하나 만들어서 수정할 수 있게 만든다. 자기가 갖고있는 값만큼
            url += queryString;
        }
        return this.send(fetch(url), cb);
    },
    post: function(url, cb, param) {
        //param은 객체여야만 한다. typescript : 객체가 들어와야하는데 문자가 들어올수도 있다. 그러면 리소스 적어서 확인해야하는데, typescript는 객체만 받겠다고 명시할 수 있다.
        return this.send(fetch(url, {
            'method': 'post',
            'headers': { 'Content-Type': 'application/json' },
            'body': JSON.stringify(param)
        }), cb);
    },
    put: function(url, cb, param) {
        return this.send(fetch(url, {
            'method': 'put',
            'headers': { 'Content-Type': 'application/json' },
            'body': JSON.stringify(param)
        }), cb)
    },
    delete: function(url, cb) {
        return this.send(fetch(url, {
            'method': 'delete',
            'headers': { 'Content-Type': 'application/json' },
        }), cb);
    }
}

//Restful API > POST, GET, PUT, DELETE