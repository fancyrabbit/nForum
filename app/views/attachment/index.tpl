<{include file="script.tpl"}>
<style>
*{ margin:0px; padding:0px; }
a { color:#6595D6; text-decoration:none; }
a:hover { color:#6595D6; text-decoration:underline; }
body{ font-family:Arial,Verdana,Sans-Serif; font-size:0.8em;}
li{list-style:none;padding:1px}
li span{ }
.input-text{ border:1px solid #7F9DB9; }
.submit{ border:1px solid #77a2d2; background:#ecf4fd; -moz-border-radius: 5px;  -webkit-border-radius: 5px; padding:0; margin:0; color:#4c6785; }
#result{margin-top:5px;width:690px}
.red{color:red;}
table {width:100%;table-layout:fixed;border-collapse:collapse;font-size:12px;border:1px solid #c9d7f1;}
th,td{border-bottom:1px solid #c9d7f1;vertical-align:center;text-align:center;padding:1px 0}
th{background-color:#f5f8fb;}
</style>
<{if !isset($disable)}>
<form method="post" ENCTYPE="multipart/form-data" action="<{$base}>/att/add/<{$bName}><{$postUrl|default:""}>"> 
<input type="file" name="attachfile" size="20" />
<input type="submit" value="�ϴ�" class="submit" style="display:inline"/>&emsp;&emsp;��������:&ensp;<{$maxNum}>&emsp;��С����:&ensp;<{$maxSize}>&emsp;&emsp;<{if isset($msg)}><span class="red"><{$msg}></span><{/if}>
</form>
<{else}>
<span class="red">���ϴ����ļ������Ѿ��ﵽ����</span>
<{/if}>
<div id="result">
<table>
<tr>
<th style="width:40px;">���</td>
<th>�ļ���</td>
<th style="width:60px;">��С</td>
<th style="width:60px;">����</td>
</tr>
<{foreach from=$atts item=att key=k}>
<tr>
<td><{$k+1}>.</td>
<td><{$att.name}></td>
<td><{$att.size}></td>
<td><a href="javascript:window.location.href='<{$base}>/att/del/<{$bName}><{$postUrl|default:""}>?name=<{$att.name}>'">ɾ��</a></td>
</tr>
<{/foreach}>
<tr>
<td colspan="4">��<span class="red"><{$num}></span>���ļ����ܴ�С<span class="red"><{$size}></span></td>
</tr>
</table>
</div>
<{if isset($new)}>
<script type="text/javascript" >
var txt = parent.document.getElementById('ta_content');
txt.value += "[upload=<{$new}>][/upload]";
<{if isset($exif)}>
txt.value += "\n<{$exif}>";
<{/if}>
</script>
<{/if}>
