 // Author: Balraj
 // Works only with login.html and jquery.js
var formType = 0;
// 0 is for option, 
function formToggle() {
    formType++;
    formType = formType % 2;
    if (formType === 1) {
        $(".submit").hide(250);
        $(".remember_me").hide(250);
        $(".login-help").fadeOut(250);
        $("#login_key").attr("placeholder", "Desired Username");
        $("#formHeading").fadeOut(250, function () {
            $(this).text("Sign up or ").fadeIn(500);
        });
        $("#formOption").fadeOut(250, function () {
            $(this).text("Login").fadeIn(500);
        });
        $("#confirm_password").show(250);
        $("#email").show(250);
        $("#terms").show(250);
        $("#signup").show(250);
    }
    if (formType === 0) {
        $(".submit").show(250);
        $(".remember_me").show(250);
        $(".login-help").fadeIn(250);
        $("#login_key").attr("placeholder", "Username or Email");
        $("#formHeading").fadeOut(250, function () {
            $(this).text("Login or ").fadeIn(500);
        });
        $("#formOption").fadeOut(250, function () {
            $(this).text("Sign up").fadeIn(500);
        });
        $("#confirm_password").hide(250);
        $("#email").hide(250);
        $("#terms").hide(250);
        $("#signup").hide(250);
    }
};