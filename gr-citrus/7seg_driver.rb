pins = [10, 11, 12, 13]

pins.each do |pin|
    pinMode(pin, 1)
end

2.times do
    (0..9).each do |num|
        pins.each_with_index do |pin, i|
            d = LOW
            if (num & (1 << i)) > 0 then
                d = HIGH;
            end
            digitalWrite(pin, d)
        end
        delay 500
    end
end

pins.each do |pin|
    digitalWrite(pin, 0)
end