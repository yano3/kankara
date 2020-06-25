pinMode(10, 1)
pinMode(11, 1)
pinMode(15, 2)

count = 50
wait = 170
flg = false

500.times do

#    puts digitalRead(15).to_s

    if digitalRead(15) == 0 then
        if flg then
            flg = false
        else
            flg = true
        end
    end

    puts flg.to_s

    if true then
#        break
    end

    delay(100)
end

digitalWrite(10, 0)
digitalWrite(11, 0)