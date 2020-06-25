pinMode(14, 1)

10000.times do
    digitalWrite(14, 1)
    delay(2)
    digitalWrite(14, 0)
    delay(8)
end