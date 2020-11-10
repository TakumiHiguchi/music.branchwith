module ApplicationHelper
  def default_meta_tags
    {
      site: 'music.branchwith',
      title: '国内最大級の歌詞考察サイト',
      reverse: true,
      charset: 'utf-8',
      description: '日本国内最大級の音楽サイト！27万曲以上の歌詞全文や、歌詞解釈、音楽ニュースまで、幅広いコンテンツを扱っています。音楽のことならmusic.branchwithで全て解決！',
      keywords: '歌詞考察,歌詞解釈,歌詞',
      canonical: request.original_url,
      separator: '|',
      icon: image_url('favicon.png'),
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('favicon.png'),
        local: 'ja-JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@music_bWith',
        image: image_url('favicon.png'),
        width: 100,
        height: 100
      }
    }
  end
end
