Array.class_eval do

  # Extends the Array class to provide an Ext JS friendly JSON output from a hash of ActiveRecord objects.
  def ext_json 
       
    new_hash = {}
    new_hash[:total] = 0
    new_hash[:data] = []    
        
    if self.length > 0      
      new_hash[:data] = self
      if self.first.class.name.constantize.respond_to?("all")
        new_hash[:total] = self.first.class.name.constantize.all.count
      else
        new_hash[:total] = self.length
      end
    end
    
    return new_hash
    
  end

end