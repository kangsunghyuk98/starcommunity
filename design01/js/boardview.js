$(document).ready(function () {
    $("#d_btn").on("click", function () {
        let inputPassword = prompt("비밀번호를 입력하세요");
        let password = '12345';
        if (inputPassword != null || '') {
            if (inputPassword == password) {
                console.log("비밀번호는" + inputPassword);
                alert("글이 삭제되었습니다");
            } else {
                alert("비밀번호가 틀렸습니다");
            }
        }
    });

    $(".comment_d_btn").on("click", function () {
        let result = confirm("댓글을 삭제하시겠습니까?");
        if (result == true) {
            alert('댓글이 삭제되었습니다');
        } else {
        }
    });
});