# 番号の末尾に一桁の検証値を付加する。 

macro Weight1()
    :(3)
end
macro Weight2()
    :(3)
end
macro Weight3()
    :(4)
end
macro Weight4()
    :(7)
end
macro Weight5()
    :(6)
end
macro Weight6()
    :(1)
end

function SetDigit(u::UInt32)
    temp::UInt32 = u * 10
    subt::UInt32 = 0
    accum::UInt32 = 0
    #一桁目
    u1::UInt32 = round(UInt32,(u / 10000),RoundDown)
    accum += u1 * @Weight1
    subt += u1 * 10000
    #二桁目
    u2::UInt32 = round(UInt32,((u - subt) / 1000),RoundDown)
    accum += u2 * @Weight2
    subt += u2 * 1000
    #三桁目
    u3::UInt32 = round(UInt32,((u - subt) / 100),RoundDown)
    accum += u3 * @Weight3
    subt += u3 * 100
    #四桁目
    u4::UInt32 = round(UInt32,((u - subt) / 10),RoundDown)
    accum += u4 * @Weight4
    subt += u4 * 10
    #五桁目
    u5::UInt32 = (u - subt)
    accum += u5 * @Weight5
    #チェックディジットを付加する
    temp += 10 - (accum % 10)
    
    return temp
end

function CheckDigit(u::UInt32)
    subt::UInt32 = 0
    accum::UInt32 = 0
    #一桁目
    u1::UInt32 = round(UInt32,(u / 100000),RoundDown)
    accum += u1 * @Weight1
    subt += u1 * 100000
    #二桁目
    u2::UInt32 = round(UInt32,((u - subt) / 10000),RoundDown)
    accum += u2 * @Weight2
    subt += u2 * 10000
    #三桁目
    u3::UInt32 = round(UInt32,((u - subt) / 1000),RoundDown)
    accum += u3 * @Weight3
    subt += u3 * 1000
    #四桁目
    u4::UInt32 = round(UInt32,((u - subt) / 100),RoundDown)
    accum += u4 * @Weight4
    subt += u4 * 100
    #五桁目
    u5::UInt32 = round(UInt32,((u - subt) / 10),RoundDown)
    accum += u5 * @Weight5
    subt+= u5 * 10
    #六桁目
    u6::UInt32 = (u - subt)
    accum += u6 * @Weight6

    @show (accum % 10)    

    if (accum % 10) == 0
        println("この番号は正しい。")
    else
        println("この番号は誤りです。")
    end
end

mutable struct Num
    enumber1::UInt32
    enumber2::UInt32
    enumber3::UInt32
    number::UInt32
    number_cd::UInt32
end

num = Num(579249,976554,436172,18962,0)
println("CheckDigit設定前の番号 $(num.number)")

num.number_cd = SetDigit(num.number)
println("CheckDigit設定後の番号 $(num.number_cd)")

CheckDigit(num.number_cd)
CheckDigit(num.enumber1)
CheckDigit(num.enumber2)
CheckDigit(num.enumber3)

