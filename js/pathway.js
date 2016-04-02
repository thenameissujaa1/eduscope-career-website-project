// Called on click of view pathway
function initializePathway(){
    $('#pathway_viewer').fadeOut(0, function(){
        $('#pathway_viewer').load('partials/views/pathway.html',function(){
            $.get('partials/functions/getInfo.php?type=myhistory',function(data){
                if(data.status == 1){
                    var history = data.history;
                    if(history !== undefined){
                        var html = '';
                        for(i = 0; i < history.length; i++){
                            html += '<div class="col-xs-12 panel panel-default">';
                            html += '<div class="panel-body">';
                            html += '<h4>'+history[i].year+'<h4><h2>'+history[i].name+'<h2><h3>'+history[i].qualification+'<h3>';
                            html += '</div></div>';
                            html += '<div class="col-xs-12 text-center"><h1 class="glyphicon glyphicon-arrow-down"></h1></div>';    
                        }
                        $('#pastPathway').html(html);
                        $('#pathway_viewer').slideDown(1000);
                        buildFuture();
                    }else{
                        $('#pathway_viewer').slideDown(1000);
                        $('#path_error').html('You haven\'t added your history');
                    }
                }else{
                    $('#pathway_viewer').slideDown(1000);
                    $('#path_error').html(data.error);
                }
            })
        })
    })
}

function buildFuture(){
    
}