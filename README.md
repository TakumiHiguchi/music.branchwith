# music.branchwith

music.branchwithのフロントエンドです。頑張ってリファクタリングしていますが、コードは汚いと思います。
## リンク
[music.branchwith](https://mbw1.herokuapp.com/)

## 注意
- dockerが使える環境はご自身でご用意してください。

## 使い方
1. [mbw-nginx-proxy](https://github.com/TakumiHiguchi/mbw-nginx-proxy)のページを見て、mbw-nginx-proxyをdocker-compose up -dします
2. mbw-api をdocker-compose up -dします
3. music.branchwith をcloneしましょう
  ```
  $ git clone https://github.com/TakumiHiguchi/music.branchwith.git
  ```

4. ディレクトリに移動しましょう
  ```
  $ cd music.branchwith
  ```
  
5. dockerちゃんに全てお任せしましょう
  ```
  $ docker-compose build
  $ docker-compose run web yarn install --check-files
  $ docker-compose up
  ```

music.branchwith群の詳しい起動方法は、[mbw-nginx-proxy](https://github.com/TakumiHiguchi/mbw-nginx-proxy)のREADMEを見てください。
