class Car
    attr_accessor :parkingbrake
    attr_reader :speed, :color, :make, :modelyear, :lights
    def initialize(make, modelyear, color)
        @make = make
        @modelyear = modelyear
        @speed = 0
        @lights = "off"
        @parkingbrake = "on"
        @color = color
    end

    def accelerate
        if @parkingbrake == "off"
            @speed = @speed + 10
        end
    end

    def brake
        if @speed >= 7
            @speed = @speed - 7
        else
            @speed = 0
        end
    end

    def lightsToggle
        if @lights == "off"
            @lights = "on"
        else
            @lights = "off"
        end
    end


end
