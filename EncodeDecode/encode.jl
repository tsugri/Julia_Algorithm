#julia encode.jl、orgstrとkeyをxorしてefileを作りdecodeするための鍵が分かる。
#julia decode.jl 鍵、efileを読み込み鍵とxorで戻して正しいか確認。

const key = "t541tqudRte6"

function Encode(strorg::Ptr, strresult::Ptr, pkey::Ptr)
  for i in 1:12
    t = xor(unsafe_load(strorg, i), unsafe_load(pkey, i))
    unsafe_store!(strresult,t,i)
  end
end

orgstr = "正しいデータ"
result = "            "
pf = open("./efile", "w")
Encode(pointer(orgstr), pointer(result),pointer(key))
for i in 1:12
  unsafe_write(pf, pointer(result,i), 1)
end
close(pf)
println("鍵データ = ", key)

