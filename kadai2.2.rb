

class Zyanken ()

  
  def zyanken_start ()
    @zyanken_te = ["","グー","チョキ","パー"] 

    puts "------------------"
    #puts "zyanken_startメソッド開始"
    player = 0
    cpu = 0
    puts "ジャンケンをはじめます　手を選んでください"
    puts "[1]グーを出す [2]チョキを出す [3]パーを出す [0]やめる"
    player = gets.chomp.to_i
    #
    case player
      when 0
        puts "やめます"
        exit
      when 1,2,3
        puts "あなたは#{@zyanken_te[player]}を出しました"
        cpu = rand(1..3)
        #cpu = 1 #デバッグ用
        puts "cpuは#{@zyanken_te[cpu]}を出しました"
        zyanken_kachimake(player,cpu)
      else
        puts "入力が無効です"
        exit
    end
    
  end
  
  def zyanken_kachimake (player,cpu)    
    puts "------------------"
    #puts "zyanken_kachimakeメソッド開始"
    #p "#{player}と#{cpu}"
    
    if player === cpu
      #puts "#{@zyanken_te[player]}と#{@zyanken_te[cpu]}"
      puts "あいこです"
      puts "もう１回ジャンケンをしてください"
      zyanken_start()
    elsif (player == 1 and cpu == 2) or (player == 2 and cpu == 3) or (player == 3 and cpu == 1)
      puts "あなたの勝ちです"
      acchimuite(0)
      #勝ちを0、負けを1で渡す
    else  
      puts "あなたの負けです"
      acchimuite(1)
      #勝ちを0、負けを1で渡す
    end
      
  end
  
end


  
def acchimuite(kachi_make)
  #勝ちを0、負けを1で受け取る
  winlose = ["勝ち","負け"]
  muki = ["","上","右","下","左"]
  
  puts "------------------"
  #puts "acchimuite()を開始"
  puts "あっち向いてホイをはじめます"
  puts "ジャンケンはあなたの#{winlose[kachi_make]}です"
  puts "方向を選んでください"
  puts "[1]#{muki[1]} [2]#{muki[2]} [3]#{muki[3]} [4]#{muki[4]}"
  player_muki = gets.chop.to_i
  
  case player_muki
  when 1,2,3,4
    puts "あなたは#{muki[player_muki]}を選びました"
    cpu_muki = rand(1..4)
    #cpu_muki = 1 #デバッグ用
    #puts "cpuの向き#{muki[cpu_muki]}" #デバッグ用
    puts "------------------"
      
    puts "あっち向いてホイ！"
    puts "あなたの向き#{muki[player_muki]} cpuの向き#{muki[cpu_muki]}"
    puts "------------------"
    
    if player_muki == cpu_muki #向きが一致
      if kachi_make == 0 #プレイヤーがジャンケン勝った時
        #puts "ジャンケンに勝った時の分岐"
        puts "あなたの勝ちです"
        exit
      else
        #puts "ジャンケンに負けた時の分岐"
        puts "あなたの負けです"
        exit
      end
    
    else  #向きが違う
      puts "引き分けです ジャンケンに戻ります"
      zyanken_start()
    end
    exit
    
  else
    puts "値が不正です"
    acchimuite(kachi_make)
  end
end 
  


zyanken = Zyanken.new()
zyanken.zyanken_start()
