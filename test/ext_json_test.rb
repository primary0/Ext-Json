require 'test_helper'

class ExtJsonTest < ActiveSupport::TestCase

  load_schema
  
  class Post < ActiveRecord::Base
  end
  
  def test_schema_has_loaded_correctly
    Post.destroy_all
    assert_equal [], Post.all
  end

  def test_ext_json_creates_proper_hash
    Post.destroy_all    
    Post.create(:title => "Sample Post One")
    Post.create(:title => "Another Post")
    assert_equal '{"data":[{"title":"Sample Post One","id":1},{"title":"Another Post","id":2}],"total":2}', Post.all.ext_json.to_json
  end
  
end
 