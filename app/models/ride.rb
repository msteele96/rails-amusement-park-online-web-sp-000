class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        user = self.user
        attraction = self.attraction
        if user.height >= attraction.min_height && user.tickets >= attraction.tickets
            user.tickets = (user.tickets - attraction.tickets)
            user.happiness = (user.happiness + attraction.happiness_rating)
            user.nausea = (user.nausea + attraction.nausea_rating)
            user.save
            "Thanks for riding the #{attraction.name}!"
        elsif user.height >= attraction.min_height && user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height && user.tickets >= attraction.tickets
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif user.height < attraction.min_height && user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        end
    end
end
