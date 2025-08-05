{**
 * templates/frontend/objects/article_details.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article which displays all details about the article.
 *  Expected to be primary object on the page.
 *
 * Core components are produced manually below. Additional components can added
 * via plugins using the hooks provided:
 *
 * Templates::Article::Main
 * Templates::Article::Details
 *
 * @uses $article Article This article
 * @uses $publication Publication The publication being displayed
 * @uses $firstPublication Publication The first published version of this article
 * @uses $currentPublication Publication The most recently published version of this article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $primaryGalleys array List of article galleys that are not supplementary or dependent
 * @uses $supplementaryGalleys array List of article galleys that are supplementary
 * @uses $keywords array List of keywords assigned to this article
 * @uses $pubIdPlugins Array of pubId plugins which this article may be assigned
 * @uses $copyrightHolder array List of localized names of copyright holder
 * @uses $copyrightYear string Year of copyright
 * @uses $licenseTerms string License terms.
 * @uses $licenseUrl string URL to license. Only assigned if license should be
 *   included with published articles.
 * @uses $ccLicenseBadge string An image and text with details about the license
 *}


<div class="page_article issue_detail_page">
	<div class="page_description font-title">
		<h1 class="f-size">{$publication->getLocalizedFullTitle()|escape}</h1>
	</div>
	<div class="page_description_bottom issue_info">
		<p class="views">{translate key="article.views"}: {$article->getViews()}</p>
		<div class="networks">
			<div id="fb-root"></div>
			<script async defer crossorigin="anonymous"
				src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v17.0" nonce="rCchNVYT"></script>
			<p>{translate key="article.head.share"}:</p>
			<a target="_blank"
				href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse"><img
					src="/plugins/themes/healthSciences/img/logo-facebook-black.png" alt=""></a>
			<a
				href="https://telegram.me/share/url?url=https://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}&text={$publication->getLocalizedFullTitle()|escape}"><img
					src="/plugins/themes/healthSciences/img/logo-telegram-black.png" alt=""></a>
			<a href="https://instagram.com/saryn.journal"><img
					src="/plugins/themes/healthSciences/img/logo-instagram-black.png" alt=""></a>
		</div>
	</div>
