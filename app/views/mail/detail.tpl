<{include file="header.tpl"}>
    	<div class="mbar">
        	<ul>
                <li><a href="<{$base}>/user/info">���������޸�</a></li>
                <li><a href="<{$base}>/user/passwd">�ǳ������޸�</a></li>
                <li><a href="<{$base}>/user/custom">�û��Զ������</a></li>
                <li class="selected"><a href="<{$base}>/mail">�û��ż�����</a></li>
                <li><a href="<{$base}>/friend">�����б�</a></li>
                <li><a href="<{$base}>/fav">�ղذ������</a></li>
            </ul>					
        </div>
        <div class="c-mbar">
			<ul>
            	<li><a href="<{$base}>/mail/inbox" <{if $type=="inbox"}>class="select"<{/if}>><samp class="ico-pos-dot"></samp>�ռ���</a></li>
                <li><a href="<{$base}>/mail/outbox" <{if $type=="outbox"}>class="select"<{/if}>><samp class="ico-pos-dot"></samp>������</a></li>
                <li><a href="<{$base}>/mail/deleted" <{if $type=="deleted"}>class="select"<{/if}>><samp class="ico-pos-dot"></samp>�Ͼ���</a></li>
                <li><a href="<{$base}>/friend"><samp class="ico-pos-dot"></samp>��ַ��</a></li>
                <li><a href="<{$base}>/mail/send"><samp class="ico-pos-dot"></samp>׫д�ʼ�</a></li>
            </ul>
        </div>
        <div class="b-content">
            <div class="mail-list">
                <div class="m-op">
                    <ul class="m-func"> 
                        <li class="m-reply"><samp class="ico-pos-reply"></samp><a href="<{$base}>/mail/reply/<{$type}>/<{$num}>">�ظ�</a></li> 
                        <li class="m-message"><samp class="ico-pos-mess"></samp><a href="<{$base}>/mail/forward/<{$type}>/<{$num}>">ת��</a></li> 
                        <li class="m-del"><samp class="ico-pos-del"></samp><a href="<{$base}>/mail/delete/<{$type}>/<{$num}>">ɾ��</a></li> 
                        <li class="m-edit"><samp class="ico-pos-edit"></samp><a href="<{$base}>/mail/send">׫д</a></li> 
					</ul>
                </div>
                <div class="mail">
                	<p class="mail-content">
					<{$content}>
                    </p> 
                </div>
                <div class="m-op">
                    <ul class="m-func"> 
                        <li class="m-reply"><samp class="ico-pos-reply"></samp><a href="<{$base}>/mail/reply/<{$type}>/<{$num}>">�ظ�</a></li> 
                        <li class="m-message"><samp class="ico-pos-mess"></samp><a href="<{$base}>/mail/forward/<{$type}>/<{$num}>">ת��</a></li> 
                        <li class="m-del"><samp class="ico-pos-del"></samp><a href="<{$base}>/mail/delete/<{$type}>/<{$num}>">ɾ��</a></li> 
                        <li class="m-edit"><samp class="ico-pos-edit"></samp><a href="<{$base}>/mail/send">׫д</a></li> 
					</ul>
                </div>
            </div>
    	</div>
<{include file="footer.tpl"}>
