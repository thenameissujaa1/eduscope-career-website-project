// Author: Balraj
// Works only with login.html and requires jquery.js, and validate.js to be initalized before this script

// Validation (Makes use of validate.js)
// If it's a login form
var login_validator = new FormValidator('login_form', [{
    name: 'login_user',
    display: 'Username/Email',
    rules: 'required'
}, {
    name: 'login_password',
    display: 'password',
    rules: 'required'
}], function(errors, event) {
    if (errors.length > 0) {
        // Show the errors
        var errorString = '';

        for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
            errorString += errors[i].message + '<br />';
        }
        
        $('#login_validation_errors').show(250);
        $('#login_validation_errors').html(errorString);
        
    }
});

var signup_validator = new FormValidator('signup_form', [{
    name: 'signup_email',
    display: 'Email',
    rules: 'required|valid_email',
}, {
    name: 'signup_username',
    display: 'Username',
    rules: 'required|min_length[4]'
}, {
    name: 'signup_password',
    display: 'Password',
    rules: 'required|min_length[8]'
}, {
    name: 'signup_password_confirm',
    display: 'password confirmation',
    rules: 'required|matches[password]'
}], function(errors, event) {
    if (errors.length > 0) {
        // Show the errors
        var errorString = '';

        for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
            errorString += errors[i].message + '<br />';
        }
        
        $('#signup_validation_errors').show(250);
        $('#signup_validation_errors').html(errorString);
        
    }
});

// Form toggles between login and sign up, 0 for login and 1 for signup
var formType = 0;

function formToggle() {
    // flip function for formType value
    formType++;
    formType = formType % 2;
    
    // If it's a signup form
    if (formType === 1) {
        
        // Hide login elements
        $("#login_form").slideUp(250);
        $('#login_validation_errors').slideUp(250);
        
        // Modify text based elements for signup
        $("#formHeading").fadeOut(250, function () {
            $(this).text("Sign up or ").fadeIn(250);
        });
        $("#formOption").fadeOut(250, function () {
            $(this).text("Login").fadeIn(250);
        });
        
        // Show signup elements
        $("#signup_form").slideDown(250);
        
    }
    
    // If it's a login form
    if (formType === 0) {
        
        // Hide signup elements
        $("#signup_form").slideUp(250);
        $('#signup_validation_errors').slideUp(250);
        
        // Modify text based elements
        $("#formHeading").fadeOut(250, function () {
            $(this).text("Login or ").fadeIn(250);
        });
        $("#formOption").fadeOut(250, function () {
            $(this).text("Sign up").fadeIn(250);
        });
        
        // Show Login elements
        $('#login_form').slideDown(250);
    }

};



