{**
 * templates/frontend/objects/issue_summary.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists
 *
 * @uses $issue Issue The issue
 *}
{if $issue->getShowTitle()}
{assign var=issueTitle value=$issue->getLocalizedTitle()}
{/if}
{assign var=issueSeries value=$issue->getIssueSeries()}
{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
<li>
	{if $issueTitle}
		<a class="cover" href="{url op="view" path=$issue->getBestIssueId()}">
			<img loading="lazy" src="{$issueCover|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}">
			{if $issueTitle && $issueSeries}
					{$issueSeries|escape}
			{/if}
		</a>
	{/if}
</li>
<!-- .obj_issue_summary -->
