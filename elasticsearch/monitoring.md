# Monitoring Elasticsearch

## APIs

- Elasticsearch の様子を知るのに便利な様々な API がある。
- これらを参照する Elasticsearch プラグインや各種モニタリングツール (mackerel, munin, etc.) のプラグインが開発されている。
- API 間で重複する内容があったり、似ているようで異なるものがあったりするので使い分けに注意。

### cluster health

- `http://localhost:9200/_cluster/health`
- [ドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-health.html)
- クラスタのヘルスチェック
- mackerel の [check plugin](https://github.com/mackerelio/go-check-plugins/tree/master/check-elasticsearch) が参照している

### nodes stats

- `http://localhost:9200/_nodes/stats`
- [ドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-nodes-stats.html)
- クラスタを構成するノードの統計情報
- mackerel の [Elasticsearch plugin](https://github.com/mackerelio/mackerel-agent-plugins/tree/master/mackerel-plugin-elasticsearch) が参照している
- 拙作の [mackerel-plugin-elasticsearch-nodes-stats](https://github.com/yano3/mackerel-plugin-elasticsearch-nodes-stats) もこの API を利用している
- エンドポイントとして指定したノード以外のクラスタを構成するノードの情報も参照できる
  - 参照したノード自身の情報が欲しい場合は、 URL を `http://localhost:9200/_nodes/_local/stats` のようにする

### cluster stats

- `http://localhost:9200/_cluster/stats`
- [ドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-stats.html)
- クラスタの統計情報（シャードの構成、ノード数など）

### indices stats

- `http://localhost:9200/_stats`
- [ドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-stats.html)
- インデックスの統計情報

## plugins

Elasticsearch クラスタの様子を知るのに便利なプラグインたち。

### head

- https://github.com/mobz/elasticsearch-head
- シャードの配置状態などを見るのに便利

### kopf

- https://github.com/lmenezes/elasticsearch-kopf
- head に似たプラグイン
- Elastic Cloud では Elasticsearch のバージョンによっては head が使えないので変わりに使うと便利

### Marvel

- https://www.elastic.co/products/marvel
- Elastic 社製のすごいやつ
- Elastic Cloud では Premium プランでのみ提供 (´・ω・｀)
