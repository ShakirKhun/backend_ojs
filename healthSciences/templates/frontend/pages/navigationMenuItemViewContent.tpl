{**
 * templates/frontend/pages/navigationMenuItemViewContent.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display NavigationMenuItem custom page content
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$title}

<div class="wrapper">
	<section id="article">
		<div class="container">
			<div class="row">
				{capture assign = urlcurrent}{$smarty.server.PATH_INFO}{/capture}
				{if $urlcurrent == '/saryn/editorial-board'}
					<div class="col" id="collegium">
						{$content}
					</div>
				{else}

					<div class="col-12 col-lg-3">
						{$arrForAuthors = [
							'/saryn/manuscript-preparation-guidelines', 
							'/saryn/manuscript-structuring-rules', 
							'/saryn/articles-formatting-requirements', 
							'/saryn/formatting-rules-for-information-about-the-author',
							'/saryn/copyright'
						]}
						{$arrGuideline = [
							'/saryn/manuscript-preparation-guidelines', 
							'/saryn/general-data', 
							'/saryn/plagiarism', 
							'/saryn/pupblication-fee',
							'/saryn/publication-dates',
							'/saryn/registration-on-website',
							'/saryn/submitting-materials'
						]}
						{$arrRule = [
							'/saryn/manuscript-structuring-rules',
							'/saryn/UDC',
							'/saryn/DOI',
							'/saryn/the-title-of-article',
							'/saryn/abstract',
							'/saryn/keywords',
							'/saryn/the-article-text-structured-according',
							'/saryn/list-of-sources',
							'/saryn/references'
						]}
						{$arrPolicy = [
							'/saryn/editorial-policy',
							'/saryn/themes-and-quality-of-published-materials',
							'/saryn/editing-and-peer-reviewing',
							'/saryn/information-open-access',
							'/saryn/publishing-ethics'
						]}
						{$arrEthic = [
							'/saryn/publication-ethics',
							'/saryn/general-provisions',
							'/saryn/duty-of-editors',
							'/saryn/duties-of-authors',
							'/saryn/duties-of-peer-reviewers'
						]}


						{assign var="bar_at" value=$urlcurrent|strpos:"/"}
						{if $urlcurrent|in_array:$arrForAuthors}
							<aside>
								<div class="sm-gray-text">{translate key="navigation.section.menu"}</div>
									{load_menu name="ForAuthors" ulClass="sideNavUl"}

								{* <div class="requirements_sidebar">

									<div class="menuPage">
										{load_menu name="guideline" id="guideline" ulClass="header-right-item" liClass="part-1"}
									</div>
									<div class="menuSection">
										<div class="Menu" tabindex="1">
											<p>{translate key="navigation.section.menu"}</p>
										</div>
										{load_menu name="adMenuGuideline" id="adMenuGuideline" ulClass="header-right-item" liClass="part-1"}
									</div>
								</div> *}
							</aside>
						{elseif $urlcurrent|in_array:$arrRule}
							<div class="mobMenu" tabindex="1">
								<p>Меню страницы</p>
							</div>
							<div class="requirements_sidebar">
								<div class="menuPage">
									{load_menu name="rule" id="rule" ulClass="header-right-item" liClass="part-1"}
								</div>

								<div class="menuSection">
									<div class="Menu" tabindex="1">
										<p>{translate key="navigation.section.menu"}</p>
									</div>
									{load_menu name="adMenuGuideline" id="adMenuGuideline" ulClass="header-right-item" liClass="part-1"}
								</div>
							</div>
						{elseif $urlcurrent|in_array:$arrPolicy}
							<div class="mobMenu" tabindex="1">
								<p>Меню страницы</p>
							</div>
							<div class="requirements_sidebar">
								<div class="menuPage">
									<div class="menuPage">
										{load_menu name="policy" id="policy" ulClass="header-right-item" liClass="part-1"}
									</div>
									<div class="menuSection">
										<div class="Menu" tabindex="1">
											<p>{translate key="navigation.section.menu"}</p>
										</div>
										{load_menu name="adMenuPolicy" id="adMenuPolicy" ulClass="header-right-item" liClass="part-1"}
									</div>
								</div>


							</div>
						{elseif $urlcurrent|in_array:$arrEthic}
							<div class="mobMenu" tabindex="1">
								<p>Меню страницы</p>
							</div>
							<div class="requirements_sidebar">
								<div class="menuPage">
									{load_menu name="ethic" id="ethic" ulClass="header-right-item" liClass="part-1"}
								</div>
								<div class="menuSection">
									<div class="Menu" tabindex="1">
										<p>Меню раздела</p>
									</div>
									{load_menu name="adMenuPolicy" id="adMenuPolicy" ulClass="header-right-item" liClass="part-1"}
								</div>
							</div>
						{/if}	
					</div>
					<div class="col col-12 col-lg-7">
						<div class="row">
							<h1 class="fs-60px">{$title|escape}</h1>
						</div>
						<div class="row">
							{$content}
						</div>
					</div>
					<div class="col"></div>
				{/if}
			</div>
		</div>
	</section>
