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
                            html += '<div class="col-xs-12 panel panel-default" style="background-color:'+randomColor({luminosity: 'light',format: 'rgba'})+'">';
                            html += '<div class="panel-body">';
                            html += '<h4>'+history[i].year+'<h4><h2>'+history[i].name+'<h2><h3>'+history[i].qualification+'<h3>';
                            html += '</div></div>';
                            html += '<div class="col-xs-12 text-center"><h1 class="glyphicon glyphicon-arrow-down"></h1></div>';
                        }
                        $('#pastPathway').html(html);
                        // Future
                        $.get('partials/functions/getInfo.php?type=userDetail',function(data){
                            if(data.status == 1){
                                var maxQual = data.userDetail.userDetail_minQualification;
                                var selections = [];
                                $('#maxQual').append(maxQual);
                                html = '';
                                // Set inital options based on choosing
                                switch(maxQual){
                                    case 'GCSE/S4':
                                       html = renderOption_2('You could do...',
                                            'Foundation Year','AS/S5',
                                            'warning','primary',
                                            'Not many universities support this','AS Levels or S5 for better opportunities',
                                            'foundation_year','s5',
                                            's4');
                                    break;
                                    case 'AS Level/S5':
                                        html = renderOption_4('You could do...',
                                            'Foundation Year','Bachelors','A levels/S6','Bachelors with honours',
                                            'primary','warning','primary','warning',
                                            'Some choose to do a foundation year instead of A levels','Not many universities support this','A levels/S6 is recommended by most universities','Get honours degree instead of an ordinary degree',
                                            'foundation_year','bachelors','s6','bhons',
                                            's5');
                                    break;
                                    case 'A Level/S6':
                                        html = renderOption_2('You could do...',
                                            'Bachelors','Bachelors with honours',
                                            'warning','primary',
                                            'You will start your Bachelors','Recommended path',
                                            'bachelors','bhons',
                                            's6');
                                    break;
                                    case 'Bachelors':
                                        html = renderOption_2('You could do...',
                                            'Job','Masters',
                                            'primary','primary',
                                            'Work experience is always good','Masters will help you improve in your field of study',
                                            'job','masters',
                                            'bachelors')
                                    break;
                                    case 'Bachelors with Honours':
                                        html = renderOption_3('You could do...',
                                            'Job','PhD','Masters',
                                            'primary','primary','primary',
                                            'Work experience is always good','If you love your field of study','Masters will help you improve in your field of study',
                                            'job','phd','masters',
                                            'bhons')
                                    break;
                                    case 'Masters':
                                        html = renderOption_2('You could do...',
                                            'Job','PhD',
                                            'primary','primary',
                                            'Work experience is always good','If you love your field of study, then go for it!',
                                            'job','phd',
                                            'masters')
                                    break;
                                    case 'PhD':
                                        html = renderOption_2('You could do...',
                                            'Job','PhD',
                                            'primary','primary',
                                            'Work experience is always good','Another one!',
                                            'final_job','phd',
                                            'phd')
                                    break;
                                }
                                $('#futurePathway').html(html);
                                $('#pathway_viewer').slideDown(1000);
                            }else{
                                $('#pathway_viewer').slideDown(1000);
                                $('#path_error').html(data.error);
                            }
                        })
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

/*
    this is for two options
    title
    a : option a
    b : option b
    type_a : default or warning or danger or primary
    type_b : default or warning or danger or primary
    help_a : helper text
    help_b : helper text
    data_to_a : where will this option lead?
    data_to_b : where will this option lead?
    data_from : where is this option coming from?
*/

function renderOption_1(title,a,type_a,help_a,data_to_a,data_from){
    var html = '<div class="col-xs-12 text-center"><h1 class="glyphicon glyphicon-arrow-down"></h1></div>';
    html += '<div class="col-xs-12 panel panel-default">';
    html += '<div class="panel-heading">'+title+'</div>';
    html += '<div class="panel-body"><div class="row"><div class="col-sm-12">';
    html += '<button class="btn btn-lg btn-'+type_a+'" id="future_select" data-from="'+data_from+'" data-to="'+data_to_a+'">'+a+'</button>';
    html += '<p>'+help_a+'</p>';
    html += '</div></div>';
    html += '<div class="panel-footer"><button class="btn btn-xs btn-primary" id="save_pathway" data-final="'+data_from+'">Stop and save pathway</button></div>';
    html += '</div></div>';
    return html;
}

