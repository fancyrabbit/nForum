<{include file="header.tpl"}>
    	<div class="mbar">
        	<ul>
                <li><a href="<{$base}>/user/info">���������޸�</a></li>
                <li><a href="<{$base}>/user/passwd">�ǳ������޸�</a></li>
                <li class="selected"><a href="<{$base}>/user/custom">�û��Զ������</a></li>
                <li><a href="<{$base}>/mail">�û��ż�����</a></li>
                <li><a href="<{$base}>/friend">�����б�</a></li>
                <li><a href="<{$base}>/fav">�ղذ������</a></li>
            </ul>					
        </div>
        <div class="b-content corner">
        	<div id="c_content" class="corner">
                <form action="" method="post">
                <table id="d_user" width="100%" cellpadding="0" cellspacing="0" border="0">
<{foreach from=$custom item=item}>
                    <tr>
                    	<td class="u-title-1"><span><{$item.name}>:</span><{$item.desc}></td>
                        <td class="u-title-2">
							<input type="radio" <{if $item.val == 1}>checked="true"<{/if}> name="<{$item.id}>" value="1" /><{$item.yes}>
							<input type="radio" <{if $item.val == 0}>checked="true"<{/if}> name="<{$item.id}>" value="0" /><{$item.no}></td>
                    </tr>
<{/foreach}>
                </table>
                <div class="b-op u-op"><input type="submit" class="button" value="�ύ�޸�" /></div>
                </form>
			</div>
		</div>  
<{include file="footer.tpl"}>
