{**
 * templates/frontend/pages/userRegister.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 * @uses $primaryLocale string The primary locale for this journal/press
 *}
{include file="frontend/components/header.tpl" pageTitle="user.register"}



<div class="wrapper">
	<div class="container">
		<div class="main">
			<div class="auth_content">
				<form class="auth_block form-register" id="register" method="post" action="{url op="register"}">
					{csrf}
					<input type="hidden" name="source" value="{$source|escape}" />

					{include file="common/formErrors.tpl"}

					{include file="frontend/components/registrationForm.tpl"}

					{include file="frontend/components/registrationFormContexts.tpl"}

					{* recaptcha spam blocker *}
					{if $reCaptchaHtml}
						<div class="form-group">
							{$reCaptchaHtml}
						</div>
					{/if}
				</form>
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
