/*
    Author: Balraj
    app.js links the application with the backend, sending and recieving data that is to be viewed
    on the front end. 
    It is completely written in JavaScript with jQuery library.
    
    data.status holds the status of the response as follows..
    0 : user not logged in or an Error
    1 : user logged in, but no profile details found, first time login
    2 : user logged in, profile details found
*/

// When the page load, perform given actions
$(window).load(function(){
    updateQualifications();
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
                    $('#profileBtn_text').html(' Cancel changes');
                    $('#editIcon').toggleClass('glyphicon-remove').toggleClass('glyphicon-edit');  
                    $('#change_view_editProfile').toggleClass('btn-danger').toggleClass('btn-default'); 
                });
            });
        });
    }else{
        $('#profileBtn_text').html(' Edit Profile');        
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

// Adding qualifications and jobs
var qualificationFormReady = false;
$(document).on('click','#display_add_qualification',function(){
    $('#add_qualification').load('partials/views/addQualification.html', function(){
        if(qualificationFormReady){
            $('#add_qualification').slideDown(500);
        }else{
            qualificationFormReady = true;
            $.getScript("js/qualificationForm.js", function(){
                $('#add_qualification').slideDown(500);
            })
        }
    })
})

/*~~~~~~~~~~~~~~~~~~~~~~~~ PROFILE RENDERS (other than edit profile) ~~~~~~~~~~~~~~~~~~~~~*/
/*
    On function call
    1. Get all the qualifications data via myquals
    2. Get all the job data via myjobs
    3. First render qualifications
    4. Then render jobs
*/

var school,uni,jobs,school_subs;

function updateQualifications(){
    $.get('partials/functions/getInfo.php?type=myquals', function(data){
        if(data.status != 0){
            school = data.school;
            uni = data.uni;
            school_subs = data.school_subs;
            $.get('partials/functions/getInfo.php?type=myjobs',function(data){
                jobs = data.jobs;
                // render school
                var html = '';
                for(i = 0; i < school.length; i++){
                    html += '<div class="col-lg-4 col-md-4 col-sm-6">';
                    html += '<div class="thumbnail" style="height: 250px">';
                    html += '<div class="caption text-center">';
                    html += '<h2><span class="glyphicon glyphicon-flag"></span></h2>';
                    html += '<h3>'+school[i].qualification+'</h3><h5>'+school[i].grad_year+'</h5>';
                    html += '<button class="btn btn-primary btn-lg" data-school="'+i+'">View</button>';
                    html += '</div></div></div>';
                }
                for(i = 0; i < uni.length; i++){
                    html += '<div class="col-lg-4 col-md-4 col-sm-6">';
                    html += '<div class="thumbnail" style="height: 250px">';
                    html += '<div class="caption text-center">';
                    html += '<h2><span class="glyphicon glyphicon-flag"></span></h2>';
                    html += '<h3>'+uni[i].short_title+'</h3><h5>'+uni[i].grad_year+'</h5><h4>'+uni[i].subject_name+'</h4>';
                    html += '<button class="btn btn-primary btn-lg" data-uni="'+i+'">View</button>';
                    html += '</div></div></div>';
                }
                for(i = 0; i < jobs.length; i++){
                    html += '<div class="col-lg-4 col-md-4 col-sm-6">';
                    html += '<div class="thumbnail" style="height: 250px">';
                    html += '<div class="caption text-center">';
                    html += '<h2><span class="glyphicon glyphicon-briefcase"></span></h2>';
                    html += '<h3>'+jobs[i].title+'</h3><h5>'+jobs[i].start_year+'-'+jobs[i].end_year+'</h5><h4>'+jobs[i].subject_name+'</h4>';
                    html += '<button class="btn btn-primary btn-lg" data-job="'+i+'">View</button>';
                    html += '</div></div></div>';
                }
                $('#manage_qualifications #qualification_list').html(html);
            })
        }else{
            // error msg.
        }
    })
}

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
                    $('#profileBtn_text').html(' Edit Profile');
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
            // get a list of requests (this is async)
            $.get('partials/functions/getInfo.php?type=myrequests', function(data){
                updateNotifications(data);
            })
            // get a list of mentors
            $.get('partials/functions/getInfo.php?type=mymentors', function(data){
                updateMyMentors(data);
                $.get('partials/functions/getInfo.php?type=myusers', function(data){
                    updateMyUsers(data);
                    $('#content, #footer').fadeIn(500);
                })
            })
        })
    })
})

