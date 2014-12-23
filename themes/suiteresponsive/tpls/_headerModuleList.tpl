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
 * this program; if not, see ttp://www.gnu.org/licenses or write to the Free
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
<!--Start Responsive Top Navigation Menu -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.php">{$APP.LBL_BROWSER_TITLE}</a>
            <form id="searchmobile" name='UnifiedSearch' action='index.php' onsubmit='return SUGAR.unifiedSearchAdvanced.checkUsaAdvanced()'>
                <input type="hidden" class="form-control" name="action" value="UnifiedSearch">
                <input type="hidden" class="form-control" name="module" value="Home">
                <input type="hidden" class="form-control" name="search_form" value="false">
                <input type="hidden" class="form-control" name="advanced" value="false">
                    <span class="input-group-btn">
                        <input type="text" class="form-control" name="query_string" id="query_string" placeholder="Search..." />
                    </span>
            </form>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                {foreach from=$moduleTopMenu item=module key=name name=moduleList}
                {if $name == $MODULE_TAB}
                <li id="topnav">
                    <span class="currentTabLeft">&nbsp;</span>
                    {if $name != 'Home'}<span id="headerlinks" class="dropdown-toggle" data-toggle="dropdown" class="currentTab">{sugar_link id="moduleTab_$name" module=$name data=$module}</span><span>&nbsp;</span>{/if}
                    <ul class="dropdown-menu" role="menu">
                        {if count($shortcutTopMenu.$name) > 0}
                        <h3 class="home_h2">{$APP.LBL_LINK_ACTIONS}</h3>
                                <span class="breaker">

                            {foreach from=$shortcutTopMenu.$name item=item}
                                {if $item.URL == "-"}
                                    <li><a></a><span>&nbsp;</span></li>
                            {else}
                                <li> <a href="{$item.URL}" class=""><span>{$item.LABEL}</span></a></li>
                                {/if}
                            {/foreach}
                                    <br>
                                    {/if}
                                    {if $name == 'Home' and !$lock_homepage}
                                        <h3>{$APP.LBL_LINK_ACTIONS}</h3>
                                        <li style="margin-top:5px; margin-bottom:5px;"><a href="" onclick="addDashboardForm();return false">{$APP.LBL_ADD_TAB}</a></li>
                                        <li style="margin-top:5px; margin-bottom:5px;"><a href="" onclick="return SUGAR.mySugar.showDashletsDialog();">{$APP.LBL_ADD_DASHLETS}</a></li>
                                    {/if}
                                    <h3 class="home_h2">{$APP.LBL_LAST_VIEWED}</h3><br>
                                    {foreach from=$recentRecords item=item name=lastViewed}
                                    {if $name == 'Home'}
                                    <table style="width:100%">
                                        <tr>
                                            <td>
                                                <li>
                                                    <a title="{$item.module_name}"
                                                       accessKey="{$smarty.foreach.lastViewed.iteration}"
                                                       href="{sugar_link module=$item.module_name action='DetailView' record=$item.item_id link_only=1}">
                                                        <span>{$item.item_summary_short}</span>
                                                    </a>
                                            </td>
                                            <td align="right">
                                                <em><a href="{sugar_link module=$item.module_name action='EditView' record=$item.item_id link_only=1}" style="margin-left:10px;"><img style="float:right;" src="index.php?entryPoint=getImage&imageName=dashlet-header-edit.png" width="14" height="14" class="iconed_dull"></a></em>
                                            </td>
                                            </span>
                </li>
                </tr>
                </table>
                {/if}
                {if $item.module_name == $name}
                    <table style="width:100%">
                        <tr>
                            <td>
                                <li>
                                                <span>
                                                <a title="{$item.module_name}"
                                                   accessKey="{$smarty.foreach.lastViewed.iteration}"
                                                   href="{sugar_link module=$item.module_name action='DetailView' record=$item.item_id link_only=1}">
                                                    <span>{$item.item_summary_short}</span>
                                                </a>
                            </td>
                            <td align="right">
                                <em><a href="{sugar_link module=$item.module_name action='EditView' record=$item.item_id link_only=1}" style="margin-left:10px;"><span class=" glyphicon glyphicon-pencil" aria-hidden="true"></a></em></td></span>
                            </li>
                        </tr>
                    </table>
                {/if}
                {foreachelse}
                {$APP.NTC_NO_ITEMS_DISPLAY}
                {/foreach}
            </ul>
            {else}
            <li id="topnav">
                <span class="notCurrentTabLeft">&nbsp;</span>
                {if $name != 'Home'}<span id="headerlinks" class="dropdown-toggle" data-toggle="dropdown" class="notCurrentTab">{sugar_link id="moduleTab_$name" module=$name data=$module}</span><span class="notCurrentTabRight">&nbsp;</span>{/if}
                <ul class="dropdown-menu" role="menu">
                    {if count($shortcutTopMenu.$name) > 0}
                    <h3 class="home_h2">{$APP.LBL_LINK_ACTIONS}</h3>
                        {foreach from=$shortcutTopMenu.$name item=item}
                            {if $item.URL == "-"}
                                <li><a></a><span>&nbsp;</span></li>
                            {else}
                                <li><a href="{$item.URL}">{$item.LABEL}</a></li>
                            {/if}
                        {/foreach}
                        <br>
                    {/if}
                    <h3 class="home_h2">{$APP.LBL_LAST_VIEWED}</h3>
                    {foreach from=$recentRecords item=item name=lastViewed}
                        {if $name == 'Home'}
                        <table style="width:100%">
                        <tr><td>
                        <li>
                        <a title="{$item.module_name}"
                        accessKey="{$smarty.foreach.lastViewed.iteration}"
                        href="{sugar_link module=$item.module_name action='DetailView' record=$item.item_id link_only=1}">
                        <span>{$item.item_summary_short}</span>
                        </a>
                        </td>
                        <td align="right">
                        <em><a href="{sugar_link module=$item.module_name action='EditView' record=$item.item_id link_only=1}" style="margin-left:10px;"><img style="float:right;" src="index.php?entryPoint=getImage&imageName=dashlet-header-edit.png" width="14" height="14" class="iconed_dull"></a></em>
                        </td>
                        </span>
                        </li>
                        </tr>
                        </table>
                        {/if}
            {if $item.module_name == $name}
                <table style="width:100%">
                    <tr>
                        <td>
                            <li>
                                            <span>
                                            <a title="{$item.module_name}"
                                               accessKey="{$smarty.foreach.lastViewed.iteration}"
                                               href="{sugar_link module=$item.module_name action='DetailView' record=$item.item_id link_only=1}">
                                                <span>{$item.item_summary_short}</span>
                                            </a>
                        </td>
                        <td align="right">
                            <em><a href="{sugar_link module=$item.module_name action='EditView' record=$item.item_id link_only=1}" style="margin-left:10px;"><span class=" glyphicon glyphicon-pencil" aria-hidden="true"></a></em>
                        </td>
                        </span>
                        </li>
                        </td>
                    </tr>
                </table>
            {/if}
            {foreachelse}
            {$APP.NTC_NO_ITEMS_DISPLAY}
            {/foreach}
            </ul>
            </li>
            {/if}
            {/foreach}
            {if count($moduleExtraMenu) > 0}
                <li id="moremenu">
                    <a class="dropdown-toggle" data-toggle="dropdown">{$APP.LBL_MORE} &raquo;</a>
                    <ul class="dropdown-menu" role="menu">
                        <div class="bigmenu">
                            {foreach from=$moduleExtraMenu item=module key=name name=moduleList}
                                <li>{sugar_link id="moduleTab_$name" module=$name data=$module}</li>
                            {/foreach}
                        </div>
                    </ul>
                </li>
            {/if}
            </ul>
            <div id="globalLinks" class="dropdown nav navbar-nav navbar-right">
                <li id="usermenu" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                    <span class="glyphicon glyphicon-user"> </span> {$CURRENT_USER}
                    <span class="caret"></span>
                </li>
                <button id="usermenucollapsed" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                    <span class="glyphicon glyphicon-user"> </span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    {foreach from=$GCLS item=GCL name=gcl key=gcl_key}
                        <li role="presentation">
                            <a id="{$gcl_key}_link" href="{$GCL.URL}"{if !empty($GCL.ONCLICK)} onclick="{$GCL.ONCLICK}"{/if}>{$GCL.LABEL}</a>
                        </li>
                    {/foreach}
                    <li role="presentation"><a role="menuitem" id="logout_link" href='{$LOGOUT_LINK}' class='utilsLink'>{$LOGOUT_LABEL}</a></li>
                </ul>
            </div>
            <form id="searchform" class="navbar-form navbar-right" name='UnifiedSearch' action='index.php' onsubmit='return SUGAR.unifiedSearchAdvanced.checkUsaAdvanced()'>
                <input type="hidden" class="form-control" name="action" value="UnifiedSearch">
                <input type="hidden" class="form-control" name="module" value="Home">
                <input type="hidden" class="form-control" name="search_form" value="false">
                <input type="hidden" class="form-control" name="advanced" value="false">
                    <span class="input-group-btn">
                        <input type="text" class="form-control" name="query_string" id="query_string" placeholder="Search..." />
                            <button  type="submit" class="btn btn-default" ><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                    </span>
            </form>
            <!--<button id="buttontoggle" class="ui-state-default ui-corner-all">Toggle Sidebar</button>-->
        </div>
    </div>
