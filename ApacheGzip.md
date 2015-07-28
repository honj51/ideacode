# 配置 #
  1. 启用module
```
LoadModule deflate_module modules/mod_deflate.so
LoadModule headers_module modules/mod_headers.so
```
  1. 增加OutputFilter和Location
```
AddOutputFilter DEFLATE html xml php js css
<Location />
# core directive to cause the fixtext filter to
# be run on output
SetOutputFilter fixtext

        SetOutputFilter DEFLATE
        BrowserMatch ^Mozilla/4 gzip-only-text/html
        BrowserMatch ^Mozilla/4\.0[678] no-gzip
        BrowserMatch \bMSIE !no-gzip !gzip-only-text/html
        SetEnvIfNoCase Request_URI \.(?:gif|jpe?g|png)$ no-gzip dont-vary
        Header append Vary User-Agent env=!dont-vary
</Location>
```