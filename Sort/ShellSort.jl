# シェルソート（昇順）
# 半分のhopの長さにしてその幅だけ離れた要素を入れ替えて頭から尻までずらしていくのを繰り返す。

function ShellAscendingSort!(a::Ptr, n::Int)
  count = 0
  hop = n/2
  hop = floor(Int,hop)
  while hop > 0
    j = hop
    while j < n
      i = j - hop
      while unsafe_load(a,i+1) > unsafe_load(a,i+1+hop)
        temp = unsafe_load(a,i+1)
        unsafe_store!(a,unsafe_load(a,i+1+hop),i+1)
        unsafe_store!(a,temp,i+1+hop)
        count += 1
        if i < hop
          break
        else
          i -= hop
        end
      end
      j += 1
    end
    hop /= 2
    hop = floor(Int,hop)
  end
# 入れ替えのカウント
  @show count
end

# シェルソート（降順）
# どちらが大きいと入れ替えるかで昇順降順が決まるだけ。

function ShellDescendingSort!(a::Ptr, n::Int)
  count = 0
  hop = n/2
  hop = floor(Int,hop)
  while hop > 0
    j = hop
    while j < n
      i = j - hop
      while unsafe_load(a,i+1) < unsafe_load(a,i+1+hop)
        temp = unsafe_load(a,i+1)
        unsafe_store!(a,unsafe_load(a,i+1+hop),i+1)
        unsafe_store!(a,temp,i+1+hop)
        count += 1
        if i < hop
          break
        else
          i -= hop
        end
      end
      j += 1
    end
    hop /= 2
    hop = floor(Int,hop)
  end
# 入れ替えのカウント
  @show count
end


a = "OEMZJAFPYKHCNLVUSGXBIDQTRW"
n = length(a)
println(a)

ShellAscendingSort!(pointer(a),n)
println(a)

a = "OEMZJAFPYKHCNLVUSGXBIDQTRW"
n = length(a)
println(a)

ShellDescendingSort!(pointer(a),n)
println(a)
