$(function () {
        $("#groupsSelection").css("height", parseInt($("#groupsSelection option").length) * 25);
    });


$(function () {
    if ($("#avatarImage").height() > $("#avatarImage").width()) {
        $("#avatarImage").css({
            width: '100%',
        });
    } else {
        $("#avatarImage").css({
            height: '100%',
            width: '100%'
        });
    }
});







