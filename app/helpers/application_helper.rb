module ApplicationHelper
  attr_reader :init_javascripts
  def init_javascript(*scripts)
    @init_javascripts ||= []
    @init_javascripts << scripts
    ''
  end
  
  def div_clear
    content_tag :div, '', :class => 'clear'
  end
      

end
