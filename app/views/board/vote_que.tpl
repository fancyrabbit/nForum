<{include file="header.tpl"}>
	<{include file="s_nav.tpl" nav_left="����ͶƱ"}>
	<div class="b-content corner">
	<div style="padding:10px;">
		<form action="" method="post">
		<table class="m-table" style="text-align:center">
		<tr>
			<th style="width:180px">����</th>
			<td style="width:auto"><{$title|default:"&nbsp;"}></td>
		</tr>
		<tr>
			<th>����</th>
			<td><{$desc|default:"&nbsp;"}></td>
		</tr>
		<tr>
			<th>����</th>
			<td><{$type|default:"&nbsp;"}></td>
		</tr>
		<tr>
			<th>��ʼʱ��</th>
			<td><{$start|default:"&nbsp;"}></td>
		</tr>
		<tr>
			<th>����ʱ��</th>
			<td><{$day|default:"&nbsp;"}></td>
		</tr>
<{if $type!='�ʴ�'}> 
		<tr>
			<th><{$type}>
<{if $type=='��ѡ'}> 
                <br /><span style="color:red">(���Ͷ<{$limit}>Ʊ)</span>
<{elseif $type=='����'}> 
                <br /><span style="color:red">(��󲻳���<{$limit}>)</span>
<{/if}> 
            </th>
			<td>
<{if $type=='����'}> 
                <input type="text" name="v" class="input-text" style="width:90%;height:40px" value="<{$val}>"/>
<{else}>
            <table style="width:100%">
<{if $type=='��ѡ'}> 
    <{foreach from=$val item=item key=k}>
            <tr>
                <td style="text-align:right;padding-right:15px"><{$item[0]}></td>
                <td style="text-align:left;padding-left:15px;width:40%"><input type="checkbox" name="v[<{$k}>]"<{if $item[1]}>  checked="checked"<{/if}>"/></td>
            </tr>
    <{/foreach}>
<{else}> 
    <{foreach from=$val item=item key=k}>
            <tr>
                <td style="text-align:right;padding-right:15px"><{$item[0]}></td>
                <td style="text-align:left;padding-left:15px;width:40%"><input type="radio" name="v" value="<{$k}>"<{if $item[1]}> checked="checked"<{/if}>/></td>
            </tr>
    <{/foreach}>
<{/if}> 
            </table>
<{/if}> 
            </td>
		</tr>
<{/if}> 
		<tr>
			<th>����˵�Ļ�:<br />(��3��)</th>
			<td><textarea name="msg" style="width:90%" rows="3"><{$msg}></textarea></td>
        </tr>
        <tr class="tmpl-op">
				<td colspan="2" style="padding:4px 0"><input type="submit" class="button" value="�ύ" />&emsp;<input type="button" class="button" value="����" onclick="javascript:history.go(-1)" /></td>
			</tr>
			</table>
			</form>
		</div>
    	</div>
<{include file="footer.tpl"}>
