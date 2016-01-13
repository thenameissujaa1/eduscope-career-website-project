// Get the title of the page, and depending on that, we load the appropriate content
var currentTitle = $(document).find("title").text();

// Check if the partial is appropriate to load for this page, we do this by checking the title
$('#header').load("partials/navbar.html");  
$('#contact-us').load("partials/contactus.html");
$('#footer').load("partials/footer.html");
$('#about').load("partials/aboutus.html");
$('#animated-number').load("partials/funfacts.html");
$('#testimonial').load("partials/testimonial.html");
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