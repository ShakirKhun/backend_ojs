{**
 * templates/frontend/pages/about.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a journal's or press's description, contact
 *  details, policies and more.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="about.aboutContext"}
<div class="wrapper">
	<div class="container">
		<div class="page_article collegiya_page">
			<div class="page_description">
				<h2>{translate key="about.aboutContext"}</h2>
			</div>
			<div class="page_description_bottom">
			</div>
		</div>
		<div class="main">
			<div class="requirements_content">
				{$currentContext->getLocalizedSetting('about')}
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="about.aboutContext"}
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
