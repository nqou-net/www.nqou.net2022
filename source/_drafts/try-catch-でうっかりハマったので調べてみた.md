---
title: 'try { ... } catch { ... }; でうっかりハマったので調べてみた'
tags:
  - undef
id: 3239
comment: false
categories:
  - 情報技術について
---

<p><a href="https://twitter.com/nqounet">@nqounet</a>です。</p>

<p><code>Try::Tiny</code>は便利なのですが、妙なところでハマってしまいます。</p>

<!--more-->

<h2>原因</h2>

<p><code>use Try::Tiny;</code>を書いてなかっただけなのです。</p>

<h2>どんな状況だったか</h2>

<p>とりあえず、失敗したらそのレコードのIDを返すようにしていました。</p>

<p>コードのイメージはこんな感じ。</p>

<pre class="lang:perl">
my $obj;
try {
  $obj = MyObj->new($row);
}
catch {
  return $row->id;
};
...
</pre>

<p>で、テストを書いて実行すると、何故かIDが返ってくるのでおかしいなと。</p>

<p>どんなエラーなのかと、<code>p $_;</code>をcatchに入れてみたのですが、undefになっていて、頭のなかが「？？」って感じに。</p>

<p>落ち着いてみると、<code>use Try::Tiny;</code>を書いてなかっただけでした。</p>

<p>つまり、try部分でエラーがなくてもcatchの中が実行されていた、ということなのです。</p>

<h2>use忘れを防ぎたい（未達）</h2>

<p><code>use Try::Tiny;</code>忘れを防ぎたいと思って、何か対策がないかと調べてみたのですが、どうもうまくいく気がしません。</p>

<p><code>B::Deparse</code>を使って、<code>use Try::Tiny;</code>せずにtryを使っているスクリプトを表示してみるとなんだかよくわからないことに。</p>

<p>（使い方はこちらを参考に→ <a href="http://blog.livedoor.jp/dankogai/archives/50761629.html">404 Blog Not Found:perl - B::Deparse</a>）</p>

<h3>元のスクリプト</h3>

<pre class="lang:perl">
use strict;
use warnings;
try {
    print "try\n";
}
catch {
    print "catch\n";
};
</pre>

<h3>上記の解析後のスクリプト</h3>

<pre class="lang:perl">
use warnings;
use strict;
try {
    print "try\n"
} (catch {
    print "catch\n"
} );
</pre>

<p><code>use Try::Tiny;</code>すると、以下の様な感じになります。</p>

<h3>Try::Tinyした元のスクリプト</h3>

<pre class="lang:perl">
use strict;
use warnings;
use Try::Tiny;
try {
    print "try\n";
}
catch {
    print "catch\n";
};
</pre>

<h3>上記の解析後のスクリプト</h3>

<pre class="lang:perl">
use Try::Tiny;
use warnings;
use strict;
try sub {
    print "try\n";
}
, catch(sub {
    print "catch\n";
}
);
</pre>
    	