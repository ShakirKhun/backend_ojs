{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published monographs
 *}
{capture assign="pageTitle"}
	{if $prevPage}
		{translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
	{else}
		{translate key="archive.archives"}
	{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

<div class="wrapper">
	<div class="container">
		{if $section}
			{include file="frontend/components/breadcrumbs_archive.tpl" currentTitle=$section->getLocalizedTitle()}
		{else}
			{include file="frontend/components/breadcrumbs_archive.tpl" currentTitleKey="common.publication"}
		{/if}
		<div class="page_article" style="border-bottom:unset; padding: 20px 0 0 0;">
			<div class="page_description">
				<h2>{$pageTitle|escape}</h2>
			</div>
		</div>
		<div class="main archive_page">
			<div class="archive_content">
				<div class="new_format">
					{* No issues have been published *}
					{if empty($issues)}
						<p>{translate key="current.noCurrentIssueDesc"}</p>
					{* List issues *}
					{else}

					<ul style="display:none">
	              <li>
	              	<ul>

					{foreach from=$issues item="issue"}
						{if $issue->getYear() != $lastYear}
							
									</ul> <!-- UL element -->
		            </li>
		          </ul> <!-- UL year {$lastYear} -->

							<ul class="archive_select">
	              <li><span>{$issue->getYear()}</span>
				  	<img src="http://sarynjournal.kz/plugins/themes/healthSciences/img/archive_dropdown.png">
	              	<ul>
						{/if}
						{assign var=lastYear value=$issue->getYear()}
						{include file="frontend/objects/issue_summary.tpl"}
          {/foreach}
          </ul> <!-- UL element -->
		            </li>
		          </ul> <!-- UL year {$lastYear} -->	
					{/if}
				</div>
			</div>
		</div>
		{$context = Application::get()->getRequest()->getContext()}
		{$archiveDesc = $context->getLocalizedData('archiveDesc')}
		{$archiveDesc}
	</div>
</div>

{include file="frontend/components/footer.tpl"}
