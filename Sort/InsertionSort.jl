# 挿入ソートInsertion Sort
# ポインタを使って配列そのものを並べ替える。
function ISort!(a::Ptr, n::Int)
  for ins in 2:n
    chk = ins
    while (chk >= 1) && (unsafe_load(a, chk-1) > unsafe_load(a, chk))
      temp = unsafe_load(a, chk)
      unsafe_store!(a,unsafe_load(a,chk-1),chk)
      unsafe_store!(a,temp,chk-1)
      chk -= 1
    end
    ins += 1
  end
end

a = "DGBEAFHC"
n = length(a)
println(a)

ISort!(pointer(a),n)

println(a)
