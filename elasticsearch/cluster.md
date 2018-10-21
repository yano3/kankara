# Elasticsearch クラスタ概説

## Node and Cluster

- ノード
  - 起動した Elasticsearch のインスタンス
  - 普通は1台のサーバに1インスタンス起動するので、 Elasticsearch の起動しているサーバのイメージ
- クラスタ
  - 相互に接続したノードの集合

## Index and Shard

[緑の本](http://www.amazon.co.jp/dp/4048662023)に詳しく書いてある。

### インデックス

  - RDB でいうところのテーブル

### シャード

  - インデックスを分割したもの
  - プライマリシャードとレプリカシャードがある
  - プライマリシャードは更新操作を受ける
  - レプリカシャードはプライマリシャードのコピー
  - シャード単位でノード上に配置される

## Node

[ここ](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-node.html)に詳しく書いてある。ノードにはいくつかの種類がある。

### Master (eligible) node

- Master node はクラスタ全体の処理（シャードの配置等）を行うノード
- Master eligible node は master に候補になるノード
- Master node が死んだときには master eligible node から新たな master が選ばれる

### Data node

- シャードを保管するノード
- データにまつわる操作 (CRUD, search, etc...) を扱う

### Ingest node

- インデックス前にドキュメントを変換する機能 (Ingest) に使われるノード

### Coordinating only node

- Master eligible node でも Data node でも Ingest Node でもないノード
- 各種リクエストを受け、データを持った Data node へ転送する
- 全てのノードは暗黙的に Coordinating only node である

### (Tribe node)

- 略

小規模なクラスタなら Master eligible node 兼 Data node のノード * n台で構成できる。

## Index Settings

[ここ](https://www.elastic.co/guide/en/elasticsearch/guide/current/_index_settings.html)に詳しく書いてある。

### number\_of\_shards

- インデックスが持つプライマリシャードの数。
- インデックス作成時に設定。インデックス作成時以外変更不可。

### number\_of\_replicas

- プライマリシャードが持つレプリカシャードの数。
- いつでも変更できる。

### 設定のポイント

- スケールアウトしていく場合、 `number_of_shards * (1 + number_of_replicas)` 以上のノード (data node) にはシャードが配置されず無意味になるので、設定を決めるときに考慮する必要がある。
- レプリカシャードは自身のプライマリシャードや同じプライマリシャードを持つレプリカシャードと同一ノードには配置されない。

## Cluster Health

- [ここ](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-health.html)に詳しく書いてある。
- API `http://elasticsearch_host/_cluster/health`

### cluster health status

- `green`: すべてのシャードがクラスタ上に配置されている。
- `yellow`: プライマリシャードはクラスタ上に配置されているが、配置されていないレプリカシャードが存在している。
- `red`: （プライマリもレプリカも）クラスタ上に配置されていないシャードが存在している。
