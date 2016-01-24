// Get the title of the page, and depending on that, we load the appropriate content
var currentTitle = $(document).find("title").text();

// Check if the partial is appropriate to load for this page, we do this by checking the title
$('#header').load("partials/views/navbar.html");
$('#profile').load("partials/views/navbar-profile.html");
/* 
$('#overview').load("partials/views/overview.html"); 
$('#education').load("partials/views/education.html");
$('#contact').load("partials/views/contact.html");
$('#pathways').load("partials/views/pathways.html");
$('#mentoring').load("partials/views/mentoring.html");
$('#resources').load("partials/views/resources.html");
$('#settings').load("partials/views/settings.html");
*/
$('#contact-us').load("partials/views/contactus.html");
$('#footer').load("partials/views/footer.html");
$('#about').load("partials/views/aboutus.html");
$('#animated-number').load("partials/views/funfacts.html");
$('#testimonial').load("partials/views/testimonial.html");
// For testing purpose only
$('#navbar-profile').load("partials/views/navbar_profile.html")

/*
    To add fun facts use the code below
    <!---->
    <section id="animated-number">
    </section>
    <!--./-->
    
    To add testimonial add the code below
    <!---->
    <section id="testimonial">
    </section>
    <!--./-->
    
 */

$(window).load(function(){
    if(currentTitle === "Eduscope Homepage"){
        $('#nav-home').addClass('active');
    }
    if(currentTitle === "Eduscope Login"){
        $('#nav-login').addClass('active');
    }
});