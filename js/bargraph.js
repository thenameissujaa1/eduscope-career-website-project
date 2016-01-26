$(function () {
    for (var i = 0; i < $(".horz-bars .data li").length; ++i) {
        $(".horz-bars .bar:eq(" + i + ")").animate({
            width: $(".horz-bars .value:eq(" + i + ")").html()
        }, 500);
    }
});