</div>



{* 

<div class="wrapper">
	<div class="container">
	<h1>here</h1>
		<div class="page_article collegiya_page">
			<div class="page_description">
				<h2>{$title|escape}</h2>
			</div>
			<div class="page_description_bottom">
			</div>
		</div>
		<div class="main">
			{capture assign = urlcurrent}{$smarty.server.PATH_INFO}{/capture}

			{$arrGuideline = [
				'/saryn/manuscript-preparation-guidelines', 
				'/saryn/general-data', 
				'/saryn/plagiarism', 
				'/saryn/pupblication-fee',
				'/saryn/publication-dates',
				'/saryn/registration-on-website',
				'/saryn/submitting-materials'
			]}
			{$arrRule = [
				'/saryn/manuscript-structuring-rules',
				'/saryn/UDC',
				'/saryn/DOI',
				'/saryn/the-title-of-article',
				'/saryn/abstract',
				'/saryn/keywords',
				'/saryn/the-article-text-structured-according',
				'/saryn/list-of-sources',
				'/saryn/references'
			]}
			{$arrPolicy = [
				'/saryn/editorial-policy',
				'/saryn/themes-and-quality-of-published-materials',
				'/saryn/editing-and-peer-reviewing',
				'/saryn/information-open-access',
				'/saryn/publishing-ethics'
			]}
			{$arrEthic = [
				'/saryn/publication-ethics',
				'/saryn/general-provisions',
				'/saryn/duty-of-editors',
				'/saryn/duties-of-authors',
				'/saryn/duties-of-peer-reviewers'
			]}


			{assign var="bar_at" value=$urlcurrent|strpos:"/"}
			{if $urlcurrent|in_array:$arrGuideline}
				<div class="mobMenu" tabindex="1">
					<p>Меню страницы</p>
				</div>
				<div class="requirements_sidebar">

					<div class="menuPage">
						{load_menu name="guideline" id="guideline" ulClass="header-right-item" liClass="part-1"}
					</div>
					<div class="menuSection">
						<div class="Menu" tabindex="1">
							<p>{translate key="navigation.section.menu"}</p>
						</div>
						{load_menu name="adMenuGuideline" id="adMenuGuideline" ulClass="header-right-item" liClass="part-1"}
					</div>
				</div>
			{elseif $urlcurrent|in_array:$arrRule}
				<div class="mobMenu" tabindex="1">
					<p>Меню страницы</p>
				</div>
				<div class="requirements_sidebar">
					<div class="menuPage">
						{load_menu name="rule" id="rule" ulClass="header-right-item" liClass="part-1"}
					</div>

					<div class="menuSection">
						<div class="Menu" tabindex="1">
							<p>{translate key="navigation.section.menu"}</p>
						</div>
						{load_menu name="adMenuGuideline" id="adMenuGuideline" ulClass="header-right-item" liClass="part-1"}
					</div>
				</div>
			{elseif $urlcurrent|in_array:$arrPolicy}
				<div class="mobMenu" tabindex="1">
					<p>Меню страницы</p>
				</div>
				<div class="requirements_sidebar">
					<div class="menuPage">
						<div class="menuPage">
							{load_menu name="policy" id="policy" ulClass="header-right-item" liClass="part-1"}
						</div>
						<div class="menuSection">
							<div class="Menu" tabindex="1">
								<p>{translate key="navigation.section.menu"}</p>
							</div>
							{load_menu name="adMenuPolicy" id="adMenuPolicy" ulClass="header-right-item" liClass="part-1"}
						</div>
					</div>


				</div>
			{elseif $urlcurrent|in_array:$arrEthic}
				<div class="mobMenu" tabindex="1">
					<p>Меню страницы</p>
				</div>
				<div class="requirements_sidebar">
					<div class="menuPage">
						{load_menu name="ethic" id="ethic" ulClass="header-right-item" liClass="part-1"}
					</div>
					<div class="menuSection">
						<div class="Menu" tabindex="1">
							<p>Меню раздела</p>
						</div>
						{load_menu name="adMenuPolicy" id="adMenuPolicy" ulClass="header-right-item" liClass="part-1"}
					</div>
				</div>
			{/if}

			<div class="requirements_content">
				{$content}
			</div>
		</div>
	</div>
</div> *}

{include file="frontend/components/footer.tpl"}
