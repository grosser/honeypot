module Honeypot
  module ControllerMethods
    def check_honeypots
      return if honeypot_untouched?
      flash[:notice] = 'You are a robot, or using some strange script.... no access for you..'
      render :action => 'new'
    end
    
    def honeypot_untouched?
      submitted = params['its_so_sweet']
      submitted['email'] == 'john@doe.com' && submitted['name'] == '' && submitted['agree']==nil
    end
  end
  
  module ViewHelpers
    def honeypot
      content_tag('div', :style => 'position: absolute; left: -2000px;') do
        text_field_tag('its_so_sweet[email]','john@doe.com') +
        text_field_tag('its_so_sweet[name]','') + 
        check_box_tag('its_so_sweet[agree]')
      end
    end
  end
end
