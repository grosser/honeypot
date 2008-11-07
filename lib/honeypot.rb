module Honeypot
  module ControllerMethods
    def check_honeypots
      return true if honeypot_untouched?
      flash[:notice] = 'You are a robot, or using some strange script.... (if you are not, we overreacted, please contact us.)'
      redirect_to :back
      return false
    end
    
    def honeypot_untouched?
      submitted = params['its_so_sweet']
      return false if submitted.blank?
      submitted['email'] == 'john@doe.com' && submitted['name'] == '' && submitted['agree'].blank?
    end
  end
  
  module ViewHelpers
    def honeypot
      content_tag('div', :style => 'position: absolute; left: -2000px;') do
        text_field_tag('its_so_sweet[email]','john@doe.com',:tabindex=>900) +
        text_field_tag('its_so_sweet[name]','',:tabindex=>901) +
        check_box_tag('its_so_sweet[agree]',1,false,:tabindex=>902)
      end
    end
  end
end
