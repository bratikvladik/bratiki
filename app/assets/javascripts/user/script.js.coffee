jQuery ->
  reselect = (select, addclass)->

    if typeof(addclass) == 'undefined'
      addclass = '';

    $(select).wrap('<div class="sel_wrap ' + addclass + '"/>');
    
    sel_options = '';
    
    selected_option = false;
    
    $(select).children('option').each(()->
      if($(this).is(':selected'))
        selected_option = $(this).index();
      sel_options = sel_options + '<div class="sel_option" value="' + $(this).val() + '">' + $(this).html() + '</div>';
    )
    
    
    
    sel_imul = '<div class="sel_imul"><div class="sel_selected"><div class="sel_icon">u</div><div class="selected-text">' + $(select).children('option').eq(selected_option).html() + '</div><div class="sel_arraw"></div></div><div class="sel_options">' + sel_options + '</div></div>';

    $(select).before(sel_imul);

  $(document).ready(()->
    reselect('#sex', 'sec overf round');
  )



  $('.sel_imul').live('click', ()->

    $('.sel_imul').removeClass('act');
    $(this).addClass('act');

    if ($(this).children('.sel_options').is(':visible'))
      $('.sel_options').hide();
    else
      $('.sel_options').hide();
      $(this).children('.sel_options').show();
  )

  $('.sel_option').live('click', ()->
  
    
    tektext = $(this).html();
    $(this).parent('.sel_options').parent('.sel_imul').children('.sel_selected').children('.selected-text').html(tektext);

    

    $(this).parent('.sel_options').children('.sel_option').removeClass('sel_ed');

    $(this).addClass('sel_ed');


    #alert($(this).parent('.sel_imul').id);
    #faculty = $(this).attr('value');
    #alert($("#chair_id").parent('.sel_wrap sec overf round'));
    #faculty = 0 unless faculty;

    #alert(faculty);



    tekval = $(this).attr('value');
    if typeof(tekval) == 'undefined'
      tekval = tektext;
 
    $(this).parent('.sel_options').parent('.sel_imul').parent('.sel_wrap').children('select').children('option').removeAttr('selected').each(()->
        
      if ($(this).val() == tekval) 
        $(this).attr('selected', 'select');
    )
  )




  selenter = false;

  $('.sel_imul').live('mouseenter', ()->
    
    selenter = true;
    
  )

  $('.sel_imul').live('mouseleave', ()-> 
    selenter = false;
  )

  $(document).click(()->   
    if (!selenter)
      $('.sel_options').hide();
      $('.sel_imul').removeClass('act');
  )

  #$("#faculty_id").children('.sel_options').children(".sel_option").each(()->
  #  $(this).live('click', ()->
  #    setTimeout(change_faculty_id , 10);
  #  )
  #)

  $("#faculty_id .sel_options .sel_option").live("click",(e)->
    faculty = $(this).attr('value');
    if(!faculty)
      faculty = 0
    jQuery.get('/register/update_chair_select/'+faculty, (data)->
      $("#chair").parent("div").parent("p").html(data);
    )
    setTimeout(change_faculty_id, 200);
    e.stopPropagation();
  );


  change_faculty_id = ()->
    reselect("#chair", "sec overf round", "chair_id");
    $("#faculty_id .sel_options").hide();