$(document).on('click','#nav-resources',function(){
    $('#content, #footer').fadeOut(0,function(){
        // Load the resources
        $('#content').load('partials/views/resources.html',function(){
            // Fade in and display
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

/* ~~~~~~~~~~~~~~~~~~~~~ MENTOR PAGE ~~~~~~~~~~~~~~~~~~~~~~ */

// ON CLICK SEARCH AND SEARCH VALIDATION
function initalize_userSearchValidator(){
    var userSearch_validator = new FormValidator('userSearch', [{
        name: 'query',
        display: 'Query',
        rules: 'required|min_length[3]|max_length[25]'
    }],function(errors, event){
        if(errors.length > 0){
            var errorString = '';
            for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
                errorString += errors[i].message + '<br/>';
            }
            $('#searchResults').hide(250).html('');
            $('#profileViewer').hide(250).html('');
            $('#userSearch_validation_errors').show(250).addClass('custom-well-failure').html(errorString);
        }else{
            event.preventDefault(); // Prevent submitting form
            $('#profileViewer').hide(250).html('');
            var postData = $('#userSearch').serializeArray(); // Aquire form data in a JSON
            if($('#userSearch_validation_errors').hasClass('custom-well-failure'))
                $('#userSearch_validation_errors').hide(250).html(''); // Hide errors if they are visible
            $.post('partials/functions/Search.php?type=user',postData,function(data){
                dataString = '';
                if(data.status == 1){
                    // The html for each object will be defined in data string.
                    if('user' in data){
                        for(i = 0; i < data.user.length; i++){
                            dataString += '<a id="viewProfile_btn" href="#" data-user="'+data.user[i].user_username+'" class="list-group-item">'+data.user[i].user_username+'</a>';
                        }
                    }else{
                        dataString = 'Unable to find the user';
                    }
                }else{
                    dataString = 'Invalid query';
                }
                // Display the html
                $('#searchResults').show(250).html(dataString);
            })
        }
    })
}


/* ~~~~~~~~~~~~~~~~~~~~~ RESOURCES PAGE ~~~~~~~~~~~~~~~~~~~~~~ */

// ON CLICK SEARCH AND SEARCH VALIDATION
//Change Backend functions
function initalize_resourcesSearchValidator(){
    var resourcesSearch_validator = new FormValidator('resourcesSearch', [{
        name: 'query',
        display: 'Query',
        rules: 'required|min_length[3]|max_length[25]'
    }],function(errors, event){
        if(errors.length > 0){
            var errorString = '';
            for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
                errorString += errors[i].message + '<br/>';
            }
            $('#searchResults').hide(250).html('');
            $('#userSearch_validation_errors').show(250).addClass('custom-well-failure').html(errorString);
        }else{
            event.preventDefault(); // Prevent submitting form
            var postData = $('#userSearch').serializeArray(); // Aquire form data in a JSON
            if($('#resourcesSearch_validation_errors').hasClass('custom-well-failure'))
                $('#resourcesSearch_validation_errors').hide(250).html(''); // Hide errors if they are visible
            //Change from here
            $.post('partials/functions/Search.php?type=user',postData,function(data){
                dataString = '';
                if(data.status == 1){
                    // The html for each object will be defined in data string.
                    if('user' in data){
                        for(i = 0; i < data.user.length; i++){
                            dataString += '<a id="viewProfile_btn" href="#" data-user="'+data.user[i].user_username+'" class="list-group-item">'+data.user[i].user_username+'</a>';
                        }
                    }else{
                        dataString = 'Unable to find matching result';
                    }
                }else{
                    dataString = 'Invalid query';
                }
                // Display the html
                $('#searchResults').show(250).html(dataString);
            })
        }
    })
}



// On click of a profile (this will open profile_viewer.html)
$(document).on('click','#viewProfile_btn', function(){
    if($('#searchResults').is(':visible'))
        $('#searchResults').hide(250);
    var user = $(this).data('user');
    // Load the profile view
    $('#profileViewer').load('partials/views/profile_viewer.html',function(){
        // Get profile info
        $.get('partials/functions/getInfo.php?type=profile&user='+user, function(data){
            // If Error loading profile
            if(data.status == 0){
                $('#profile_error').html('Error Loading profile');
                $('#profileViewer').show(250);
            }else{
                // If profile is not ready
                if(data.profile === null){
                    $('#profile_error').html('Profile not ready yet.');
                    $('#profileViewer').show(250);
                }else{
                    // Inject data
                    inject_userDetail(data.profile);
                    // Get relation of the user and potential mentor
                    $.get('partials/functions/getInfo.php?type=relation&receiver='+data.profile.userDetail_id, function(data){
                        renderProfileViewer(data,user);
                        $('#profileViewer').show(250);
                    });
                }
            }
        })
    })
})

// On click of the back button (check profile_viewer.html)
$(document).on('click','#cancelProfileView', function(){
    $('#profileViewer').hide(250, function(){
        if($('#searchResults').children().length > 0)
            $('#searchResults').show(250);
    }).html('');
})

/* On click of one of the action buttons
    username is passed along with each button..
    oppositeRelation: Post relation actions
    1. viewPathway
    2. acceptRequest
    3. declineRequest
    ---
    relation: Pre relation actions
    1. mentor_remove (this is post relation action)
    2. mentor_add
    3. mentor_cancel_request
*/

$(document).on('click','#mentor_add, #mentor_remove, #mentor_cancel_request, #acceptRequest, #declineRequest',function(){
    var user = $(this).data('user');
    $.post('partials/functions/mentorActions.php',{action : this.id, receiver : user},function(data){
        if(data.status == 1){
            $('#profileViewer').hide(250, function(){
                // update profile_viewer.html contents
                $.get('partials/functions/getInfo.php?type=relation&receiver='+data.receiver_id, function(data){
                    $('#request_buttons').html(''); // Empty the request buttons
                    renderProfileViewer(data,user);
                    // get a list of requests (this is async)
                    $.get('partials/functions/getInfo.php?type=myrequests', function(data){
                        updateNotifications(data);
                    })
                    // get a list of mentors
                    $.get('partials/functions/getInfo.php?type=mymentors', function(data){
                        updateMyMentors(data);
                        $.get('partials/functions/getInfo.php?type=myusers', function(data){
                            updateMyUsers(data);
                        })
                    })
                    $('#profileViewer').show(250);
                }) //.get
            }) //.hide
        }else{
            $('#profile_error').html(data.error);
        } //.else
    }) //.post
}) //.document

/* ~~~~~~~~~~~~~~~~~~~~~ COMMON MENTOR FUNCTIONS ~~~~~~~~~~~~~~~~~~~~~~ 
    For all the functions below , use $.get(url, function(data)) to perform AJAX request
    renderProfileViewer(data,user) : data from getInfo.php?type=relation&user=n (where n is a user_id), user is the reciever (eg. when sending a mentor request, user will be the receiver)
                                     user element must in the data-user tag, such as <a data-user="username" href="#">click here</a>, which can retrieved in jQuery later on click of that element..
                                     $(document).on('click','#viewProfile_btn', function(){
                                        var user = $(this).data('user');
                                        ...
    renderMyMentors(data) : data from getInfo.php?type=mymentors
    renderMyUsers(data) : data from getInfo.php?type=myusers
    updateNotifications(data) : data from getInfo.php?type=myrequests
*/

function renderProfileViewer(data,user){
    // Render html depending on the response (check getInfo.php)
    $('#relationText').html(data.relation);
    switch(data.oppositeRelationStatus){
        case 1:
            $('#oppositeRelationText').html(data.oppositeRelation);
            $('#oppositeRelationText').addClass('alert-success');
            $('#request_buttons').append('<button id="viewPathway" data-user="'+user+'" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-road"></span> View pathway</button>&nbsp;');
            break;
        case 2:
            $('#oppositeRelationText').html(data.oppositeRelation);
            $('#oppositeRelationText').addClass('alert-info');
            var htmlString = '<button id="acceptRequest" data-user="'+user+'" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-ok"></span> Accept</button>';
            htmlString += '&nbsp;';
            htmlString += '<button id="declineRequest" data-user="'+user+'" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove"></span> Decline</button>';
            htmlString += '&nbsp;';
            $('#request_buttons').append(htmlString);
            break;
    }
    switch(data.relationStatus){
        case 0:
            $('#relationText').addClass('alert-danger');
            break;
        case 1:
            $('#relationText').addClass('alert-success');
            $('#request_buttons').append('<button data-user="'+user+'" id="mentor_remove" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-minus"></span> Remove mentor</button>');
            break;
        case 2:
            $('#relationText').addClass('alert-warning');
            $('#request_buttons').append('<button data-user="'+user+'" id="mentor_add" class="btn btn-sm btn-primary"><span class="glyphicon glyphicon-plus"></span> Add as mentor</button>');
            break;
        case 3:
            $('#relationText').addClass('alert-info');
            $('#request_buttons').append('<button data-user="'+user+'" id="mentor_cancel_request" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-remove"></span> Cancel request</button>');
            break;
    }
}

function updateNotifications(data){
    if('requests' in data){
        var dataString = '';
        for(i = 0; i < data.requests.length; i++){
            dataString += '<a id="viewProfile_btn" href="#" data-user="'+data.requests[i].user_username+'" class="list-group-item">'+data.requests[i].user_username+' : '+data.requests[i].userDetail_firstName+' '+data.requests[i].userDetail_lastName+'</a>';
        }
        $('#notifications .list-group').html(dataString);
        $('#notifications .badge').html(data.requests.length);
        $('#notifications').show(250);
    }else{
        if($('#notifications').is(':visible'))
            $('#notifications').hide(250);
    }
}

function updateMyMentors(data){
    if('mentors' in data){
        var dataString = '';
        for(i = 0; i < data.mentors.length; i++){
            dataString += '<a id="viewProfile_btn" href="#" data-user="'+data.mentors[i].user_username+'" class="list-group-item">'+data.mentors[i].user_username+' : '+data.mentors[i].userDetail_firstName+' '+data.mentors[i].userDetail_lastName+'</a>';
        }
        $('#mymentors').html(dataString);
    }else{
        $('#mymentors').html('<div class="alert alert-warning text-center">Your mentor list is empty!</div>');
    }
}

function updateMyUsers(data){
    if('users' in data){
        var dataString = '';
        for(i = 0; i < data.users.length; i++){
            dataString += '<a id="viewProfile_btn" href="#" data-user="'+data.users[i].user_username+'" class="list-group-item">'+data.users[i].user_username+' : '+data.users[i].userDetail_firstName+' '+data.users[i].userDetail_lastName+'</a>';  
        }
        $('#myusers').html(dataString);
    }else{
        // TODO: Display "oh no, It seems like you are not mentoring any users"
        $('#myusers').html('<div class="alert alert-warning text-center">Your user list is empty!</div>');
    }
}

/* ~~~~~~~~~~~~~~~~~~~~~ COMMON GENERAL FUNCTIONS ~~~~~~~~~~~~~~~~~~~~~~ */


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

