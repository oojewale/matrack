module Matrack
  module HelperTags

    def email_validator
      '[A-Za-z0-9_\-\.]+\@[A-Za-z0-9_\-\.]+\.[A-Za-z]{2,4}'
    end

    def textbox_tag(name, value = "", class_name = "", holder = "", req = nil,
                  disabled = nil)
      tag = "<input type='text' name='#{name}' value='#{value}' "
      tag += "placeholder='#{holder}' class='#{class_name}'"
      tag += "required='#{req}'" unless req.nil?
      tag += disabled.nil? ? ">" : " disabled='#{disabled}'>"
    end

    def password_tag(name, class_name = "", holder = "", req = nil,
                     disabled = nil)
      tag = "<input type='password' name='#{name}' "
      tag += "placeholder='#{holder}' class='#{class_name}'"
      tag += "required='#{req}'" unless req.nil?
      tag += disabled.nil? ? ">" : " disabled='#{disabled}'>"
    end

    def emailbox_tag(name, value = "", class_name = "", holder = "", req = nil,
                   disabled = nil, pattern = nil)
      tag = "<input type='email' name='#{name}' value='#{value}' "
      tag += "placeholder='#{holder}' class='#{class_name}'"
      tag += "required='#{req}'" unless required.nil?
      regex_pattern = pattern.nil? ? "#{email_validator}" : "#{pattern}"
      tag += " pattern='#{regex_pattern}'"
      tag += disabled.nil? ? ">" : " disabled='#{disabled}'>"
    end

    def submit_tag(name, value = "Submit", class_name = "")
      tag = "<input type='submit' name='#{name}' value='#{value}' "
      tag += "class='#{class_name}'>"
    end

    def link_tag(ref, class_name = "", title = "Link")
      "<a href='#{ref}' class='#{class_name}'>#{title}</a>"
    end

    def image_tag(name, alt = "image")
      "<img src='../../images/#{name}' alt= '#{alt}'>"
    end

    def include_stylesheet(name)
      "<link href='../../css/#{name}.css' rel='stylesheet' type= 'text/css'>"
    end

    def include_javascript(name)
      "<script src='../../js/#{name}.js' type='text/javascript'></script>"
    end

    def display_favicon
      "<link rel='icon' type='image/png' href='../../images/favicon.png' />"
    end
  end
end
