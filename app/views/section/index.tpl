<{include file="header.tpl"}>
	<{include file="s_nav.tpl" nav_left="�����б�"}>
        <div class="b-content corner">
			<table class="board-title corner" cellpadding="0" cellspacing="0">
                <tr>
                    <th class="title_1">��������</th>
                    <th class="title_2">����</th>
                    <th class="title_3">��������</th>
                    <th class="title_4 middle">����</th>
                    <th class="title_5 middle">����</th>
                    <th class="title_6 middle">����</th>
                    <th class="title_7 middle">����</th>
            	</tr>
            </table>
            <table class="board-list corner" cellpadding="0" cellspacing="0">
<{if ($sec)}>
<{foreach from=$sec item=item}>
                <tr>
                    <td class="title_1">
						<a href="<{$base}>/<{$item.type}>/<{$item.name}>"><{$item.desc}></a>
						<br /><{$item.name}>
					</td>
                    <td class="title_2">
<{foreach from=$item.bms item=bm}>
			<{if $bm[1]}><a href="<{$base}>/user/query/<{$bm[0]}>"><{$bm[0]}></a><br /><{else}><{$bm[0]}><br /><{/if}>
<{/foreach}>
					</td>
<{if $item.type == "board"}>
                    <td class="title_3">
						<a href="<{if $item.last.id != ""}><{$base}>/article/<{$item.name}>/<{$item.last.id}><{else}>javascript:void(0);<{/if}>"><{$item.last.title}></a><br />  
						������:&ensp;<{$item.last.owner}> ����:&ensp;<{$item.last.date}>
					</td>
                    <td class="title_4 middle c63f"><{$item.curNum}></td>
                    <td class="title_5 middle c09f"><{$item.todayNum}></td>
                    <td class="title_6 middle c63f"><{$item.threadsNum}></td>
                    <td class="title_7 middle c09f"><{$item.articleNum}></td>
<{else}>
                    <td class="title_3">&nbsp;</td>
                    <td class="title_4 middle c63f">&nbsp;</td>
                    <td class="title_5 middle c09f">&nbsp;</td>
                    <td class="title_6 middle c63f">&nbsp;</td>
                    <td class="title_7 middle c09f">&nbsp;</td>
<{/if}>
            	</tr>
<{/foreach}>
<{else}>
				<tr><td colspan="7" style="text-align:center"><{$noBrd}></td></tr>
<{/if}>
            </table>
    	</div>
<{include file="footer.tpl"}>
