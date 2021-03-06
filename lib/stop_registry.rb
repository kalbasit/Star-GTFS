
class StopRegistry
  def initialize
    @reg = {}
  end

  def clean_up str
    str.gsub( /\*/, '' )
  end
      
      
  def []( stop_name )
    stop_name = clean_up( stop_name )
    key = stop_name.to_url
    unless @reg.has_key? key
      @reg[key] = Stop.create( :name => stop_name, :accessible => false )
      @reg[key].stop_aliases.create( :src_id => @reg[key].id,
                                     :src_code => @reg[key].id,
                                     :src_name => stop_name )
    end
    @reg[key]
  end    
end
