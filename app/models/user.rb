class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides

    has_secure_password

    def mood
        if self.happiness >= self.nausea
            "happy"
        else
            "sad"
        end
    end

    def public_attributes
        {name: self.name, height: self.height, mood: self.mood, tickets: self.tickets}
    end

end