</nav>

<!--End Responsive Top Navigation Menu -->
<!--Start Responsive Sidebar -->

{*<div class="container-fluid">
    <!--<div id="togglesidebar">
        <button class="btn btn-default"><span class="glyphicon glyphicon-th-list"></span> Toggle Sidebar</button>
    </div>-->
    <div class="row">
    <div class="col-sm-3 col-md-2 sidebar">
        <div class="btn-toolbar" role="toolbar" aria-label="...">
            <div class="btn-group" role="group" aria-label="..."><a href="index.php" class="btn btn-success"></span><span class="glyphicon glyphicon-home" aria-hidden="true"></a></div>
            <div class="btn-group" role="group" aria-label="..."><a href="index.php?module=Users&action=EditView&record={$CURRENT_USER_ID}" class="btn btn-success"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a></div>
            <div class="btn-group" role="group" aria-label="..."><a href="" class="btn btn-success" onclick="refresh();"><span class=" glyphicon glyphicon-refresh" aria-hidden="true"></span></a></div>
            <div class="btn-group" role="group" aria-label="..."><a role="menuitem" id="logout_link" href='{$LOGOUT_LINK}' class="btn btn-success"><span class=" glyphicon glyphicon-log-out" aria-hidden="true"></span></a></div>
        </div>
        <hr class="hr">
        <div class="dropdown">
            <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
               Create New Record <span class="glyphicon glyphicon-plus"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                <li><a href="index.php?module=Accounts&action=EditView&return_module=Accounts&return_action=DetailView">{$APP.LBL_QUICK_ACCOUNT}</a></li>
                <li><a href="index.php?module=Contacts&action=EditView&return_module=Contacts&return_action=DetailView">{$APP.LBL_QUICK_CONTACT}</a></li>
                <li><a href="index.php?module=Opportunities&action=EditView&return_module=Opportunities&return_action=DetailView">{$APP.LBL_QUICK_OPPORTUNITY}</a></li>
                <li><a href="index.php?module=Leads&action=EditView&return_module=Leads&return_action=DetailView">{$APP.LBL_QUICK_LEAD}</a></li>
                <li><a href="index.php?module=Documents&action=EditView&return_module=Documents&return_action=DetailView">{$APP.LBL_QUICK_DOCUMENT}</a></li>
                <li><a href="index.php?module=Calls&action=EditView&return_module=Calls&return_action=DetailView">{$APP.LBL_QUICK_CALL}</a></li>
                <li><a href="index.php?module=Tasks&action=EditView&return_module=Tasks&return_action=DetailView">{$APP.LBL_QUICK_TASK}</a></li>
            </ul>
        </div>
        <hr class="hr">
        <h2>{$APP.LBL_LAST_VIEWED}</h2>
        <ul class="nav nav-pills nav-stacked">
            {foreach from=$recentRecords item=item name=lastViewed}
                <li id="recentlinks" role="presentation">
                    <a title="{$item.module_name}"
                       accessKey="{$smarty.foreach.lastViewed.iteration}"
                       href="{sugar_link module=$item.module_name action='DetailView' record=$item.item_id link_only=1}">
                        <span aria-hidden="true">{$item.item_summary_short}</span>
                    </a>
                </li>
            {/foreach}
        </ul>
    </div>*}
    <!--End Responsive Sidebar -->
    <!--Start Page content -->