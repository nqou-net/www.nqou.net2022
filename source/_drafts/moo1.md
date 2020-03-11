---
title: 第1回-Mooで覚えるオブジェクト指向プログラミング
tags:
  - undef
---

<p><a href="https://twitter.com/nqounet">@nqounet</a>です。</p>

<p>Perl鍋やなにわPerlでもそこそこ評判が良かったので、Mooを使ったオブジェクト指向なプログラミングについて書いてみます。</p>

<p>なお、なるべくシンプルな記述にしたいので、厳密には正しくない事も書いています。</p>

<p>Mooについて深く知りたい方は、原典を見ることをオススメします。</p>

<ul>
<li><a href="https://perlnabe.connpass.com/">Perl鍋</a></li>
<li><a href="https://naniwaperl.doorkeeper.jp/">なにわPerl</a></li>
<li><a href="https://metacpan.org/pod/Moo">Moo</a></li>
</ul>

<!--more-->

<h2>blessについて</h2>

<p>これまでにPerlのオブジェクト指向について学んだ方は、blessすればOK、みたいに覚えている方が多いと思います。</p>

<p>しかし、改めてPerlでオブジェクト指向プログラミングを楽しむのであれば、blessについては忘れてしまいましょう。</p>

<p>今は、もっと良い方法があります。</p>

<h2>Mooを使ってみる</h2>

<p>まずは数行のプログラムを書いて動かしてみましょう。</p>

<p>Perlの実行環境が無い場合は、Perl入学式の資料を見ながら環境構築をしてみましょう。</p>

<p><a href="https://github.com/perl-entrance-org/workshop-2015-01/blob/master/slide.md">https://github.com/perl-entrance-org/workshop-2015-01/blob/master/slide.md</a></p>

<p>つまづいたらTwitterなどで「#Perl入学式」というハッシュタグを付けてつぶやいてみると、誰かが助けてくれるかもしれません。</p>

```perl
package MyApp {
    use utf8;
    use Moo;
    has hoge => (is => 'rw');

    sub show {
        my $self = shift;
        print $self->hoge;
    }
};

my $app = MyApp->new;
$app->hoge('ほげ');
$app->show;
```

<p>上記のコードを「hoge.pl」として保存してから、ターミナルで以下のように入力し、書いたプログラム（コード）を実行してみましょう。</p>

<p>コピペでも良いのですが、自分自身の手で書いてみるとより深く理解できると思います。</p>

<p>まずはコピペで動くのが確認できたら、改めて書いてみて、実行してみてください。</p>

```bash
cpanm Moo
perl hoge.pl
```

<p>「ほげ」という風に表示されましたか？</p>

<p>よくわからないかもしれませんが、これがオブジェクト指向の第一歩です。</p>

<h2>まずは用語を覚えましょう</h2>

<p>オブジェクト指向プログラミングでは、いくつかの専門的な用語を使います。</p>

<p>まず「オブジェクト」というのは、「属性」と「機能」を持った「まとまり」の事です。</p>

<p>そして、その「まとまり」は「クラス」で定義します。</p>

<p>「属性」は、「プロパティ（property）」や「メンバ（member）」「アトリビュート（attribute）」などと呼ばれています。
私は「プロパティ」と呼んでいるので、今後はプロパティと書いていきます。</p>

<p>「機能」は、「メソッド（method）」と呼ぶことが多いでしょう。</p>

<p>これらの用語は、何も考えずにそのまま覚えてしまうほうが良いです。日本語だと用語として覚えにくい場合は、カタカナで覚えてしまいましょう。使っていくうちに自然と理解できるようになります。</p>

<p>次回は先ほど書いたコードの説明もしてみたいと思います。</p>

<h2>まとめ</h2>

<ul>
<li>bless は忘れよう</li>
<li>コピペではなく書いて動かしてみよう</li>
<li>用語（オブジェクト、クラス、プロパティ、メソッド）を覚えよう</li>
</ul>
    	