---
title: Perl でファイルを扱う時に open なんて使うな
tags:
  - undef
id: 3272
comment: false
categories:
  - 情報技術について
---

<p>おはようございます。
若林（<a href="https://twitter.com/nqounet">@nqounet</a>）です。</p>

<p>Perl でファイルを扱うときは open を使うのですが、正しく使うのは結構面倒なので、私はいつも Path::Tiny でファイル操作をしています。</p>

<p>標準モジュールではないので cpanm などを使用してインストールする必要があるのですが、今どき cpanm が使えない環境で Perl を使う事自体ありえないと思うので</p>

<!--more-->

<h2>openは3引数</h2>

<p><code>perl
my $filename = 'file.txt';
open my $fh, '<', $filename or die qq{can not open `$filename`};</code></p>

<p>とはいえ、モジュールが使えないような環境下でもファイル操作は必要でしょうから、たまにはopenを使って見ようと思います。</p>
    	