</div>
<div class="main">
	<div class="issue_content">
		<div class="issue_author_block">
			{if $primaryGalleys}
				{foreach from=$primaryGalleys item=galley}
					{include file="frontend/objects/galley_link2.tpl" parent=$article publication=$publication galley=$galley purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency')}
				{/foreach}
			{/if}
			<h4>
				{if $publication->getData('authors')|@count > 1}			
					{translate key="article.authors"}
				{else}
					{translate key="article.author.one"}
				{/if}
			</h4>
			{if $publication->getData('authors')}
				{foreach from=$publication->getData('authors') item=author}
					<div class="author">
						<h3 class="name">
							{$author->getFullName()|escape}
						</h3>

						<pre>
						{$countAuthor = $publication->getData('authors')|@count}
						</pre>
						{if $publication->getData('primaryContactId') == $author->getData("id") & $countAuthor >= 2}
							<p>{translate key="author.corresponding"}</p>
						{/if}

						{if $author->getLocalizedData('biography')}
							<p>{$author->getLocalizedData('biography')|strip_unsafe_html}</p>
						{/if}
						{if $author->getLocalizedData('affiliation')}
							<p class="affiliation">
								{$author->getLocalizedData('affiliation')|escape}
							<p class="country"></p>
							{if $author->getData('rorId')}
								<a href="{$author->getData('rorId')|escape}">{$rorIdIcon}</a>
							{/if}
							</p>
						{/if}
						{* assign name=countryCode value=$author->getData('country') *}
						<p>{$countries[$author->getData('country')]}</p>
						{if $author->getData('orcid')}
							{$orcidIcon}
							<a href="{$author->getData('orcid')|escape}" target="_blank">
								{$author->getData('orcid')|escape}
							</a>
						{/if}
					</div>
				{/foreach}
			{/if}
		</div>

		<div class="issue_info_block">
			<h4>{translate key="locale.issue.info"}</h4>
			<div class="issn">
				<div class="issn_left">
					<p class="info_text">{translate key="locale.publication.date.j"}</p>
					<p>{$publication->getData('datePublished')}</p>
				</div>
				<div class="issn_right">
					<p class="info_text">{translate key="locale.article.page"}</p>
					<p>{$publication->getData('pages')|escape}</p>
				</div>
			</div>
			<div class="issn">
				<div class="issn_left">
					{* DOI *}
					{assign var=doiObject value=$article->getCurrentPublication()->getData('doiObject')}
					{if $doiObject}
						{assign var="doiUrl" value=$doiObject->getData('resolvingUrl')|escape}
						{capture assign=translatedDoi}{translate key="doi.readerDisplayName"}{/capture}
						<p class="info_text">
							{capture assign=translatedDOI}{translate key="plugins.pubIds.doi.readerDisplayName"}{/capture}
							DOI
						</p>
						<a href="{$doiUrl}">
							{$doiUrl}
						</a>
					{/if}
				</div>
				<div class="issn_right">
					<p class="info_text">{translate key="locale.chapter.j"}</p>
					<p>
						{$section->getLocalizedTitle()}
					</p>
				</div>
			</div>
			<p class="info_text">{translate key="locale.license.j"}</p>
			<p><a href="https://creativecommons.org/licenses/by-nc-nd/4.0/">Attribution-NonCommercial-NoDerivs 4.0
					International</a></p>
		</div>
		{* Abstract *}
		{if $publication->getLocalizedData('abstract')}
			<h4 style="margin-bottom: -10px;">{translate key="article.abstract"}</h4>
			<p>{$publication->getLocalizedData('abstract')|strip_unsafe_html}</p>
		{/if}





		{if !empty($publication->getLocalizedData('keywords'))}
			<h4 style="margin-bottom: -10px;">{translate key="article.subject"}</h4>
			<p class="article-details-keywords-value">
				{foreach name=keywords from=$publication->getLocalizedData('keywords') item=keyword}
					<span>{$keyword|escape}</span>{if !$smarty.foreach.keywords.last}<br>{/if}
				{/foreach}
			</p>
		{/if}

		{if $parsedCitations || $publication->getData('citationsRaw')}
			<!--<h4>Список литературы</h4>-->
			<section class="item references">
				<h2 class="label">
					{translate key="submission.citations"}
				</h2>
				<div class="value">
					{if $parsedCitations}
						{foreach from=$parsedCitations item="parsedCitation"}
							<p>{$parsedCitation->getCitationWithLinks()|strip_unsafe_html}
								{call_hook name="Templates::Article::Details::Reference" citation=$parsedCitation}</p>
						{/foreach}
					{else}
						{$publication->getData('citationsRaw')|escape|nl2br}
					{/if}
				</div>
			</section>
		{/if}
		{*<div class="item downloads_chart">
				<h4 class="label">
					{translate key="plugins.generic.usageStats.downloads"}
				</h4>
				<div class="value">
					<canvas class="usageStatsGraph" data-object-type="{$pubObjectType}" data-object-id="{$pubObjectId|escape}"></canvas>
					<div class="usageStatsUnavailable" data-object-type="{$pubObjectType}" data-object-id="{$pubObjectId|escape}">
						{translate key="plugins.generic.usageStats.noStats"}
					</div>
				</div>
			</div>*}

	</div>
	<div class="sidebar">
		{if $publication->getLocalizedData('coverImage') || ($issue && $issue->getLocalizedCoverImage())}
			{if $publication->getLocalizedData('coverImage')}
				{assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
				<img class="issue_img" src="{$publication->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
					alt="{$coverImage.altText|escape|default:''}">
			{else}
				<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
					<img class="issue_img" src="{$issue->getLocalizedCoverImageUrl()|escape}"
						alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}">
				</a>
			{/if}
		{/if}

		{if $issue->getDatePublished()}
			<p class="info_text published">
				{translate key="submissions.published"}:
			</p>
			<p>
				{$publication->getData('datePublished')|date_format:$dateFormatShort}
			</p>
		{/if}
		{* if $article->getDateSubmitted()}
			<p class="info_text submitted">
			{translate key="submissions.submitted"}:
			</p>
			<p>
				{$article->getDateSubmitted()|date_format:$dateFormatShort}
			</p>
		{/if *}
		{if $publication->getData('dateAccepted')}
			<p class="info_text accepted">
			{translate key="submissions.submitted"}:
			</p>
			<p>
				{$publication->getData('dateAccepted')}
			</p>
		{/if}
		<div class="issn">
			<div class="issn_left">
				<p class="info_text">{translate key="locale.journal.number"}</p>
				<p>{$issue->getNumber()|escape}</p>
			</div>
			<div class="issn_right">
				<p class="info_text">{translate key="locale.journal.volume"}</p>
				<p>{$issue->getVolume()|escape}</p>
			</div>
		</div>
		{if $primaryGalleys}
			{foreach from=$primaryGalleys item=galley}
				{include file="frontend/objects/galley_link2.tpl" parent=$article publication=$publication galley=$galley purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency')}
			{/foreach}
		{/if}
		{* How to cite *}
		{if $citation}
			<div class="item citation">
				<section class="sub_item citation_display">
					<h4 style="margin-bottom: 5px;" class="label">
						{translate key="submission.howToCite"}
					</h4>
					<div class="value">
						<div id="citationOutput" role="region" aria-live="polite">
							{$citation}
						</div>
						<div class="citation_formats">
							<div class="dropdown">
								<button class="btn dropdown-toggle" type="button" id="cslCitationFormatsButton"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
									data-csl-dropdown="true" aria-controls="cslCitationFormats">
									{translate key="submission.howToCite.citationFormats"}
								</button>
								<div id="cslCitationFormats" class="dropdown-menu citation_formats_list" aria-hidden="true">
									<ul class="citation_formats_styles">
										{foreach from=$citationStyles item="citationStyle"}
											<li>
												<a aria-controls="citationOutput"
													href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgs}"
													data-load-citation
													data-json-href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgsJson}">
													{$citationStyle.title|escape}
												</a>
											</li>
										{/foreach}
									</ul>
									{if count($citationDownloads)}
										<div class="label">
											{translate key="submission.howToCite.downloadCitation"}
										</div>
										<ul class="citation_formats_styles">
											{foreach from=$citationDownloads item="citationDownload"}
												<li>
													<a
														href="{url page="citationstylelanguage" op="download" path=$citationDownload.id params=$citationArgs}">
														<span class="fa fa-download"></span>
														{$citationDownload.title|escape}
													</a>
												</li>
											{/foreach}
										</ul>
									{/if}
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		{/if}
	</div>
</div>
<div class="col-lg-12 order-lg-3 article-footer-hook">
	{call_hook name="Templates::Article::Footer::PageFooter"}
</div>