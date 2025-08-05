{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *}

<footer class="footer">
    <div class="container">
        <div class="footer_top">
            <div class="footer_contact_number">
                <p class="info_text">{translate key="locale.contacts.info"}</p>
                <p><a href ="mailto:{$currentJournal->getData('contactEmail')}">{$currentJournal->getData('contactEmail')}</a></p>
                <a href="tel:{$currentJournal->getData('contactPhone')}">{$currentJournal->getData('contactPhone')}</a>
            </div>
            <div class="footer_address">
                <p class="info_text">{translate key="locale.address.info"}</p>
                <!-- <p>{$currentJournal->getData('mailingAddress')}</p> -->
                <p>{$pageFooter}</p>
            </div>
            <div class="footer_network">
                <p class="info_text">{translate key="locale.social.media"}</p>
                <div class="networks">
                    <a href="https://www.facebook.com/sarynjournal"><img src="/plugins/themes/healthSciences/img/logo-facebook.png" alt=""></a>
                    <a href="https://t.me/sarynjournal"><img src="/plugins/themes/healthSciences/img/logo-telegram.png" alt=""></a>
                    <a href="https://instagram.com/saryn.journal"><img src="/plugins/themes/healthSciences/img/logo-instagram.png" alt=""></a>
                </div>
            </div>
        </div>
        <div class="footer_bottom">
            <p class="info_text"><a target="_blank" href="https://creativecommons.org/licenses/by-nc-nd/4.0/"><span id="cc-logo" class="icon"><img style="width: 40px;" alt="cc logo" src="/plugins/themes/healthSciences/img/cc_icon_white_x2.png"></span>
<span id="cc-attribution" class="icon"><img style="width: 40px;" src="/plugins/themes/healthSciences/img/attribution_icon_white_x2.png"></span>
<span id="cc-attribution" class="icon"><img style="width: 40px;" src="/plugins/themes/healthSciences/img/logo_1122.png"></span>
<span id="cc-attribution" class="icon"><img style="width: 40px;" src="/plugins/themes/healthSciences/img/logo_1123.png"></span>
</a></p>
            <p class="info_text">{translate key="footer.developers"}:&nbsp;<a href="https://zeronetech.kz" target="_blank"> Zerone Technology <img src="/plugins/themes/healthSciences/img/zerone_logo.png" alt=""></a></p>
        </div>
    </div>
</footer>

{* Load author biography modals if they exist *}
{if !empty($smarty.capture.authorBiographyModals|trim)}
	{$smarty.capture.authorBiographyModals}
{/if}

{* Login modal 
<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" style="display:none;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				{include file="frontend/components/loginForm.tpl" formType = "loginModal"}
			</div>
		</div>
	</div>
</div>*}

{load_script context="frontend" scripts=$scripts}
    <script src="/plugins/themes/healthSciences/libs/jquery/jquery-1.11.2.min.js"></script>
    <script src="https://unpkg.com/imask"></script>
	<script src="/plugins/themes/healthSciences/libs/waypoints/waypoints.min.js"></script>
	<script src="/plugins/themes/healthSciences/libs/animate/animate-css.js"></script>
	<!-- <script src="/plugins/themes/healthSciences/libs/plugins-scroll/plugins-scroll.js"></script> -->
	<script src="/plugins/themes/healthSciences/js/common.js"></script>
	<script src="/plugins/themes/healthSciences/js/main.js"></script>
    <script>
        var body = document.querySelector("body");
        if(document.body.contains(document.querySelector(".mobMenu")) == true){
            var mobMenu = document.querySelector(".mobMenu");
            var sidebar = document.querySelector(".requirements_sidebar");
            

            function functionA(){
                sidebar.style.position = "fixed";
                sidebar.style.visibility = "visible";
                sidebar.style.opacity = "1";
                sidebar.style.top = "20px";
                sidebar.style.width = "100%";
                sidebar.style.height = "90vh";
                sidebar.style.overflowY = "scroll";
                body.style.overflow = "hidden";
            }

            function functionB(){
                sidebar.style.position = '';
                sidebar.style.visibility = "";
                sidebar.style.opacity = "";
                sidebar.style.top = "";
                sidebar.style.width = "";
                sidebar.style.height = "";
                sidebar.style.overflow = "";
                body.style.overflow = '';
            }

            mobMenu.onfocus = function(){
                functionA();
            };
            // mobMenu.addEventListener("focusin", functionA, true);
            mobMenu.onblur = function(){
                setTimeout(functionB, 0);
            };
            // mobMenu.addEventListener("focusout", functionB, true);
        }else{}
        var burger_menu = document.querySelector(".burger_menu");
        var header = document.querySelector(".header");
        var navContain = document.querySelector("nav > .container");

        function openBurgerMenu(){
            if(document.body.contains(mobMenu) == true){
                mobMenu.classList.toggle("disabled");
            }else{}
            
            header.classList.toggle("openMenu");
            // navContain.classList.toggle("background")
            body.classList.toggle("noScroll");
            document.querySelector("nav").style.overflowY = "scroll";
            navContain.style.overflowY = "scroll";
            // header.style.position = "absolute";
            // header.style.top = "0";
            // header.style.margin-top = "0px";
            navContain.style.position = "relative";
            // header.style.height = "100%";
            let scrollPos = window.pageYOffset;
            // if(window.pageYOffset == 0){
            // 	window.scrollTo(0, scrollPos);
            // } else{
            // 	window.scrollTo(0,0);
            // };
        };

        burger_menu.addEventListener("click", openBurgerMenu, true);

        let winWidth = document.documentElement.scrollWidth;
        let fragment = new DocumentFragment();
        let wrapper, nav2
        if ( winWidth > 1024){
            fragment = fragment.appendChild(document.querySelector(".nav"));
            document.body.innerHTML = document.body.innerHTML.replace(fragment, "");
            body.appendChild(fragment);
            nav2 = document.querySelector(".nav");
            wrapper = document.querySelector(".wrapper");
            body.insertBefore(nav2, wrapper);
            
        }else{
        }
        if ( winWidth < 1024){
            menuLi = document.querySelectorAll(".dropdown_menu");
            for(let i = 0; i < menuLi.length; i++){
                let liInMenu = menuLi[i];
                liInMenu.setAttribute("onclick", "window.btnMenu()");
            }
            function btnMenu() {
                event.currentTarget.getElementsByClassName("sub_menu")[0].classList.toggle("showEl");
                event.currentTarget.classList.toggle("click");
                event.currentTarget.getElementsByTagName("a")[0].classList.toggle("click");
            };

            // Закройте выпадающее меню, если пользователь щелкает за его пределами
            window.onclick = function(event) {
            if (!event.target.matches('.dropdown_menu')) {
                var dropdowns = document.getElementsByClassName(".dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('showEl')) {
                    openDropdown.classList.remove('showEl');
                }
                }
            }
            };
        }else{
            
        }
    </script>
{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
