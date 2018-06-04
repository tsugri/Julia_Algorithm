# julia gparity.jl ファイル、ファイルにパリティ付加されたtempが作成される。
# julia cparity.jl ファイル名、tempからパリティを確認して元のファイルを指定したファイル名で作成される。

macro Nonparity()
  :(0x7f)
end
macro Bit8()
  :(0x80)
end
macro Eight()
  :(8)
end

function ParityCheckData()
  vc1 = vc2 = vc3 = vc4 = vc5 = vc6 = vc7 = vc8 = 0

  fp = open("./temp", "r")
  fp1 = open(ARGS[1], "w")

  val = read(fp, UInt8)
  tester = @Bit8
  colmn = @Eight
  hcount = 0
  i = 0
#  while eof(fp) == false
  while val != 0x00
    i += 1
    while tester == 1 
      if (val & tester) == 1
        hcount += 1
        if colmn == 8
          vc8 += 1
        elseif colmn == 7
          vc7 += 1
        elseif colmn == 6
          vc6 += 1
        elseif colmn == 5
          vc5 += 1
        elseif colmn == 4
          vc4 += 1
        elseif colmn == 3
          vc3 += 1
        elseif colmn == 2
          vc2 += 1
        elseif colmn == 1
          vc1 += 1
        end
      end
      colmn -= 1
      tester >>= 1
    end
# 偶数かどうかを見る。
    if (hcount % 2) == 0
      valpassed = (val & @Nonparity)
    else
      close(fp)
      close(fp1)
      return 1
    end
    try
    val = read(fp, UInt8)
  catch
    break
  end
  
    write(fp1, valpassed)

    tester = @Bit8
    colmn = @Eight
    hcount = 0
  end
  if (vc1 % 2) == 1
    close(fp)
    close(fp1)
    return 1
  end
# 垂直パリティを検証する。
  if (vc2 % 2) == 1
    close(fp)
    close(fp1)
    return 1
  end
  if (vc3 % 2) == 1
    close(fp)
    close(fp1)
    return 1
  end
  if (vc4 % 2) == 1
    close(fp)
    close(fp1)
    return 1
  end
  if (vc5 % 2) == 1
    close(fp)
    close(fp1)
    return 1
  end
  if (vc6 % 2) == 1
    close(fp)
    close(fp1)
    return 1
  end
  if (vc7 % 2) == 1
    close(fp)
    close(fp1)
    return 1
  end
  if (vc8 % 2) == 1
    close(fp)
    close(fp1)
    return 1
  end
# ファイルの末尾を書き込む。
  pos = position(fp1)
  seek(fp1, pos-1)
#  write(fp1, 0x00)
  write(fp1, 0x1a)
  close(fp)
  close(fp1)
  return 0
end

if ParityCheckData() == 1
  println("パリティチェックエラーがありました。")
else
  println("パリティチェックに異常はありませんでした。")
end


