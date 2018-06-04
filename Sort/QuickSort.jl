# クイックソート（昇順）
# 頭から尻にpivotと比べて小さいのに当たるまで、尻から頭にpivotと比べて大きいのに当たるまで、比較。
# 結果大小関係から要素を取り替える。比較してきて真ん中でぶつかったらそこを中心に左右に分けて繰り返す。

function QuickAscendingSort!(a::Ptr,first::Int,last::Int)
  forwd = first
  backwd = last
#  pivot = unsafe_load(a, floor(Int,(first+last)/2))
  pivot = unsafe_load(a, last)
# 頭から尻へ進めたのと、尻から頭に進めたのがぶつかれば
  if first >= last
    return
  end

  while true
    while unsafe_load(a, forwd) < pivot
      forwd += 1
    end
    while pivot < unsafe_load(a, backwd)
      backwd -= 1
    end
    if forwd >= backwd
      break
    end
# pivotに対して大小がわかったので要素を交換する。
    temp = unsafe_load(a, forwd)
    unsafe_store!(a, unsafe_load(a, backwd), forwd)
    unsafe_store!(a, temp, backwd)
# １つ進めて繰り返す。
    forwd += 1
    backwd -= 1
  end
  QuickAscendingSort!(a, first, forwd-1)
  QuickAscendingSort!(a, backwd+1, last)
end

function QuickDescendingSort!(a::Ptr,first::Int,last::Int)
  forwd = first
  backwd = last
#  pivot = unsafe_load(a, floor(Int,(first+last)/2))
  pivot = unsafe_load(a, last)
  if first >= last
    return
  end
  while true
    while unsafe_load(a, forwd) > pivot
      forwd += 1
    end
    while pivot > unsafe_load(a, backwd)
      backwd -= 1
    end
    if forwd >= backwd
      break
    end
    temp = unsafe_load(a, forwd)
    unsafe_store!(a, unsafe_load(a, backwd), forwd)
    unsafe_store!(a, temp, backwd)
    forwd += 1
    backwd -= 1
  end
  QuickDescendingSort!(a, first, forwd-1)
  QuickDescendingSort!(a, backwd+1, last)
end

a = "OEMZJAFPYKHCNLVUSGXBIDQTRW"
n = length(a)

println(a)
QuickAscendingSort!(pointer(a),1,n)
println(a)

a = "OEMZJAFPYKHCNLVUSGXBIDQTRW"
n = length(a)

println(a)
QuickDescendingSort!(pointer(a),1,n)
println(a)
