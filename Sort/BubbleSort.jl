# バブルソート（昇順）

function BubbleAscendingSort!(a::Ptr, n::Int)
  count1 = count2 = 0
# 頭から尻まで比べて交換、尻が一番大きくなるので尻だけ除いて繰り返す。
  while n > 0
    bldone = 0
    i = 1
    count1 += 1

    while i < n
      if unsafe_load(a,i) > unsafe_load(a,i+1)
        count2 += 1
        temp = unsafe_load(a,i)
        unsafe_store!(a,unsafe_load(a,i+1),i)
        unsafe_store!(a,temp,i+1)
        bldone = 1
      end
      i += 1
    end
    if bldone <= 0
      break
    end
# 尻だけ除く
    n -= 1
  end
# 外側のループカウント
  @show count1
# 内側のループカウント（if）
  @show count2
end

# バブルソート（降順）

function BubbleDescendingSort!(a::Ptr, n::Int)
# 尻から頭まで比べて交換、頭が一番小さくなるので頭だけ除いて繰り返す。
  count1 = count2 = 0
  start = 0
  while start < n
    bldone = 0
    i = n-1
    count1 += 1
    while i > start
      if unsafe_load(a,i) < unsafe_load(a,i+1)
        count2 += 1
        temp = unsafe_load(a,i)
        unsafe_store!(a,unsafe_load(a,i+1),i)
        unsafe_store!(a,temp,i+1)
        bldone = 1
      end
      i -= 1
    end
    if bldone <= 0
      break
    end
# 頭だけ除く
    start += 1
  end
# 外側のループカウント
  @show count1
# 内側のループカウント（if）
  @show count2
end


a = "CIJGBHDAEF"
n = length(a)
println(a)

BubbleAscendingSort!(pointer(a),n)
println(a)

a = "CIJGBHDAEF"
n = length(a)
println(a)

BubbleDescendingSort!(pointer(a),n)
println(a)
