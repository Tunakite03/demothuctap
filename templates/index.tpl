{* {include  file="`$tpldirect`header.tpl"}
{include  file="`$tpldirect``$temp`"}
{include  file="`$tpldirect`footer.tpl"}
 *}

{* {if $m == 'panel' || $m == 'setting'}
	{include  file="`$tpldirect`header_admin.tpl"} *}
{* {elseif $m=='client'}
	{include  file="`$tpldirect`header_client.tpl"} *}
	
	{include  file="`$tpldirect`header.tpl"}

	<div id="main-container" class="w">
		{include  file="`$tpldirect``$temp`"}
	</div>

	{include  file="`$tpldirect`footer.tpl"}