<?php

setcookie("hoge", "value_hoge", time()+60*60*24*30);
setcookie("fuga", "value_fuga");

print '<h1>app</h1>';

print "<h2>cookies</h2>";

print "<code>";
foreach ($_COOKIE as $key => $value) {
    print($key);
    print ' => ';
    print($value);
    print '<br>';
}
print "</code>";
