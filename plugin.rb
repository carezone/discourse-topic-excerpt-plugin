# name: Discourse topic excerpt plugin
# about: A small plugin to force all topics to have excerpts
# version: 0.2
# authors: Angus McLeod, Johani

enabled_site_setting :topic_excerpt_length

after_initialize do
  add_to_class :post, :excerpt_for_topic do
      Post.excerpt(cooked, SiteSetting.topic_excerpt_length, strip_links: true)
  end
  add_to_serializer(:listable_topic, :include_excerpt?) { true }
end
