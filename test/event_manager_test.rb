require 'minitest/autorun'
require 'minitest/emoji'
require './lib/event_manager'

class EventManagerTest < Minitest::Test
  file = "./event_attendees.csv"
  em = EventManager.new(file)

  assert_equal "1,11/12/08 10:47,Allison,Nguyen,arannon@jumpstartlab.com,6154385000,3155 19th St NW,Washington,DC,20010\n", em[1]
end
