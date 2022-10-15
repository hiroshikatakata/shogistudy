## アプリケーション名
#### 「shogistudy」
## アプリケーション概要
#### 将棋に関する様々な議題を投稿できる掲示板です。
## 使用技術
#### Ruby on rails, ruby, HTML, CSS, JavaScript
## デモ画像
<img width="1221" alt="スクリーンショット 2022-10-15 15 19 38" src="https://user-images.githubusercontent.com/93134765/195972434-3e3efbab-1072-46a8-8f39-227f14aa79aa.png">
## ER図
![erd](https://user-images.githubusercontent.com/93134765/194715475-0c3ff38a-1870-4a3c-9e76-58ceeffa258b.png)
## 機能一覧
+ #### ユーザー登録、ログイン機能(devise)
+ #### 投稿機能
  + #### 画像投稿(carrierwave)
## テスト
+ #### Rspec
  + #### 統合テスト(system、request)
## こだわりポイント
#### 将棋ということで和風なデザインを意識しました。  
#### 議題を投稿する際に、画像が一枚しか保存できないと意図がわかりづらいことが懸念されたので、  
#### 画像を複数枚保存可能+プレビュー機能で画像の並び順などが適切か把握できるようにしました。
