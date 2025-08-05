{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<body>
	<div class="wrapper">
		<div class="container">
			<div class="page_article">
				<div class="page_description">
					<!--<h1>{$displayPageHeaderLogo.altText|escape}</h1>-->
					<div class="main_page_content">
						{if !$activeTheme->getOption('useHomepageImageAsHeader') && $homepageImage}
							<div class="homepage_image">
								<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}"
									{if $homepageImage.altText} alt="{$homepageImage.altText|escape}" {/if}>
							</div>
						{/if}
						<div class="main_content">
							<p class="about_journal">{$aboutMain}</p>
						</div>
					</div>
					<!--<h3>{$displayPageHeaderTitle|escape}</h3>-->
				</div>
				<div class="page_description_bottom">
					{* Search form *}
					<!--{if $currentContext && $requestedPage !== 'search'}
						<div class="pkp_navigation_search_wrapper">
							<a href="{url page="search"}" class="pkp_search pkp_search_desktop">
								<span class="fa fa-search" aria-hidden="true"></span>
								{translate key="common.search"}
							</a>
						</div>
					{/if}-->
					<form action="{url page="search"}" method="get">
						<input type="text" type="search" id="query" name="query"
							placeholder="{translate key="locale.search.placeholder"}" class="search_input">
						<a class="search_btn" id="search_btn"><img src="/plugins/themes/healthSciences/img/search.png"
								alt=""></a>
						<button type="submit" class="search_btn" id="search_btn_submit"><img
								src="/plugins/themes/healthSciences/img/search.png" alt=""></button>
						<a class="search_btn_close"><span></span></a>
					</form>
				</div>
			</div>
			<div class="main">
				<div class="content">

					<div class="content_description">
						{$additionalHomeContent}
					</div>
				</div>
				<div class="sidebar">
					<p class="info_text">{translate key="common.publisher"}:</p>
					{$context = Application::get()->getRequest()->getContext()}
					{$publisherMulti = $context->getLocalizedData('publisherMulti')}				
					<p>{$publisherMulti}
					</p>
					<p>{$publishedSince}</p>
					<p class="info_text">{translate key="locale.publish.period"}:</p>
					{$publishedTimes}
					<div class="issn">
						<div class="issn_left">
							<p class="info_text">{translate key="locale.issn.printed"}</p>
							<p>{$currentJournal->getData('printIssn')}</p>
						</div>
						<div class="issn_right">
							<p class="info_text">{translate key="locale.issn.online"}</p>
							<p>{$currentJournal->getData('onlineIssn')}</p>
						</div>
					</div>
				</div>
			</div>
			<div class="partners-wrap">
				<a href="https://www.ncste.kz/"><img src="/public/journals/1/logo/logo-ncgt.png"></a> 
				<a href="https://www.gov.kz/memleket/entities/quality/documents/details/520901?lang=ru"><img src="/public/journals/1/logo/logo-edugov.png"></a>
				<a href="https://www.rilm.org/resources.php?product=ram&type=music"><img src="/public/journals/1/logo/logo-rilm.svg"></a>
				<a href="https://cyberleninka.ru/journal/n/saryn?i=1140972"><img src="/public/journals/1/logo/logo-cyberleninka_1.svg"></a>
				<a href="https://nauka.kz/"><img src="/public/journals/1/logo/logo-nauka.png"></a>
				<a href="https://elibrary.ru/title_about_new.asp?id=81325"><img src="/public/journals/1/logo/logo-rinc.png"></a>
				<a href="https://www.crossref.org/"><img src="/public/journals/1/logo/logo-crossref.svg"></a>
				<a href=""><img src="/public/journals/1/logo/logo-openaccess.svg"></a>
				<a href="https://www.nlrk.kz/index.php"><img src="/public/journals/1/logo/logo-nacbibleoteka.png"></a>
				<a href="https://www.budapestopenaccessinitiative.org/read/"><img src="/public/journals/1/logo/logo-boai.webp"></a>
			</div>
		</div>
	</div>
</body>

{include file="frontend/components/footer.tpl"}