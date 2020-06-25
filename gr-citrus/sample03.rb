pinMode(10, 2)

usb = Serial.new(0)
100.times do
    usb.println(digitalRead(10).to_s)
    delay(100)
end