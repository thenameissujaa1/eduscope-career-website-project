/*
    Author: Balraj
    app.js links the application with the backend, sending and recieving data that is to be viewed
    on the front end. 
    
    data.status holds the status of the response as follows..
    0 : user not logged in
    1 : user logged in, but no profile details found, first time login
    2 : user logged in, profile details found
*/

// When the page load, perform given actions
$(window).load(function(){
    updateView('profile');
    $.get('partials/functions/getInfo.php',{type: 'user'}, function(data){
        injectData(data, 'user');
    }, 'json');
    $.get('partials/functions/getInfo.php',{type: 'userDetail'}, function(data){
        if(data.userDetail === null){
            $( "#change_view_editProfile" ).trigger( "click" );
        }else{
            injectData(data, 'userDetail');
        }
    }, 'json');
});

        /* ~~~~~~~~~~~~~~~~~ PROFILE ONCLICK - CHANGE VIEW ~~~~~~~~~~~~~~~~~~~~~~ */
        
// Onclick functions for the views
$(document).on('click','#change_view_editProfile',function(){
    if($('#editIcon').hasClass('glyphicon-edit')){
        $('#editIcon').toggleClass('glyphicon-remove').toggleClass('glyphicon-edit');  
        $('#profile_view').slideUp(250);
        $('#profile_view').load('partials/views/editProfile.html');
        $.get('partials/functions/getInfo.php', { type: 'user' }, function (data) {
            injectData(data, 'user');
        }, 'json');
        $('#profile_view').slideDown(250);
        $('#change_view_editProfile').toggleClass('btn-danger').toggleClass('btn-default');        
    }else{
        $('#change_view_editProfile').toggleClass('btn-default').toggleClass('btn-danger'); 
        $('#editIcon').toggleClass('glyphicon-edit').toggleClass('glyphicon-remove');
        $('#profile_view').slideUp(250);
        $('#profile_view').load('partials/views/profile.html #profile_view');
        $('#profile_view').slideDown(250);
        $.get('partials/functions/getInfo.php', { type: 'user' }, function (data) {
            injectData(data, 'user');
        }, 'json');
        $.get('partials/functions/getInfo.php', { type: 'userDetail' }, function (data) {
            injectData(data, 'userDetail');
        }, 'json');
    }
})

        /*~~~~~~~~~~~~~~~~~~~~~~~~ EDITPROFILE~~~~~~~~~~~~~~~~~~~~~*/
        
function initalize_editProfileValidator(){
    var editProfile_validator = new FormValidator('form_editProfile', [{
        name: 'editProfile_firstName',
        display: 'First Name',
        rules: 'required|min_length[40]'
    }, {
        name: 'editProfile_lastName',
        display: 'Last Name',
        rules: 'required|min_length[40]'
    }, {
        name: 'editProfile_occupation',
        display: 'Occupation',
        rules: 'required'
    }, {
        name: 'editProfile_dob',
        display: 'Date of birth',
        rules: 'required'
    },{
        name: 'editProfile_nationality',
        display: 'Nationality',
        rules: 'required'
    }], function(errors, event){
        if(errors.length > 0){
            var errorString = '';
            for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
                errorString += errors[i].message + '<br/>';
            }
            $('#editProfile_validation_errors').show(250).addClass('custom-well-failure').html(errorString);
        }else{
            event.preventDefault();
            console.log('submit');
            $('#change_view_editProfile').toggleClass('btn-danger').toggleClass('btn-default'); 
            $('#editIcon').toggleClass('glyphicon-remove').toggleClass('glyphicon-edit');
        }
    });
}
         /* ~~~~~~~~~~~~~~~~~~~~~ FUNCTIONS ~~~~~~~~~~~~~~~~~~~~~~ */


/*  This function, on call, fixes the footer depending on the height of the
    rendered html page
*/
function fixFooter(){
    if($(document).height() <= 900){
        $('footer').addClass('custom-footer-position-fix');
    }else{
        if($('footer').hasClass('custom-footer-position-fix')){
           $('footer').removeClass('custom-footer-position-fix');
        }
    }
}

/*  This function must be called after a successful session validation
    It loads the common views such as header and footer, add common views here
*/

function load_commonViews(){
    $('footer').attr('id','footer');
    $('#header').load('partials/views/navbar_profile.html');
    $('footer').load('partials/views/footer.html');
    //fixFooter();
}

/*  This function updates the profile view after it has loaded by
    taking the JSON data from the server and putting it in the HTML
    data : JSON object from the server
*/
function inject_userDetail(data){
    if(data !== null){
        injectToID('userDetail_firstName', data.userDetail_firstName);
        injectToID('userDetail_lastName', data.userDetail_lastName);
        injectToID('userDetail_nationality', data.userDetail_nationality);
        injectToID('userDetail_age', data.userDetail_age);
        injectToID('userDetail_occupation', data.userDetail_occupation);
    }
    // ?? profile pic
}

function inject_user(data){
    injectToID('user_username', data.user_username);
    injectToID('user_email', data.user_email);
}

/*
    This funciton injects the data passed
    data : JSON data from the database (usually comes from AJAX)
    type : The table where the data is coming from (remove the DB from the table name)
*/

function injectData(data, type){
    if(data.status == 0){
        window.location.href = 'login.html';
    }else{
        if(!checkID('footer')){
            load_commonViews();
        }
        switch(type){
            case 'user':
                inject_user(data.user);
                break;
            case 'userDetail':
                inject_userDetail(data.userDetail);
                break;
        }
    }
}

/*  Check if an ID exists in HTML
    element : ID of the element to check, this function automatically as #
*/
function checkID(element){
    if($('#'+element).length > 0){
        return true;
    }else{
        return false;
    }
}

/*
    element : ID to inject
    data : 
*/
function injectToID(element, data){
    $('#'+element).html(data);
}

/*
    data : the html content to be displayed
    NOTE: Always update the view first and then inject the data
*/
function updateView(view){
    $('#content').load('partials/views/'+view+'.html');
}

