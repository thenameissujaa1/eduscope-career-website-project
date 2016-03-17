/*
    Author: Balraj
    app.js links the application with the backend, sending and recieving data that is to be viewed
    on the front end. 
    It is completely written in JavaScript with jQuery library.
    
    data.status holds the status of the response as follows..
    0 : user not logged in
    1 : user logged in, but no profile details found, first time login
    2 : user logged in, profile details found
*/

// When the page load, perform given actions
$(window).load(function(){
    $('#content').load('partials/views/profile.html',function(){
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
});

/* ~~~~~~~~~~~~~~~~~ PROFILE ONCLICK - CHANGE VIEW ~~~~~~~~~~~~~~~~~~~~~~ */
        
// Onclick functions for the views
$(document).on('click','#change_view_editProfile',function(){
    if($('#editIcon').hasClass('glyphicon-edit')){
        $('#profile_view').slideUp(250, function(){
            $('#profile_view').load('partials/views/editProfile.html', function(){
                $.get('partials/functions/getInfo.php', { type: 'user' }, function (data) {
                    injectData(data, 'user');
                }, 'json');
                $.get('partials/functions/getInfo.php', { type: 'userDetail' }, function (data) {
                    if(data.userDetail !== null){
                        $('#editProfile_firstName').val(data.userDetail.userDetail_firstName);
                        $('#editProfile_lastName').val(data.userDetail.userDetail_lastName);
                        i = 0;
                        switch(data.userDetail.userDetail_minQualification){
                            case 'School':
                                i = 1;
                                break;
                            case 'High School':
                                i = 2;
                                break;                                
                            case 'Bachlors':
                                i = 3;
                                break;  
                            case 'Masters':
                                i = 4;
                                break;
                            case 'Phd':
                                i = 5;
                                break;  
                        }
                        $('#editProfile_status').val(i);
                        $('#editProfile_nationality').val(data.userDetail.userDetail_nationality);
                        $('#editProfile_dob').val(data.userDetail.userDetail_dob);
                    }
                }, 'json');
                $('#profile_view').slideDown(250, function(){
                    $('#editIcon').toggleClass('glyphicon-remove').toggleClass('glyphicon-edit');  
                    $('#change_view_editProfile').toggleClass('btn-danger').toggleClass('btn-default'); 
                });
            });
        });
    }else{        
        $('#editIcon').toggleClass('glyphicon-remove').toggleClass('glyphicon-edit');
        $('#change_view_editProfile').toggleClass('btn-danger').toggleClass('btn-default'); 
        $('#profile_view').slideUp(250, function(){
            $('#profile_view').load('partials/views/profile.html #profile_view', function(){
                $.get('partials/functions/getInfo.php', { type: 'user' }, function (data) {
                    injectData(data, 'user');
                }, 'json');
                $.get('partials/functions/getInfo.php', { type: 'userDetail' }, function (data) {
                    injectData(data, 'userDetail');
                }, 'json');
                $('#profile_view').slideDown(250);
            });
        });
    }
})

// Adding qualifications
$(document).on('click','#display_add_qualification',function(){
    $('#add_qualification').load('partials/views/addQualification.html', function(){
        $('#add_qualification').slideDown(500);
    })
})

/*~~~~~~~~~~~~~~~~~~~~~~~~ EDITPROFILE~~~~~~~~~~~~~~~~~~~~~*/
        
function initalize_editProfileValidator(){
    var editProfile_validator = new FormValidator('editProfile_form', [{
        name: 'editProfile_firstName',
        display: 'First Name',
        rules: 'required|min_length[3]|max_length[25]'
    }, {
        name: 'editProfile_lastName',
        display: 'Last Name',
        rules: 'required|min_length[3]|max_length[25]'
    }, {
        name: 'editProfile_status',
        display: 'Status',
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
            var postData = $('#editProfile_form').serializeArray();
            $.post('partials/functions/editProfile.php', postData, function(data){
                if(data == "success"){
                    $('#editIcon').toggleClass('glyphicon-remove').toggleClass('glyphicon-edit');
                    $('#change_view_editProfile').toggleClass('btn-danger').toggleClass('btn-default'); 
                    $('#profile_view').slideUp(250, function(){
                        $('#profile_view').load('partials/views/profile.html #profile_view', function(){
                            $.get('partials/functions/getInfo.php', { type: 'user' }, function (data) {
                                injectData(data, 'user');
                            }, 'json');
                            $.get('partials/functions/getInfo.php', { type: 'userDetail' }, function (data) {
                                injectData(data, 'userDetail');
                            }, 'json');
                            $('#profile_view').slideDown(250);
                        });
                    });
                }else{
                    $('#editProfile_validation_errors').show(250).html(data).addClass('custom-well-failure');
                }   
            }).fail(function(){
                $('#editProfile_validation_errors').show(250).html('Error Contacting the server, please try again').addClass('custom-well-failure');
            });
        }
    });
}

/* ~~~~~~~~~~~~~~~~~~~~~ NAVBAR MENU ~~~~~~~~~~~~~~~~~~*/
$(document).on('click','#nav-mentor',function(){
    $('#content, #footer').fadeOut(0,function(){
        $('#content').load('partials/views/mentor.html',function(){
            $('#content, #footer').fadeIn(500);
        });
    })
})

$(document).on('click','#nav-resources',function(){
    $('#content, #footer').fadeOut(0,function(){
        $('#content').load('partials/views/resources.html',function(){
            $('#content, #footer').fadeIn(500);
        })
    })  
})

$(document).on('click','#nav-profile',function(){
    $('#content, #footer').fadeOut(0,function(){
        $('#content').load('partials/views/profile.html',function(){
            $.get('partials/functions/getInfo.php',{type: 'user'}, function(data){
                injectData(data, 'user');
                $.get('partials/functions/getInfo.php',{type: 'userDetail'}, function(data){
                    if(data.userDetail === null){
                        $( "#change_view_editProfile" ).trigger( "click" );
                    }else{
                        injectData(data, 'userDetail');
                    }
                    $('#content, #footer').fadeIn(500);
                }, 'json');
            }, 'json');
        });       
    })

})

/* ~~~~~~~~~~~~~~~~~~~~~ COMMON FUNCTIONS ~~~~~~~~~~~~~~~~~~~~~~ */


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
    $('#header').load('partials/views/navbar_profile.html', function(){
        $(function(){
            $('[data-toggle="tooltip"]').tooltip();
        });
    });
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
        injectToID('userDetail_minQualification', data.userDetail_minQualification);
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
    view : the html content to be displayed
    NOTE: Always update the view first and then inject the data
*/
function updateView(view){
    $('#content').load('partials/views/'+view+'.html');
}

