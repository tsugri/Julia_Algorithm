#julia ClacSum.jl filename、sumfileが作成される。
#julia CheckSum.jl filename、読み込んだファイルのCheckSumの結果とsumfileと比較

function CheckSum(s)
    temp::Int32=0
    @show s
    fp = open(ARGS[1], "r")
    while !eof(fp)
        temp += read(fp,UInt8)
    end
    close(fp)
    temp_2 = temp
    temp_2 = temp_2>>16
    temp_2 = temp_2<<16
#    temp_3::Int16 = convert(Int16,temp - temp_2)
    if s == (temp - temp_2)
        println("CheckSum OK!\n")
    else
        println("問題発生！")
        println(s)
        println(temp)
    end
end

pf = open("./sumfile", "r")
CheckSum(read(pf, Int32))
close(pf)
