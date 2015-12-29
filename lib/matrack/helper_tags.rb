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

    def image_tag(src, alt = "image")
      path = File.join(APP_PATH, "app", "assets","images",src)
      "<img src='#{path}' alt= '#{alt}'>"
    end

    def form_tag(action, class_name = "")
      # Not working yet
      if block_given?
        form = "<form action='#{action}' method='post' class='#{class_name}'>"
          # require "pry"; binding.pry
        fields = yield
        form +="<br/>#{fields}<br/></form>"
      else
        "Form_tag requires a block"
      end
    end

  end
end
