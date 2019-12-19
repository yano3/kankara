<?php

setcookie("app1_hoge", "app1_value_hoge", time()+60*60*24*30);
setcookie("app1_fuga", "app1_value_fuga");

print '<h1>app1</h1>';
print '<div><a href="/app">app</a></div>';

print "<h2>cookies</h2>";

print "<code>";
foreach ($_COOKIE as $key => $value) {
    print($key);
    print ' => ';
    print($value);
    print '<br>';
}
print "</code>";
