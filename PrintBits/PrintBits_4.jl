include("./pmodu/PrintBits.jl")

using PrintBits

mutable struct Operand
    operand1::UInt8
end

ope = Operand(0x7b)

Bitser(ope.operand1,sizeof(ope.operand1))

ope.operand1 >>= 1
println("operand1 >>= 1の結果\n")
Bitser(ope.operand1,sizeof(ope.operand1))

ope.operand1 <<= 1
println("operand1 <<= 1の結果\n")
Bitser(ope.operand1,sizeof(ope.operand1))

ope.operand1 <<= 1
println("operand1 <<= 1の結果\n")
Bitser(ope.operand1,sizeof(ope.operand1))

ope.operand1 >>= 1
println("operand1 >>= 1の結果\n")
Bitser(ope.operand1,sizeof(ope.operand1))
