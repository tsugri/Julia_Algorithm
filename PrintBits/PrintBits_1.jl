#push!(LOAD_PATH, "./pmodu")
include("./pmodu/PrintBits.jl")
#@show LOAD_PATH
using PrintBits

struct Operand
    operand1::UInt32
    operand2::UInt32
end

ope = Operand(55,1250)

print("operand1 = ")
Bitser(ope.operand1, sizeof(ope.operand1))

print("operand2 = ")
Bitser(ope.operand2, sizeof(ope.operand2))

print("ANDの効果 :  ")
Bitser(ope.operand1 & ope.operand2, sizeof(ope.operand1))

print("ORの効果 :  ")
Bitser(ope.operand1 | ope.operand2, sizeof(ope.operand1))

temp = (ope.operand1 $ ope.operand2)

print("XORの効果1 :  ")
Bitser(temp, sizeof(ope.operand1))
print("XORの効果2 :  ")
Bitser(temp $ ope.operand2, sizeof(ope.operand1))

print("operand1の補数効果 :  ")
Bitser(~ope.operand1,sizeof(ope.operand1))

#補数はエラーになる。
print("operand1の補数計算 :  ")
Bitser(-(1 + ope.operand1),sizeof(ope.operand1))
