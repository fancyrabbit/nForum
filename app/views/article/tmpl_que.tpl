<{include file="header.tpl"}>
	<{include file="s_nav.tpl" nav_left="ģ�巢��"}>
	<div class="b-content corner">
	<div class="tmpl">
		<form action="" method="post" id="f_tmpl">
		<table class="m-table que">
		<tr>
			<th class="col5">ģ��<{$num}></th>
			<td class="col6"><{$tmplTitle}></td>
		</tr>
		<tr>
			<th>����</th>
			<td><{$title|default:"<input type=\"text\" name=\"q[0]\" class=\"input-text\" style=\"width:90%\" />"}></td>
		</tr>
<{foreach from=$info item=item key=k}>
		<tr>
			<th>����<{$k+1}>:<{$item.text}>(����:<{$item.len}>)</th>
			<td><textarea name="q[<{$k+1}>]" style="width:90%"></textarea></td>
			</tr>
<{/foreach}>
			<tr class="tmpl-op">
				<td colspan="2"><input type="submit" class="button" value="�ύ����" onclick="$('#h_pre').val('0');$('#f_tmpl').attr('target','_self')"/>&ensp;<input type="submit" class="button" value="Ԥ��" onclick="$('#h_pre').val('1');$('#f_tmpl').attr('target','_blank')"/>&ensp;<input type="button" class="button" value="����"/><input type="hidden" value="0" name="pre" id="h_pre"/></td>
			</tr>
			</table>
			</form>
		</div>
    	</div>
<{include file="footer.tpl"}>
