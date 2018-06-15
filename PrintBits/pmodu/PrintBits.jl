module PrintBits

export Bitser

macro STRSIZE32()
    :(32)
end
macro STRSIZE8()
    :(8)
end

function Bitser(val::UInt32,size)
    sign::Int = 0
    i::Int = 1
    array = Array(Char,(@STRSIZE32) + 1)
    tester::UInt32 = 1
    tester <<= (size * 8) -1
    println("$val")
    while tester != 0
        if val & tester != 0
            array[i] = 'I'
            i = i + 1
        else
            array[i] = '0'
            i = i + 1
        end
        tester >>= 1
    end
#    array[i] = '\0'
    println(array)
    @show typeof(val)
end
function Bitser(val::UInt8,size)
    sign::Int = 0
    i::Int = 1
    array = Array(Char,(@STRSIZE8) + 1)
    tester::UInt32 = 1
    tester <<= (size * 8) -1
    println("$val")
    while tester != 0
        if val & tester != 0
            array[i] = 'I'
            i = i + 1
        else
            array[i] = '0'
            i = i + 1
        end
        tester >>= 1
    end
#    array[i] = '\0'
    println(array)
    @show typeof(val)
end

end
