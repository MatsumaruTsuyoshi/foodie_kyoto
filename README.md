# 京都限定で厳選した飲食店を紹介するアプリ。

## このアプリが必要な理由。

京都は飲食店が多い。本当に美味しくて満足できる飲食店を調べるのはけっこう大変。 人生の食事の回数は限られている。できるだけ満足する食事にしたい。
なので、とにかくこのアプリに登録されている飲食店に行けば間違いなしという状態を目指す。

また観光地が離れているケースもあり、（例えば金閣寺と清水寺とか）それぞれの場所で飲食店を探すのも大変。
GoogleMap等で立地、雰囲気、料金、レビュー、を鑑みてお店を決めるのがめんどくさいって人に使ってもらいたい。

なによりも運営者が京都市東山区に住んでおり、美味しいお店を開拓していき共有するためのアプリ。

## 掲載される飲食店の基準

運営者の独断と偏見です。 美味しい、雰囲気、見栄え、料金などを総合して判断します。 京都らしさがあることも重要と考えています。

## アプリ仕様

盛り込みたい機能を箇条書きにしておく。

- GoogleMapでエリアから飲食店を検索できる。検索時のカテゴリ分けは[TERIYAKI](https://teriyaki.me)を参考にする。
- 運営者が飲食店に行った時の写真とコメントとGoogleMapAPIから取得した情報を組み合わせて表示
- （want）現在地から飲食店カードのここに行くボタンを押すと経路、時間を表示する
- 日本語、英語、中国語、韓国語に対応する。
- ダークモード対応

シンプルなアプリなのでデザイン、動作ともにリッチにしたい。 またオープンソースで開発を進める。

## 運営について

### 運営者

[MatsumaruTsuyoshi](https://github.com/MatsumaruTsuyoshi)

[nasubibocchi](https://github.com/nasubibocchi)


### 運営期間

2022年3月14日スタート。 運営者が飽きるまで続ける。

### 運営費用

運営者のポケットマネー 

インバウンドが復活したときに何かしらマネタイズできないか考え中


## 開発環境

### 環境構築
fvm install

### 状態管理
riverpod + freezed

### 画面遷移
go_router

### CI/CD
GithubActions/Codemagic

