require 'minitest/autorun'
require_relative './gate'
require_relative './ticket'

class GateTest < Minitest::Test 
    def test_gate
        umeda = Gate.new(:umeda)
        mikuni= Gate.new(:mikuni)

        ticket = Ticket.new(160)
        umeda.enter(ticket)
        assert mikuni.exit(ticket)
    end
end