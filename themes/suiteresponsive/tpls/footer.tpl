{*
/*********************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo. If the display of the logo is not reasonably feasible for
 * technical reasons, the Appropriate Legal Notices must display the words
 * "Powered by SugarCRM".
 ********************************************************************************/

*}
</div>

{if $AUTHENTICATED}
    <footer>
        <div class="companyLogo">
            <span class="glyphicon glyphicon-globe"></span> {$STATISTICS}
        </div>
        <div id="links">
            <button id="print_page" class="button primary" onclick="printpage()">{$MOD.LBL_SUITE_PRINT}</button>
            <button id="backtotop" class="button primary">{$MOD.LBL_SUITE_TOP}</button>
        </div>
        <div id="copyright_data">
            <div id="dialog2" title="{$MOD.LBL_SUITE_SUPERCHARGED}">
                <p>{$MOD.LBL_SUITE_DESC1}</p>
                <br>
                <p>{$MOD.LBL_SUITE_DESC2}</p>
                <br>
                <p>{$MOD.LBL_SUITE_DESC3}</p>
                <br>
            </div>
            <div id="dialog" title="&copy; {$MOD.LBL_SUITE_POWERED_BY}">
                <p>{$COPYRIGHT}</p>
            </div>
            <div id="copyrightbuttons">
            <button id="admin_options" class="button primary">&copy; {$MOD.LBL_SUITE_SUPERCHARGED}</button>
            <button id="powered_by" class="button primary">&copy; {$MOD.LBL_SUITE_POWERED_BY}</button>
            </div>
        </div>
    </footer>
{/if}
<script>
{literal}
function printpage()
{
    window.print();
}
if(SUGAR.util.isTouchScreen()) {
        setTimeout(resizeHeader,10000);
}

//qe_init function sets listeners to click event on elements of 'quickEdit' class
 if(typeof(DCMenu) !='undefined'){
    DCMenu.qe_refresh = false;
    DCMenu.qe_handle;
 }
function qe_init(){

    //do not process if YUI is undefined
    if(typeof(YUI)=='undefined' || typeof(DCMenu) == 'undefined'){
        return;
    }


    //remove all existing listeners.  This will prevent adding multiple listeners per element and firing multiple events per click
    if(typeof(DCMenu.qe_handle) !='undefined'){
        DCMenu.qe_handle.detach();
    }

    //set listeners on click event, and define function to call
    YUI().use('node', function(Y) {
        var qe = Y.all('.quickEdit');
        var refreshDashletID;
        var refreshListID;

        //store event listener handle for future use, and define function to call on click event
        DCMenu.qe_handle = qe.on('click', function(e) {
            //function will flash message, and retrieve data from element to pass on to DC.miniEditView function
            ajaxStatus.flashStatus(SUGAR.language.get('app_strings', 'LBL_LOADING'),800);
            e.preventDefault();
            if(typeof(e.currentTarget.getAttribute('data-dashlet-id'))!='undefined'){
                refreshDashletID = e.currentTarget.getAttribute('data-dashlet-id');
            }
            if(typeof(e.currentTarget.getAttribute('data-list'))!='undefined'){
                refreshListID = e.currentTarget.getAttribute('data-list');
            }
            DCMenu.miniEditView(e.currentTarget.getAttribute('data-module'), e.currentTarget.getAttribute('data-record'),refreshListID,refreshDashletID);
        });

    });
}

    qe_init();


	SUGAR_callsInProgress++;
	SUGAR._ajax_hist_loaded = true;
    if(SUGAR.ajaxUI)
    	YAHOO.util.Event.onContentReady('ajaxUI-history-field', SUGAR.ajaxUI.firstLoad);
</script>
    <script>
        $( "button" ).click(function() {
            $( "#sugarcopy" ).toggle();

        });

        $(function() {
            $( "#dialog, #dialog2" ).dialog({
                autoOpen: false,
                show: {
                    effect: "blind",
                    duration: 100
                },
                hide: {
                    effect: "fade",
                    duration: 1000
                }
            });
            $( "#powered_by" ).click(function() {
                $( "#dialog" ).dialog( "open" );
                $("#overlay").show().css({"opacity": "0.5"});
            });
            $( "#admin_options" ).click(function() {
                $( "#dialog2" ).dialog( "open" );
            });
        });

        $("#read").click(function(){

        });

        // Back to top animation
        $('#backtotop').click(function(event) {
            event.preventDefault();
            $('html, body').animate({scrollTop:0}, 500); // Scroll speed to the top
        });
        // Refresh function for refresh button on sidebar
        function refresh(reload)
        {
            window.location.reload(true);
        }
        // Tabs jQuery for Admin panel
        $(function() {
            var tabs = $( "#tabs" ).tabs();
            tabs.find( ".ui-tabs-nav" ).sortable({
                axis: "x",
                stop: function() {
                    tabs.tabs( "refresh" );
                }
            });
        });
    </script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="themes/suiteresponsive/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <script src="themes/suiteresponsive/js/jquery.cookie.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
{/literal}
</div>
</div>
</body>
</html>