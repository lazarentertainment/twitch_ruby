require 'ostruct' 
module TwitchRuby::Models

  class Channel < OpenStruct
    include TwitchRuby::IdEquality
    
    def mature?
      @mature
    end
  end
  
  
end