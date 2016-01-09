// Get the title of the page, and depending on that, we load the appropriate content
var currentTitle = $(document).find("title").text();

// Check if the partial is appropriate to load for this page, we do this by checking the title
if(currentTitle === "Eduscope Homepage"){
    $('#header').load("partials/navbar.html");  
    $('#contact-us').load("partials/contactus.html");
    $('#footer').load("partials/footer.html");
}