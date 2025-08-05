{**
 * templates/frontend/pages/submissions.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentContext Journal|Press The current journal or press
 * @uses $submissionChecklist array List of requirements for submissions
* @uses $submissionHeaderText array List of requirements for submissions
 *}
{include file="frontend/components/header.tpl" pageTitle="about.submissions"}
<div class="wrapper">
	<div class="container">
		<div class="page_article submissions-padding">
			<div class="page_description">
				<h2>{translate key="about.submissions"}</h2>
			</div>
			<div class="page_description_bottom">
			</div>
		</div>
		<div class="main">
			<div class="requirements_content">
				{$context = Application::get()->getRequest()->getContext()}
				{$submissionHeaderText = $context->getLocalizedData('submissionHeaderText')}
				{$submissionHeaderText}
				
			{* Login/register prompt *}
				{if $isUserLoggedIn}
					{capture assign="newSubmission"}<a href="{url page="submission" op="wizard"}">{translate key="about.onlineSubmissions.newSubmission"}</a>{/capture}
					{capture assign="viewSubmissions"}<a href="{url page="submissions"}">{translate key="about.onlineSubmissions.viewSubmissions"}</a>{/capture}
					<div class="alert alert-primary">
						{translate key="about.onlineSubmissions.submissionActions" newSubmission=$newSubmission viewSubmissions=$viewSubmissions}
					</div>
				{else}
					{capture assign="login"}<a href="{url page="login"}">{translate key="about.onlineSubmissions.login"}</a>{/capture}
					{capture assign="register"}<a href="{url page="user" op="register"}">{translate key="about.onlineSubmissions.register"}</a>{/capture}
					<div class="alert alert-primary">
						{translate key="about.onlineSubmissions.registrationRequired" login=$login register=$register}
					</div>
				{/if}

				{if $submissionChecklist}
					<div class="submissions-checklist">
						<p>{translate key="about.submissionPreparationChecklist.description"}</p>
						<p>
							{$submissionChecklist}
						</p>
					</div>
				{/if}

				{if $currentContext->getLocalizedData('authorGuidelines')}
					<div class="submissions-author-guidelines">
						<h2>
							{translate key="about.authorGuidelines"}
							{include file="frontend/components/editLink.tpl" page="management" op="settings" path="workflow" anchor="submission/authorGuidelines" sectionTitleKey="about.authorGuidelines"}
						</h2>
						{$currentContext->getLocalizedData('authorGuidelines')}
					</div>
				{/if}

				
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
