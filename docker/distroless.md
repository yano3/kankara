# Distroless

- https://github.com/GoogleContainerTools/distroless

## static vs. base

- `static-debian10` や `base-debian10` のように prefix が `base` のイメージと `static` のイメージがある。
- 両者の違いは [ここ](https://github.com/GoogleContainerTools/distroless/blob/main/base/README.md) に記載されている通りで、 `base` イメージには `glibc`, `libssl`, `openssl` が含まれている。これらのライブラリに動的リンクしているアプリケーションの実行には `base` を使う。 Go で静的ビルドしたシングルバイナリのようなアプリケーションは `static` でも動く。

## tags

### debug tag

- distroless イメージにはシェルも入っていないが、デバッグ用に `debug` タグで busybox シェルが入ったイメージを入手できる。

### nonroot tag

- 標準で `nonroot` ユーザで実行されるイメージ。
- デバッグ用は `debug-nonroot` タグ。

## non-root users

すべてのイメージに `nobody` (uid: `65534`) と `nonroot` (uid: `65532`) ユーザが定義されている。グループも同様。よって、 `nonroot` タグのイメージを使わなくても `Dockerfile` で `USER nobody:nobody` のように実行ユーザを指定することもできる。

```
/ $ cat /etc/passwd
root:x:0:0:root:/root:/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/sbin/nologin
nonroot:x:65532:65532:nonroot:/home/nonroot:/sbin/nologin

/ $ cat /etc/group
root:x:0:
nobody:x:65534:
tty:x:5:
staff:x:50:
nonroot:x:65532:
```

### nobody vs. nonroot

- `nobody` ユーザに関する議論の [issue](https://github.com/GoogleContainerTools/distroless/issues/332) と導入された [PR](https://github.com/GoogleContainerTools/distroless/pull/368)
- `nonroot`ユーザに関する議論の [issue](https://github.com/GoogleContainerTools/distroless/issues/235) と導入された [PR](https://github.com/GoogleContainerTools/distroless/pull/335)
- どちらも non-root なユーザでアプリケーションを実行したい場合に使用できる。
- `nonroot` ユーザにはホームディレクトリ `/home/nonroot` が存在する。 `/etc/passwd` で `nonbody` ユーザには `/nonexistent` が記載されているが存在しない。
- ホームディレクトリに設定ファイルを設置するなど、ホームディレクトリが必要なアプリケーションは `nonroot` ユーザを使うと良い。
- tags に記載したように `nonroot` タグのイメージでは `nonroot` ユーザで実行される。
