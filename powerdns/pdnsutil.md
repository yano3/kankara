# pdnsutil

- [doc](https://doc.powerdns.com/authoritative/manpages/pdnsutil.1.html)

## replace-rrset

ドキュメントに `replace-rrset ZONE NAME TYPE [TTL] CONTENT [CONTENT..]` と記載されているように `pdnsutil replace-rrset` は最後の引数を複数取ることができる。

これを使うと、 DNS ラウンドロビンで複数のAレコードがあるような場合に一括して置き換えることができる。既存のレコード数と `replace-rrset` の引数の数は一致している必要はなく、引数に渡した数の分だけAレコードができる。

### 例

```
$ pdnsutil list-zone example.com | grep hoge.example.com
hoge.example.com        300     IN      A       192.168.10.10
hoge.example.com        300     IN      A       192.168.10.11
$ pdnsutil replace-rrset example.com hoge A 300 192.168.10.20 192.168.10.21
Current records for hoge.example.com IN A will be replaced
New rrset:
hoge.example.com. 300 IN A 192.168.10.20
hoge.example.com. 300 IN A 192.168.10.21
$ pdnsutil list-zone example.com | grep hoge.example.com
hoge.example.com        300     IN      A       192.168.10.20
hoge.example.com        300     IN      A       192.168.10.21
```
