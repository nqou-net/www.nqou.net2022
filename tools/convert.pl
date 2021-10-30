#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use Path::Tiny qw(path);
use YAML ();
use Time::Moment ();

my $root = path(__FILE__)->absolute->parent(2);

# 記事を取得
my $posts_dir = path($root, 'content', 'post');
my $iterator = $posts_dir->iterator(+{ recurse => 1 });

# タイムゾーンを取得
my $tm = Time::Moment->now;
my $offset = $tm->offset;
my $jp_offset = 540;

# 記事から時間を取得して、名称変更
while (my $post = $iterator->()) {
    next unless $post->is_file;
    my ($yaml, $after) = split /\n---/, $post->slurp_utf8, 2;
    my $info = YAML::Load($yaml);

    my $modified;
    unless (exists $info->{draft}) {
        my $tm       = Time::Moment->from_string($info->{iso8601});
        my $url_date = $tm->with_offset_same_instant($jp_offset);
        $info->{date} = $url_date->to_string;

        $info->{draft} = 'false';
        $modified = 1;
    }

    if ($modified) {

        # 結合して出力
        my $dump_yaml = YAML::Dump($info);
        my $body = join qq{\n---}, $dump_yaml, $after;
        $post->spew_utf8($body);
    }

    # 時間でファイル名を変更
    my $new_path = new_path_by_iso8601($info->{iso8601});
    $new_path->parent->mkpath;
    $post->move($new_path->stringify);
}

sub new_path_by_iso8601 {
    my $iso8601 = shift;
    my $tm = Time::Moment->from_string($iso8601)->with_offset_same_instant($jp_offset);
    my $path = $tm->strftime('%Y/%m/%d/%H%M%S');
    my $new_path = path($posts_dir, qq{$path.md})->absolute;
    return $new_path;
}
