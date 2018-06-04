function Decode(pkey::Ptr, result::Ptr)
  orgstr = "正しいデータ"
  decode = "            "
  pd = pointer(decode)

  for i in 1:12
    t = xor(unsafe_load(pkey, i), unsafe_load(result, i))
    unsafe_store!(pd, t, i)
  end
  return contains(orgstr, decode)
end

consbuff = ARGS[1]
filebuff = read("./efile")

if Decode(pointer(consbuff), pointer(filebuff)) == true
  println("このプログラムは実行できます。")
else
  println("無効な鍵データが入力されました。")
end
