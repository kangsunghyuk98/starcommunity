const main = document.querySelector("#main");
const qna = document.querySelector("#qna");
const result = document.querySelector("#result");

const endPoint = 5;
const select = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];

function calResult(){
    console.log( select );
    let result = select.indexOf( Math.max( ...select ) );
    return result;
}

function setResult(){
    let point = calResult();
    const resultName = document.querySelector( '.resultName' );
    resultName.innerHTML = infoList[ point ].name;
  
    let resultImg = document.createElement( 'img' );
    const imgDiv = document.querySelector( '#resultImg' );
    let imgURL = '/img/(1.7)_image_' + point + '.jpg';
    resultImg.src = imgURL;
    resultImg.alt = point;
    resultImg.classList.add( 'img-fluid' );
    imgDiv.appendChild( resultImg );
  
    const resultDesc = document.querySelector( '.resultDesc' );
    resultDesc.innerHTML = infoList[ point ].desc;
}

function goResult() {
    qna.style.WebkitAnimation = "fadeOut 0.5s";
    qna.style.animation = "fadeOut 0.5s";
    setTimeout( () => {
        result.style.WebkitAnimation = "fadeIn 0.5s";
        result.style.animation = "fadeIn 0.5s";
        setTimeout( () => {
            qna.style.display = "none";
            result.style.display = "block";   
        }, 200);
    }, 200);
    //console.log( select );
    setResult();
}

function addAnswer( answerText, qIdx, idx ) {
    let a = document.querySelector( '.answerBox' );
    let answer = document.createElement( 'button' );
    answer.classList.add( 'answerList' );
    answer.classList.add( 'my-4' );
    answer.classList.add( 'py-3' );
    answer.classList.add( 'mx-auto' );
    answer.classList.add( 'fadeIn' );

    a.appendChild( answer );    // answer가 a에게 소속될 수 있도록 관계 형성
    answer.innerHTML = answerText;
    
    answer.addEventListener( "click", () => {
        let children = document.querySelectorAll( '.answerList' );
        for( let i=0 ; i<children.length ; i++ ){
            children[i].disabled = true;
            children[i].style.WebkitAnimation = "fadeOut 0.25s";
            children[i].style.animation = "fadeOut 0.25s";
        }
        setTimeout( () => {
            let target = qnaList[ qIdx ].a[ idx ].type;
            for( let i=0 ; i < target.length ; i++ ){
                select[ target[ i ] ] += 1;
            }
            for( let i=0 ; i<children.length ; i++ ){
                children[i].style.display = 'none';
            }
            goNext( ++qIdx );
        }, 200 );
    }, false );
};

function goNext( qIdx ){
    if( qIdx == endPoint ){
        goResult();
        return;
    }

    let q = document.querySelector( '.qBox' );
    q.innerHTML = qnaList[ qIdx ].q;
    for( let i in qnaList[ qIdx ].a ){
        addAnswer( qnaList[ qIdx ].a[ i ].answer, qIdx, i );
    }
    let status = document.querySelector( '.statusBar' );
    status.style.width = ( 100 / endPoint ) * ( qIdx + 1 ) + '%';
};

function begin(){
    main.style.WebkitAnimation = "fadeOut 0.5s";
    main.style.animation = "fadeOut 0.5s";
    // main이 반쯤 꺼졌을 때 qna session이 fadeIn되며 등장하도록 함.
    setTimeout( () => {
        qna.style.WebkitAnimation = "fadeIn 0.5s";
        qna.style.animation = "fadeIn 0.5s";
        // fadeOut / fadeIn 애니메이션이 끝났을 때 display를 끄고 / 켜는 부분
        setTimeout( () => {
            main.style.display = "none";
            qna.style.display = "block";    // 끄고 켜는 순서 중요
        }, 200);

        let qIdx = 0;
        goNext( qIdx );
    }, 200);
};