Array.class_eval do

  def ext_json    
    new_hash = {}    
    if self.length > 0      
      new_hash[:data] = self
      new_hash[:total] = self.first.class.name.classify.constantize.all.count
    else
      new_hash[:total] = 0
    end
    return new_hash
  end

end