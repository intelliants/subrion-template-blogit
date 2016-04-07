{if isset($block_blog_entries) && $block_blog_entries}
	
		<div class="ia-items blogroll">
			{foreach $block_blog_entries as $one_blog_entry}
				<div class="media ia-item">
					<div class="media-body">
						<h4 class="media-heading">
							<a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}" id="blog_{$one_blog_entry.id}">{$one_blog_entry.title}</a>
						</h4>
						{if $one_blog_entry.image}
							<a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}" class="ia-item-thumbnail">{printImage imgfile=$one_blog_entry.image class='img-responsive' title=$one_blog_entry.title fullimage=true}</a>
						{/if}
						<p class="ia-item-date">{$one_blog_entry.date_added|date_format:$core.config.date_format}</p>
						<div class="ia-item-body">{$one_blog_entry.body|strip_tags|truncate:$core.config.blog_max_block:'...'}</div>
					</div>
				</div>
			{/foreach}
		</div>

		<div class="view-all-blog-entries">
			<a href="{$smarty.const.IA_URL}blog/" class="btn btn-simple">{lang key='view_all_blog_entries'}</a>
		</div>
{else}
	<div class="alert alert-info">{lang key='no_blog_entries'}</div>
{/if}