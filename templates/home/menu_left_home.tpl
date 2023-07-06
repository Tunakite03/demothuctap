<ul>
    {foreach from=$data item=item key=key}
        <li><a href="{$item.link}" title="{$item.name}">{$item.name}</a></li>
    {/foreach}

</ul>