function renderOption_2(title,a,b,type_a,type_b,help_a,help_b,data_to_a,data_to_b,data_from){
    var html = '<div class="col-xs-12 text-center"><h1 class="glyphicon glyphicon-arrow-down"></h1></div>';
    html += '<div class="col-xs-12 panel panel-default">';
    html += '<div class="panel-heading">'+title+'</div>';
    html += '<div class="panel-body"><div class="row"><div class="col-sm-6">';
    html += '<button class="btn btn-lg btn-'+type_a+'" id="future_select" data-from="'+data_from+'" data-to="'+data_to_a+'">'+a+'</button>';
    html += '<p>'+help_a+'</p>';
    html += '</div><div class="col-sm-6">';
    html += '<button class="btn btn-lg btn-'+type_b+'" id="future_select" data-from="'+data_from+'" data-to="'+data_to_b+'">'+b+'</button>';
    html += '<p>'+help_b+'</p>';
    html += '</div></div>';
    html += '<div class="panel-footer"><button class="btn btn-xs btn-primary" id="save_pathway" data-final="'+data_from+'">Stop and save pathway</button></div>';
    html += '</div></div>';
    return html;
}

function renderOption_3(title,a,b,c,type_a,type_b,type_c,help_a,help_b,help_c,data_to_a,data_to_b,data_to_c,data_from){
    var html = '<div class="col-xs-12 text-center"><h1 class="glyphicon glyphicon-arrow-down"></h1></div>';
    html += '<div class="col-xs-12 panel panel-default">';
    html += '<div class="panel-heading">'+title+'</div>';
    html += '<div class="panel-body"><div class="row"><div class="col-sm-4">';
    html += '<button class="btn btn-lg btn-'+type_a+'" id="future_select" data-from="'+data_from+'" data-to="'+data_to_a+'">'+a+'</button>';
    html += '<p>'+help_a+'</p>';
    html += '</div><div class="col-sm-4">';
    html += '<button class="btn btn-lg btn-'+type_b+'" id="future_select" data-from="'+data_from+'" data-to="'+data_to_b+'">'+b+'</button>';
    html += '<p>'+help_b+'</p>';
    html += '</div><div class="col-sm-4">';
    html += '<button class="btn btn-lg btn-'+type_c+'" id="future_select" data-from="'+data_from+'" data-to="'+data_to_c+'">'+c+'</button>';
    html += '<p>'+help_c+'</p>';
    html += '</div></div>';
    html += '<div class="panel-footer"><button class="btn btn-xs btn-primary" id="save_pathway" data-final="'+data_from+'">Stop and save pathway</button></div>';
    html += '</div></div>';
    return html;
}

function renderOption_4(title,a,b,c,d,type_a,type_b,type_c,type_d,help_a,help_b,help_c,help_d,data_to_a,data_to_b,data_to_c,data_to_d,data_from){
    var html = '<div class="col-xs-12 text-center"><h1 class="glyphicon glyphicon-arrow-down"></h1></div>';
    html += '<div class="col-xs-12 panel panel-default">';
    html += '<div class="panel-heading">'+title+'</div>';
    html += '<div class="panel-body"><div class="row"><div class="col-sm-3">';
    html += '<button class="btn btn-sm btn-'+type_a+'" id="future_select" data-from="'+data_from+'" data-to="'+data_to_a+'">'+a+'</button>';
    html += '<p>'+help_a+'</p>';
    html += '</div><div class="col-sm-3">';
    html += '<button class="btn btn-sm btn-'+type_b+'" id="future_select" data-from="'+data_from+'" data-to="'+data_to_b+'">'+b+'</button>';
    html += '<p>'+help_b+'</p>';
    html += '</div><div class="col-sm-3">';
    html += '<button class="btn btn-sm btn-'+type_c+'" id="future_select" data-from="'+data_from+'" data-to="'+data_to_c+'">'+c+'</button>';
    html += '<p>'+help_c+'</p>';
    html += '</div><div class="col-sm-3">';
    html += '<button class="btn btn-sm btn-'+type_d+'" id="future_select" data-from="'+data_from+'" data-to="'+data_to_d+'">'+d+'</button>';
    html += '<p>'+help_d+'</p>';
    html += '</div></div>';    
    html += '<div class="panel-footer"><button class="btn btn-xs btn-primary" id="save_pathway" data-final="'+data_from+'">Stop and save pathway</button></div>';
    html += '</div></div>';
    return html;
}

$(document).on('click','#save_pathway',function(){
    $(this).removeClass('btn-primary').addClass('btn-success').parent().attr('style','background-color: #90EE90').parent().find('button').attr('disabled','disabled');
})

var future_pathway = [];

