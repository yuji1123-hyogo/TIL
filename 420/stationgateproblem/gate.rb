class Gate
    stations = ["umeda","jyusou","mikuni"]

    def initalize(station_name)
        @station_name = station_name
    end

    def enter(ticket)
        # チケットオブジェクトに入場した駅を記入
        ticket.enter_at = station_name


    end

    def exit(ticket)
        #出場可能性の判断
        #①切符の値段から何駅分の切符かを計算
        #②入場駅～入場駅+乗車可能駅数　までの間に当駅が含まれていた場合はtrue/含まれていないい場合はfalse
        stations[]
    end

end