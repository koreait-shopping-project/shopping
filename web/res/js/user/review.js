class MyUploadAdapter {
    constructor( loader ) {
        this.loader = loader;
    }
    upload() {
        return this.loader.file
            .then( file => new Promise( ( resolve, reject ) => {
                this._initRequest();
                this._initListeners( resolve, reject, file );
                this._sendRequest( file );
            } ) );
    }
    abort() {
        if ( this.xhr ) {
            this.xhr.abort();
        }
    }
    _initRequest() {
        const xhr = this.xhr = new XMLHttpRequest();
        xhr.open( 'POST', '/board/editor', true );
        xhr.responseType = 'json';
    }
    _initListeners( resolve, reject, file ) {
        const xhr = this.xhr;
        const loader = this.loader;
        const genericErrorText = `Couldn't upload file: ${ file.name }.`;

        xhr.addEventListener( 'error', () => reject( genericErrorText ) );
        xhr.addEventListener( 'abort', () => reject() );
        xhr.addEventListener( 'load', () => {
            const response = xhr.response;
            if ( !response || response.error ) {
                return reject( response && response.error ? response.error.message : genericErrorText );
            }
            resolve( {
                default: response.url
            } );
        } );
        if ( xhr.upload ) {
            xhr.upload.addEventListener( 'progress', evt => {
                if ( evt.lengthComputable ) {
                    loader.uploadTotal = evt.total;
                    loader.uploaded = evt.loaded;
                }
            } );
        }
    }
    _sendRequest( file ) {
        const data = new FormData();
        data.append( 'upload', file );
        this.xhr.send( data );
    }
}
function MyCustomUploadAdapterPlugin( editor ) {
    editor.plugins.get( 'FileRepository' ).createUploadAdapter = ( loader ) => {
        return new MyUploadAdapter( loader );
    };
}

ClassicEditor
    .create( document.querySelector( '#editor' ), {
        extraPlugins: [ MyCustomUploadAdapterPlugin ]
    } )
    .catch( error => {
        console.log( error );
    } );
{
    const reviewFrmElem = document.querySelector('#reviewFrm');
    const tallElem = document.querySelector('#tall');
    const weightElem = document.querySelector('#weight');
    const numRegex = /^([0-9]{1,}).([0-9]{1,})$/;//숫자 정규화

    //ctnt, prom_agree_flagElem (필수동의) 빈칸일 경우 submit 막기
    if (reviewFrmElem) {
        reviewFrmElem.addEventListener('submit', (e)=> {

            const ctntElem = reviewFrmElem.querySelector('#ctnt');
            const prom_agree_flagElem = reviewFrmElem.querySelector('#prom_agree_flag');


            if (ctntElem.value.length < 20) {
                alert('상품에 대한 평가를 20자 이상 작성해 주세요.');
                e.preventDefault();
            }
            if (!prom_agree_flagElem.checked) {
                alert('홍보 콘텐츠 사용에 동의해주세요(필수)');
                e.preventDefault();
            }
        })
    }
    
    if (tallElem) {
        tallElem.addEventListener('change', (e) => {
            if (!numRegex.test(tallElem.value)) {
                alert('예시에 맞게 적어주세요!');
                e.preventDefault();
            }
        })
    }

    if (weightElem) {
        weightElem.addEventListener('change', (e) => {
            if (!numRegex.test(weightElem.value)) {
                alert('예시에 맞게 적어주세요!');
                e.preventDefault();
            }
        })
    }


    //전체선택
    const all = document.querySelector('#all');
    function selectAll(selectAll)  {
        const checkboxes
            = document.querySelectorAll('input[type="checkbox"]');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked
        })
    }

    function unselect() {
        if (all.checked === true) {
            all.checked = false;
        }

    }

}

