#gparity ファイル、読み込んだファイルにパリティをつけてtempで書き出す。
#cparty ファイル名、tempを読み込んで書き出すファイル名でファイルに戻す。

macro Bit1()
  :(0x01)
end
macro Bit2()
  :(0x02)
end
macro Bit3()
  :(0x04)
end
macro Bit4()
  :(0x08)
end
macro Bit5()
  :(0x10)
end
macro Bit6()
  :(0x20)
end
macro Bit7()
  :(0x40)
end
macro Bit8()
  :(0x80)
end
macro Seven()
  :(7)
end

function SetEvenParity()
  vc1 = vc2 = vc3 = vc4 = vc5 = vc6 = vc7 = vc8 = 0
  fp = open(ARGS[1], "r")
  fp1 = open("./temp", "w")

  val = read(fp, UInt8)
  if eof(fp) == true
    return 0
# 読んだ1文字目の頭が1ならそれは文字に8ビット使われている。
  elseif (val & @Bit8) != 0
    return 1
  end
  tester = @Bit7
  colmn = @Seven
  hcount = 0
  i = 0
# 8以外の7ビット分調べる。
#  while eof(fp) == false
  while val != 0x00
    i += 1
# 1文字1文字のビット1を合計していく。
    while tester > 0
      if (val & tester) > 0
        hcount += 1
        if colmn == 7
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
# テストするためのビットを右にシフト。
      tester >>= 1
    end

# 奇数の場合
    if (hcount % 2) == 1
# 水平パリティを設定
      val |= @Bit8
      vc8 += 1
    end
    write(fp1, val)
    try
    val = read(fp, UInt8)
  catch
    break
  end
    if (val & @Bit8) > 0
      return 1
    end
#    if eof(fp) == true
#    if val == 0x00
#      break
#    elseif (val & @Bit8) > 0
#      return 1
#    end
    tester = @Bit7
    colmn = @Seven
    hcount = 0
  end
#全文字終わってvcで足していったものが奇数ならビットを1にしていく。
  val = 0
# 垂直パリティを設定
  if (vc1 % 2) == 1
    val |= @Bit1
  end
  if (vc2 % 2) == 1
    val |= @Bit2
  end
  if (vc3 % 2) == 1
    val |= @Bit3
  end
  if (vc4 % 2) == 1
    val |= @Bit4
  end
  if (vc5 % 2) == 1
    val |= @Bit5
  end
  if (vc6 % 2) == 1
    val |= @Bit6
  end
  if (vc7 % 2) == 1
    val |= @Bit7
  end
  if (vc8 % 2) == 1
    val |= @Bit8
  end
# 垂直パリティを追加
  write(fp1, val)i
  close(fp)
  close(fp1)
  return 0
end

if SetEvenParity() == 1
  println("8ビットデータが含まれています。")
end
