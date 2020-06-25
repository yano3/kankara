pinMode(10, 1)
pinMode(11, 1)
pinMode(12, 1)
pinMode(13, 1)
pinMode(14, 1)
pinMode(15, 2)

count = 50
wait = 170
flg = false

count.times do

    if digitalRead(15) == 0 then
        if flg then
            flg = false
        else
            flg = true
        end
    end

    if flg then
        digitalWrite(14, 1)
        digitalWrite(11, 0)
    delay(wait)
    digitalWrite(13, 1)
    digitalWrite(10, 0)
    delay(wait)
    digitalWrite(12, 1)
    digitalWrite(14, 0)
    delay(wait)
    digitalWrite(11, 1)
    digitalWrite(13, 0)
    delay(wait)
    digitalWrite(10, 1)
    digitalWrite(12, 0)
    delay(wait)

    else
        digitalWrite(10, 0)
        digitalWrite(11, 0)
        digitalWrite(12, 0)
        digitalWrite(13, 0)
        digitalWrite(14, 0)
        delay(wait * 5)
    end
end

digitalWrite(10, 0)
digitalWrite(11, 0)
digitalWrite(12, 0)
digitalWrite(13, 0)
digitalWrite(14, 0)
