# karateの実行方法に関して

# 環境構築手順
## ①.JDKを用意

## ②.mavenを用意
```
brew install maven
```
パス通すの忘れない
bashprofileに書き込み(version部分は毎回確認)
```
export PATH="/usr/local/Cellar/maven/3.9.9/bin:$PATH"
```

パス設定の反映
```
source ~./bash_profile
```

動作確認
```
mvn -v
```

## ③.katrateのプロジェクト作成する
空のプロジェクトフォルダをmkdir。
cdで移動して、以下コマンドを実行して雛形を作成。
「-DarchetypeVersion=X.X.X 」がkarateのversion指定部分。
とりあえず「1.4.0」で動いた

```
mvn archetype:generate \
  -DarchetypeGroupId=com.intuit.karate \
  -DarchetypeArtifactId=karate-archetype \
  -DarchetypeVersion=1.4.0 \
  -DgroupId=com.example \
  -DartifactId=my-project
```

## ④.サンプルのテストを実行する
test側srcの、userフォルダ配下に初期ファイルが作成されている。
my-projectというディレクトリが余計に多分作成されているので、pom.xmlと同じディレクトリに移動するの忘れないようにする。
以下のコマンドで動作確認可能。
```
mvn test
```

## ②.自作のkarateファイル(featureファイル)のテストを実行する
テスト実行コマンドが異なるので注意。

### karateファイル(feature)の場合
```
mvn clean test -Dkarate.options="classpath:examples/test.feature"
mvn clean test -Dkarate.options="classpath:examples/users/test.feature" など
```

本来
```
mvn test -Dtest=examples.test
mvn test -Dtest=examples.users.test など
```

