/*
    Author: Balraj
    app.js links the application with the backend, sending and recieving data that is to be viewed
    on the front end. 
*/

// When the page load, perform given actions
$(window).load(function(){
/*
    data.status holds the status of the response as follows..
    0 : user not logged in
    1 : user logged in, but no profile details found, first time login
    2 : user logged in, profile details found
*/
    $.get('partials/functions/loadProfile.php', function(data){
        console.log(JSON.stringify(data.status));
        switch(data.status){
            case 0:
                window.location.href = 'login.html';
                break;
            case 1:
                load_commonViews();
                $('#content').html(data.html);
                $('#user_username').html(data.username);
                break;
            case 2:
                load_commonViews();
                $('#content').html(data.html);
                update_profileView(data.userDetail);
                break;
        }
    }, 'json');
    
});

// This function is triggered everytime an ajax call is started
$(document).ajaxStart(function(){
    $('#content').load('partials/views/loading.html');
});

// This function is triggered everytime an ajax call is stopped
$(document).ajaxStop(function(){

});

         /* ~~~~~~~~~~~~~~~~~ FUNCTIONS ~~~~~~~~~~~~~~~~~~~ */


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
    $('#header-main').load('partials/views/navbar_profile.html');
    $('footer').load('partials/views/footer.html');
    //fixFooter();

}

/*  This function updates the profile view after it has loaded by
    taking the JSON data from the server and putting it in the HTML
    data : JSON object from the server
*/
function update_profileView(data){
    $('#user_username').html(data.username);
    $('#userDetail_firstName').html(data.userDetail_firstName);
    $('#userDetail_lastName').html(data.userDetail_lastName);
    // ?? Profile picture
    $('#userDetail_nationality').html(data.userDetail_nationality);
    $('#userDetail_age').html(data.userDetail_age);
    $('#userDetail_occupation').html(data.userDetail_occupation);
    $('#userDetail_gpa').html(data.userDetail_gpa);
}