module Admin::UserHelper
  def user_edit_text_field(name, head, value, mark = false, help = "")
    color = (flash[name])? ("rgba(255, 0, 0, 0.2)"): ("white")
    message = flash[name] if flash[name]
    head = (mark)? ("#{head} *"): (head)
    content_tag(:tr,
      content_tag(:td, content_tag(:label, head)) <<
      content_tag(:td, text_field_tag(name, value, :style => "background: #{color}", :placeholder => help))  <<
      content_tag(:td, message, :style => "color: rgba(255, 0, 0, 0.8);", :id => "error_#{name}")
    )
  end

  def user_new_text_field(name, head, value, mark = false, help = "")
    color = (flash[name])? ("rgba(255, 0, 0, 0.2)"): ("white")
    message = flash[name] if flash[name]
    head = (mark)? ("#{head} *"): (head)
    content_tag(:tr,
                content_tag(:td, content_tag(:label, head)) <<
                    content_tag(:td, text_field_tag(name, value, :style => "background: #{color}", :placeholder => help))  <<
                    content_tag(:td, message, :style => "color: rgba(255, 0, 0, 0.8);", :id => "error_#{name}")
    )
  end
end
