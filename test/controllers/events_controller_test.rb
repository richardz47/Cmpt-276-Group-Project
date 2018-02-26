require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    @test = users(:test)
    post login_path, params: {email: @test.email, password: '12345'}
    get newevent_path
    assert_response :success
  end

  test "shouldn't get new" do
    get newevent_path
    assert_redirected_to root_path
  end

  test "should get display" do
    @test = users(:test)
    post login_path, params: {email: @test.email, password: '12345'}
    get displayevents_url
    assert_response :success
  end

  test "shouldn't get display" do
    get displayevents_url
    assert_redirected_to root_path
  end

  test "valid new event" do
    @test = users(:test)
    post login_path, params: {email: @test.email, password: '12345'}
    post newevent_path, params: {event: {name: "test", start_time: DateTime.now, end_time: DateTime.now }}
    assert_equal(2, Event.count)
    assert_redirected_to event_url(Event.last)
  end

  test "invalid new event" do
    @test = users(:test)
    post login_path, params: {email: @test.email, password: '12345'}
    post newevent_path, params: {event: {name: "", start_time: DateTime.now, end_time: DateTime.now }}
    assert_equal(1, Event.count)
  end

  test "should show event" do
    @test = users(:test)
    post login_path, params: {email: @test.email, password: '12345'}
    @testevent = events(:test)
    get event_url(@testevent)
    assert_response :success
  end

  test "shouldn't show event w/o logged in" do
    @testevent = events(:test)
    get event_url(@testevent)
    assert_redirected_to root_path
  end

  test "shouldn't show event if wrong user" do
    @test = users(:test2)
    post login_path, params: {email: @test.email, password: '12345'}
    @testevent = events(:test)
    get event_url(@testevent)
    assert_redirected_to displayevents_url
  end  

end
