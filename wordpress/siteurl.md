# WordPress Address and Site Address

設定画面の「WordPress アドレス」「サイトアドレス」と `wp-config.php` に書く定数名、 DB の `wp_options` テーブルの `option_name` の関係。


| 日本語 UI       | WordPress アドレス | サイトアドレス |
|-----------------|--------------------|----------------|
| English UI      | WordPress Address  | Site Address   |
| `wp-config.php` | `WP_SITEURL`       | `WP_HOME` |
| `option_name`   | `siteurl`          | `home`    |

**site** と付く項目が UI vs. DB, PHP 定数でアベコベな点に注意。

