jQuery ->

  $(document).ready(()->
    $("#email").focus();
  )

  $("#authorize").live("click", () ->
    setTimeout(authorize, 10)
  )

  $("#email").live("click", () ->
    setTimeout(validate_email, 10)
  )

  $("#password").live("click", () ->
    setTimeout(validate_password, 10)
  )

  $("#email").live("keydown", () ->
    setTimeout(validate_email, 10)
  )

  $("#password").live("keydown", () ->
    setTimeout(validate_password, 10)
  )

  validate_email = ()->
    $("#email").css("background", "rgb(255, 255, 255)")
    $("#error_email").text("")

  validate_password = ()->
    $("#password").css("background", "rgb(255, 255, 255)")
    $("#error_password").text("")

  authorize = ()->
    if $("#email").val()
      reg = /^([a-z0-9_\-]+\.)*[a-z0-9_\-]+\@([a-z0-9][a-z0-9\-]*[a-z0-9]\.)+[a-z]{2,4}$/i;
      val = $("#email").val();
      if reg.test(val)
        jQuery.post('/login/check_of_existence_email', {email: $("#email").val()},(data)->
          (
            if data != "true"
              $("#email").css("background", "rgba(255, 0, 0, 0.2)");
              $("#error_email").text("пользователь с таким email-ом не зарегистрирован");
              $("#email").focus();
            else
              $("#email").css("background", "rgba(0, 255, 0, 0.2)");
              if $("#password").val()
                jQuery.post('/login/authorize', {email: $("#email").val(), password: $("#password").val()},(data)->
                  (
                    if data != "true"
                      $("#password").css("background", "rgba(255, 0, 0, 0.2)");
                      $("#error_password").text("неверный пароль");
                      $("#password").focus();
                    else
                      jQuery.post('/login/activated', {email: $("#email").val()},(data)->
                        (
                          if data != "true"
                            $("#email").css("background", "rgba(255, 0, 0, 0.2)");
                            $("#error_email").text("пользователь с таким email-ом не активирован");
                            $("#email").focus();
                          else
                            jQuery.post('/login/banned', {email: $("#email").val()},(data)->
                              (
                                if data == "true"
                                  $("#email").css("background", "rgba(255, 0, 0, 0.2)");
                                  $("#error_email").text("пользователь с таким email-ом забанен");
                                  $("#email").focus();
                              )
                            );
                        )
                      );
                  )
                );
              else
                $("#error_password").text("введите пароль");
                $("#password").css("background", "rgba(255, 0, 0, 0.2)");
                $("#password").focus();
          )
        );
      else
        $("#error_email").text("email введен некорректно");
        $("#email").css("background", "rgba(255, 0, 0, 0.2)");
        $("#email").focus();
    else
      $("#error_email").text("введите email");
      $("#email").css("background", "rgba(255, 0, 0, 0.2)");
      $("#email").focus();