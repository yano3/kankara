<?php

setcookie("app2_foo", "app2_value_foo", time()+60*60*24*30);
setcookie("app2_bar", "app2_value_bar");

setcookie("app1_hoge", "app2_value_hoge", time()+60*60*24*30);
setcookie("app1_fuga", "app2_value_fuga");

print "<h1>app2</h1>";
print '<div><a href="/">TOP</a></div>';

print "<h2>cookies</h2>";

print "<code>";
foreach ($_COOKIE as $key => $value) {
    print($key);
    print ' => ';
    print($value);
    print '<br>';
}
print "</code>";

