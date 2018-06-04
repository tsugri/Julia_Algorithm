include("./pmodu/PrintBits.jl")

using PrintBits

struct Operand
    operand1::UInt32
    operand2::UInt32
end

ope = Operand(16,2)

Bitser(ope.operand1, sizeof(ope.operand1))
Bitser(ope.operand2, sizeof(ope.operand1))

Bitser(ope.operand1 >> ope.operand2, sizeof(ope.operand1))
Bitser(ope.operand1 << ope.operand2, sizeof(ope.operand1))

