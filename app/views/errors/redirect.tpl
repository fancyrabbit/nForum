<{include file="header.tpl"}>
	<{include file="s_nav.tpl" nav_left="��̳��Ϣ"}>
        <div class="b-content">
        	<div class="error">
            	<h5><{$msg}>,��ҳ�潫��<{$time}>����Զ���ת��:</h5>
                	<ul>
<{if empty($url.url)}>
						<li><samp class="ico-pos-dot"></samp><a href="javascript:history.go(-1);">������һҳ</a></li>
<{else}>
						<li><samp class="ico-pos-dot"></samp><a href="<{$base}><{$url.url}>"><{$url.text}></a></li>
<{/if}>
                    </ul>
<{if isset($list)}>
            	<h5>��������ȥ:</h5>
                	<ul>
<{foreach from=$list item=item}>
						<li><samp class="ico-pos-dot"></samp><a href="<{$base}><{$item.url}>"><{$item.text}></a></li>
<{/foreach}>
                    </ul>
<{/if}>
            </div>
        </div>   
<{include file="footer.tpl"}>
