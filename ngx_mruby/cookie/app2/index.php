<?php

setcookie("app2_foo", "app2_value_foo");
setcookie("app2_bar", "app2_value_bar");

setcookie("app1_hoge", "app2_value_hoge");
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

