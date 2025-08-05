{**
 * templates/frontend/pages/issue.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a landing page for a single issue. It will show the table of contents
 *  (toc) or a cover image, with a click through to the toc.
 *
 * @uses $issue Issue The issue
 * @uses $issueIdentification string Label for this issue, consisting of one or
 *       more of the volume, number, year and title, depending on settings
 * @uses $issueGalleys array Galleys for the entire issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$issueIdentification}

<div class="wrapper">
		<div class="container">
			{if $section}
				{include file="frontend/components/breadcrumbs_archive.tpl" currentTitle=$section->getLocalizedTitle()}
			{else}
				{include file="frontend/components/breadcrumbs_archive.tpl" currentTitleKey="common.publication"}
			{/if}
			{if !$issue}
				<div class="page-header page-issue-header">
					{include file="frontend/components/notification.tpl" messageKey="current.noCurrentIssueDesc"}
				</div>
			{else}
				<div class="page_article">
					<div class="page_description">
						<h2>{translate key="journal.currentIssue"}</h2>
					</div>
					<div class="page_description_bottom">
						<form action="{url page="search"}" method="get">
							<input type="text" type="search" id="query" name="query" placeholder="{translate key="locale.search.placeholder"}" class="search_input">
							<a  class="search_btn" id="search_btn"><img src="/plugins/themes/healthSciences/img/search.png" alt=""></a>
							<button type="submit"  class="search_btn" id="search_btn_submit"><img src="/plugins/themes/healthSciences/img/search.png" alt=""></button>
							<a class="search_btn_close"><span></span></a>
						</form>
					</div>
				</div>
				<div class="main">
					<div class="issue_content">
						{foreach name=sections from=$publishedSubmissions item=section}
							{if $section.articles}
								{if $section.title}
									<h5>
										{$section.title|escape}
									</h5>
								{/if}
								{foreach from=$section.articles item=article}
										{include file="frontend/objects/article_summary_list.tpl" }
								{/foreach}
							{/if}
						{/foreach}
					</div>
					<div class="sidebar">
						
						{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
						{if $issueCover}
							<img class="issue_img" src="{$issueCover|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:$defaultAltText}">
						{/if}

						{if $issue->getDatePublished()}
							<p class="info_text">
								{translate key="submissions.published"}:
							</p>
							<p>
								{$issue->getDatePublished()|date_format:$dateFormatShort}
							</p>
						{/if}
						<div class="issn">
							<div class="issn_left">
								<p class="info_text">{translate key="locale.journal.number"}</p>
								<p>№ {$issue->getNumber()|escape}</p>
							</div>
							<div class="issn_right">
								<p class="info_text">{translate key="locale.journal.volume"}</p>
								<p>{$issue->getVolume()|escape}</p>
							</div>
						</div>
						
						{if $issueGalleys}
							{foreach from=$issueGalleys item=galley}
								{include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
							{/foreach}
						{/if}
					</div>
				</div>
			{/if}
		</div>
	</div>
{include file="frontend/components/footer.tpl"}
