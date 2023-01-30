const adminInfo = 1;

$(document).ready(function() {
    if( adminInfo == 1 ) {
        $('.memberShip').append('<button type="button" href="#" class="btn">회원 관리</button>');
    }
});