$(document).on('click','#future_select',function(){
    var from = $(this).data('from');
    var to = $(this).data('to');
    future_pathway.push({"from":from,"to":to});
    if($(this).hasClass('btn-sm'))
        $(this).attr('class','btn btn-sm btn-success');
    else
        $(this).attr('class','btn btn-lg btn-success');
    $(this).parent().parent().find('button').attr('disabled','disabled');
    $(this).parent().parent().parent().find('.panel-footer').hide();
    var html = '';
    if(from == 's4' && to == 's5'){
        html = renderOption_4('You could do...',
            'Foundation Year','Bachelors','A levels/S6','Bachelors with honours',
            'primary','warning','primary','warning',
            'Some choose to do a foundation year instead of A levels','Not many universities support this','A levels/S6 is recommended by most universities','Get honours degree instead of an ordinary degree',
            'foundation_year','bachelors','s6','bhons',
            's5');
    }
    if(from == 's4' && to == 'foundation_year'){
        html = renderOption_2('You could do...',
            'Bachelors','Bachelors with honours',
            'warning','primary',
            'You will start your Bachelors','Recommended path',
            'bachelors','bhons',
            'foundation_year');
    }
    if(from == 's5' && to == 'foundation_year'){
        html = renderOption_2('You could do...',
            'Bachelors','Bachelors with honours',
            'warning','primary',
            'You will start your Bachelors','Recommended path',
            'bachelors','bhons',
            'foundation_year');
    }
    if(from == 's5' && to == 's6'){
        html = renderOption_2('You could do...',
            'Bachelors','Bachelors with honours',
            'warning','primary',
            'You will start your Bachelors','Recommended path',
            'bachelors','bhons',
            's6');
    }
    if((from == 's6' && to == 'bhons') || (from == 's5' && to == 'bhons') || (from == 'foundation_year' && to == 'bhons')){
        html = renderOption_3('You could do...',
            'Job','PhD','Masters',
            'primary','primary','primary',
            'Work experience is always good','If you love your field of study','Masters will help you improve in your field of study',
            'job','phd','masters',
            'bhons')
    }
    if(from == 'bhons' && to == 'job'){
        html = renderOption_2('You could do...',
            'Masters','PhD',
            'primary','primary',
            'Masters will help you improve in your field of study, and help you get a promotion','If you love your field of study, then go for it!',
            'masters','phd',
            'job')
    }
    if(from == 'bhons' && to == 'phd'){
        html = renderOption_2('You could do...',
            'Job','PhD',
            'primary','primary',
            'Work experience is always good','Another one!',
            'job','phd',
            'phd')
    }
    if(from == 'bhons' && to == 'masters'){
        html = renderOption_2('You could do...',
            'Job','Masters',
            'primary','primary',
            'Work experience is always good','Masters will help you improve in your field of study',
            'job','masters',
            'bachelors')
    }
    if((from == 's6' && to == 'bachelors') || (from == 'foundation_year' && to == 'bachelors') || (from == 's5' && to == 'bachelors')){
        html = renderOption_2('You could do...',
            'Job','Masters',
            'primary','primary',
            'Work experience is always good','Masters will help you improve in your field of study',
            'job','masters',
            'bachelors')
    }
    if(from == 'bachelors' && to == 'masters'){
        html = renderOption_2('You could do...',
            'Job','PhD',
            'primary','primary',
            'Work experience is always good','If you love your field of study, then go for it!',
            'job','phd',
            'masters')
    }
    if(from == 'bachelors' && to == 'job'){
        html = renderOption_2('You could do...',
            'Masters','PhD',
            'primary','primary',
            'Masters will help you improve in your field of study, and help you get a promotion','If you love your field of study, then go for it!',
            'masters','phd',
            'job')
    }
    if(from == 'job' && to == 'masters'){
        html = renderOption_2('You could do...',
            'Job','PhD',
            'primary','primary',
            'Work experience is always good','Another one!',
            'job','phd',
            'masters')
    }
    if(from == 'job' && to == 'phd'){
        html = renderOption_2('You could do...',
            'Masters','PhD',
            'primary','primary',
            'Masters will help you improve in your field of study, and help you get a promotion','If you love your field of study, then go for it!',
            'masters','phd',
            'phd')
    }
    if(from == 'masters' && to == 'phd'){
        html = renderOption_3('You could do...',
            'Job','PhD','Masters',
            'primary','primary','Primary',
            'Work experience is always good','Another one!','Masters will help you improve in your field of study, and help you get a promotion',
            'job','phd','masters',
            'phd')
    }
    if(from == 'masters' && to == 'masters'){
        html = renderOption_3('You could do...',
            'Job','PhD','Masters',
            'primary','primary','Primary',
            'Work experience is always good','If you love your field of study.','Another masters, probably in some other area will make you an all rounder',
            'job','phd','masters',
            'phd')
    }
    if(from == 'masters' && to == 'job'){
        html = renderOption_2('You could do...',
            'Masters','PhD',
            'primary','primary',
            'Masters will help you improve in your field of study, and help you get a promotion','If you love your field of study, then go for it!',
            'masters','phd',
            'job')
    }
    if(from == 'phd' && to == 'phd'){
        html = renderOption_2('You could do...',
            'Job','PhD',
            'primary','primary',
            'Work experience is always good','Another one!',
            'job','phd',
            'phd')
    }
    if(from == 'phd' && to == 'job'){
        html = renderOption_2('You could do...',
            'Masters','PhD',
            'primary','primary',
            'Masters will help you improve in your field of study, and help you get a promotion','If you love your field of study, then go for it!',
            'masters','phd',
            'job')
    }
    $(html).appendTo('#futurePathway').fadeIn(500);
})