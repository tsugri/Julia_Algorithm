#julia ClacSum.jl filename
#julia CheckSum.jl filenme

function ClacSum()
    Sum::Int32 = 0
    fp = open(ARGS[1],"r")
    while !eof(fp)
        Sum += read(fp,UInt8)
    end
    close(fp)
    Sum_2 = Sum
    Sum_2 = Sum_2>>16
    Sum_2 = Sum_2<<16
#   Sum_3 = convert(Int16,Sum - Sum_2)
    return Sum - Sum_2
end

fp_2 = open("./sumfile", "w")
write(fp_2, ClacSum())
close(fp_2)
