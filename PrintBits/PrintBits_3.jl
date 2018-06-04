include("./pmodu/PrintBits.jl")

using PrintBits

mutable struct Operand
    operand1::UInt8
    operand2::UInt8
end

ope = Operand(0x7a,0x7a)

println("unsigned char型のインクリメント\n")
ope.operand2 = 0x7a
for i in 0:9
    ope.operand2 = ope.operand2 + 1
    Bitser(ope.operand2, sizeof(ope.operand2))
end

println("char型のインクリメント\n")
ope.operand1 = 0x7a
for i in 0:9
    ope.operand1 = ope.operand1 + 1
    Bitser(ope.operand1, sizeof(ope.operand1))
end

