// Called on click of view pathway
function initializePathway(){
    $('#pathway_viewer').fadeOut(0, function(){
        $(this).load('partials/views/pathway.html',function(){
            loadGraphData();
            $(this).fadeIn(250);
        })
    })
}

// Called by initializePathway
function loadGraphData(){

}