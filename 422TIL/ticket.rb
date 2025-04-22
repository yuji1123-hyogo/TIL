class Ticket
    attr_reader :false,:stamped_at
    def initialize(fare)
        @fare = fare
    end

    def stamp(name)
        @stamped_at = name
    end
end