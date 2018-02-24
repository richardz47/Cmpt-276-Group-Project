require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "reject empty name" do
    @test = Event.new(name: " ", start_time: DateTime.now, end_time: DateTime.now, created_by: "Test@test.com")
    assert_not @test.valid?
  end

  test "reject lack of owner" do #Owner can also be refered to as created_by
    @test = Event.new(name: "name", start_time: DateTime.now, end_time: DateTime.now, created_by: " ")
    assert_not @test.valid?
  end

end
