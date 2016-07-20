aya5.js
=======================================

AYA5 on JavaScript

Original SHIORI module
---------------------------------------

[AYA5](http://umeici.onjn.jp/) by umeici

**Caution**:
This module is maintained by [Narazaka](http://narazaka.net/) and not officially supported by umeici.
Do not report bugs or something that is caused by aya5.js to umeici.

Installation
---------------------------------------

    npm install aya5.js

or

    bower install aya5.js

or download zip archive and get aya5.js

Usage
---------------------------------------

This module has only low level API, that is provided by emscripten.

So use the wrapper module, [nativeshiori](https://github.com/Narazaka/nativeshiori), and do like below.

    <script src="encoding.min.js"></script>
    <script src="nativeshiori.js"></script>
    <script src="aya5.js"></script>
    <script>
    
    var aya5_txt_str = 'dic, test.dic\r\n';
    var aya5_txt = Encoding.convert(Encoding.stringToCode(aya5_txt_str), 'SJIS', 'UNICODE');
    var test_dic_str = 'request{"Hello World"}\r\n';
    var test_dic = Encoding.convert(Encoding.stringToCode(test_dic_str), 'SJIS', 'UNICODE');
    var storage = {
      'aya5.txt': new Uint8Array(aya5_txt), // filename: ArrayBufferView
      'test.dic': new Uint8Array(test_dic)
    };
    
    // Shiori instance and optional storage (/path/to/ghost/master/*)
    var nativeshiori = new NativeShiori(new AYA5(), storage);
    
    // write files in storage to FS then load() if storage exists, else load()
    var load_code = nativeshiori.load('/path/to/ghost/master'); 
    
    // request()
    var response = nativeshiori.request('GET SHIORI/3.0\r\nCharset: Shift_JIS\r\ID: OnBoot\r\n\r\n');
    
    // unload()
    var unload_code = nativeshiori.unload();
    
    </script>

LICENSE
--------------------------------

(C) 2016 Narazaka : Licensed under [The BSD 3-Clause License](http://narazaka.net/license/BSD3?2016)
