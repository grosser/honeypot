require 'honeypot'
ActionController::Base.send(:include,Honeypot::ControllerMethods) 
ActionView::Base.send(:include,Honeypot::ViewHelpers)
