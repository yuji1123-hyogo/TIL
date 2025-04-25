class Gate
    # 特に変更しない値　＝　定数
    STATION = [:umeda,:juso,:mikuni]
    FARES = [160,190]


    # クラスのインスタンス化
    def initialize(name)
        @name = name
    end


    def calc_fares(ticket)
        from = STATION.index(ticket.stamped_at)
        to = STATION.index(@name)
        FARES[to - from -1]
    end


    #チケットオブジェクトの乗車駅データに記録する
    def enter(ticket)
        ticket.stamp(@name)
    end


    def exit (ticket)
        fare = calc_fares(ticket)
        fare <= ticket.fare
    end
end


