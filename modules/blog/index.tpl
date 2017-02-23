{if isset($blog_entry)}
	<h1 class="media-heading">{$blog_entry.title}</h1>
	<p class="text-i text-fade-50">{lang key='posted_on'} {$blog_entry.date_added|date_format:$core.config.date_format} {lang key='by'} {$blog_entry.fullname}</p>

	{if $blog_entry.image}
		{ia_image file=$blog_entry.image title=$blog_entry.title|escape:'html' class='img-responsive m-b' type='large'}
	{/if}

	{$blog_entry.body}

	<div class="tags">
		<span class="fa fa-tags"></span>
		{if $blog_tags}
			{lang key='tags'}:
			{foreach $blog_tags as $tag}
				<a href="{$smarty.const.IA_URL}tag/{$tag.alias}">{$tag.title|escape:'html'}</a>{if !$tag@last}, {/if}
			{/foreach}
		{else}
			{lang key='no_tags'}
		{/if}
	</div>

	<hr>
	<!-- AddThis Button BEGIN -->
	<div class="addthis_toolbox addthis_default_style">
		<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
		<a class="addthis_button_tweet"></a>
		<a class="addthis_button_pinterest_pinit"></a>
		<a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
		<a class="addthis_counter addthis_pill_style"></a>
	</div>
	<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=xa-5170da8b1f667e6d"></script>
	<!-- AddThis Button END -->
{else}
	{if $blog_entries}
		<div class="ia-items blogroll">
			{foreach $blog_entries as $one_blog_entry}
				<div class="media ia-item">
					<div class="media-body">
						<h4 class="media-heading">
							<a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}" id="blog_{$one_blog_entry.id}">{$one_blog_entry.title}</a>
						</h4>
						{if $one_blog_entry.image}
							<a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}" class="ia-item-thumbnail">
								{ia_image file=$one_blog_entry.image title=$one_blog_entry.title type='large' class='img-responsive'}
							</a>
						{/if}
						<p class="ia-item-date">{$one_blog_entry.date_added|date_format:$core.config.date_format}</p>
						<div class="ia-item-body">{$one_blog_entry.body|strip_tags|truncate:$core.config.blog_max_block:'...'}</div>
					</div>
				</div>
			{/foreach}
		</div>

		{navigation aTotal=$pagination.total aTemplate=$pagination.template aItemsPerPage=$core.config.blog_number aNumPageItems=5}
	{else}
		<div class="alert alert-info">{lang key='no_blog_entries'}</div>
	{/if}
{/if}
