Feature: Hello World Test File

Scenario: Print Hello World
  * print 'helloworld! ハローワールド！'

  * def button1Pressed = false
  * def button2Pressed = false
  # これは自動でboolean(真偽値)扱いになってくれる模様
  * def condition = true
  #* def condition = "true"

  #ifの条件分岐

  # OK 問題なし
  # karatenoif文は恐らく以下の形式で1行で記述する
  #* eval if (condition) karate.abort()
  
  # OK 問題なしだが文字列は出力されない
  #* eval if (condition) print; 'ハローワールド2'

  # ダメ セミコロンないとだめらしい エラー内容:  Expected ; but found Success!
  #* eval if (condition) print 'Success!' else print 'Failure!'

  # ダメ Syntax Error
  # * eval if (condition) { 
  #   print 'Error: target is null'
  # }


  # ダメ Syntax Error
  #* eval if (condition) { print 'Error: target is null' }


  #eval if の後ろにprint繋げられない
  #* eval if (condition) print 'Condition is true'


  # 以下のif文はダメ
  # * if (condition) {
  #     # 条件が真の場合の処理
  #     * print 'Condition is true'
  #     # * button1Pressed = true # ボタン1押下を模擬
  #     #* print 'Button 1 pressed'
  #     ## * call read('someOtherFeature.feature') # 別のfeatureファイルの呼び出し
  #     #* wait 1s # 待ち時間
  #     #* assert button1Pressed == true
  #   } else {
  #     # 条件が偽の場合の処理
  #     * print 'Condition is false'
  #     # * button2Pressed = true # ボタン2押下を模擬
  #     # * print 'Button 2 pressed'
  #     # * wait 2s # 待ち時間
  #     # * assert button2Pressed == true
  # * }

    * print 'Scenario finished'
    * karate.log('warn', 'This is a warning message')


  
    # 動作OK
    # * eval (改行) """ """ → 指定した範囲でjsの処理を記述できる
    # 内部で karateの処理は記述することができない
    * eval 
    """
    
    if (condition == true) {
      // karateの処理は無効
      // wait 5000
      console.log("conditionの値は: true");  

    } else {
      // wait 5000
      console.log("conditionの値は: false");
    }

    """

    # 関数の作成
    # こちらも同様にkarateの処理やメソッドは内部で記述することはできない
    # Seleniumのメソッドはjsによる処理なので、if文の内部で呼べる
    * def testMethod =
    """
    function() {

      if (condition == true) {
        
        console.log("conditionの値は: true");  
  
      } else {
        
        console.log("conditionの値は: false");
  
      }
    }
    """

    # # karateによるメソッドの呼び出し
    # * eval testMethod()


  # karateで複数行のif文が記述できなさそう。
  # 特定条件において複数の処理を行う場合はjsのメソッドを定義して、
  # * eval if (condition) testMethod() などで呼び出さしするのが良さそう
  * eval if (condition) testMethod()


    



