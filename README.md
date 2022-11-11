## アプリケーション名
#### 「shogistudy」
## アプリケーション概要
#### 将棋に関する様々な議題を投稿できる掲示板です。
## 使用技術
#### Ruby on rails, ruby, HTML, CSS, JavaScript
## デモ画像
#### Top page
<img src="https://user-images.githubusercontent.com/93134765/196187603-ef568111-1702-4667-9fe7-ec5ff859076f.jpg" width="800px">

#### 新規議題作成
<img src="https://user-images.githubusercontent.com/93134765/197352016-c354d30a-5039-480c-a751-35d0c08814dc.jpg" width="800px">

#### コメント機能
<img src="https://user-images.githubusercontent.com/93134765/197352137-c3770041-300d-41aa-b73b-8d7c5bb1ddb5.jpg" width="800px">

## なぜ作ったのか
#### 将棋には対戦するだけではなく、新しい戦型や実際の局面を検討・研究する楽しみもありますので、
#### 短に将棋の話ができる相手がいなくても、オンラインで気軽に相談出来るような環境を作りたいという思いで作成しました。
## 機能一覧
+ #### ユーザー登録、ログイン機能(devise)
  + #### ゲストログイン機能
+ #### 投稿機能
  + #### 複数投稿
  + #### 画像投稿(carrierwave)
+ #### コメント機能
+ #### 検索機能(ransack)
+ #### ページネーション機能(kaminari)
## テスト
+ #### Rspec
  + #### 統合テスト(system、request)
## こだわりポイント
#### 将棋ということで和風なデザインを意識しました。  
#### 議題を投稿する際に、画像が一枚しか保存できないと意図がわかりづらいことが懸念されたので、  
#### 画像を複数枚保存可能+プレビュー機能で画像の並び順などが適切か把握できるようにしました。
https://user-images.githubusercontent.com/93134765/197350374-c0f7de18-7bc7-4fcf-9684-6af78f5ea5df.mp4
## ER図
![erd](https://user-images.githubusercontent.com/93134765/194715475-0c3ff38a-1870-4a3c-9e76-58ceeffa258b.png)
