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
            	<li><a href="<{$base}>/mail/inbox"><samp class="ico-pos-dot"></samp>�ռ���</a></li>
                <li><a href="<{$base}>/mail/outbox" ><samp class="ico-pos-dot"></samp>������</a></li>
                <li><a href="<{$base}>/mail/deleted" ><samp class="ico-pos-dot"></samp>�Ͼ���</a></li>
                <li><a href="<{$base}>/friend"><samp class="ico-pos-dot"></samp>��ַ��</a></li>
                <li><a href="<{$base}>/mail/send" class="select"><samp class="ico-pos-dot"></samp>׫д�ʼ�</a></li>
            </ul>
        </div>
        <div class="b-content">
			<form id="f_mail" method="post" action="<{$base}>/mail/send">
                <ul class="post-list" style="border-top:1px solid #c9d7f1;">
                    <li>
						<div class="post-m">�ռ��ˣ�</div>
<{if !isset($rid)}>
						<input class="input-text post-title" type="text" name="id" id="id" style="width:300px" value=""/>  
						<select class="post-select" onchange="$('#id').val($(this).val())">
							<option>ѡ��</option>
							<{html_options options=$friends}>
						</select>
<{else}>
						<input class="input-text post-title" type="text" id="id" style="width:300px" value="<{$rid}>" disabled="true"/>  
						<input type="hidden" name="id" value="<{$rid}>" />
<{/if}>
					</li>
                    <li>
						<div class="post-m">����:</div>
						<input class="input-text post-title" type="text" name="title" value="<{$title|default:""}>"/>
					</li>
                    <li>
						<div class="post-m">���ݣ�</div>
						<textarea id="a_content" class="c-textarea" name="content"><{$content|default:""}></textarea>
					</li>
                    <li>
						<div class="post-m">ѡ��:&nbsp;</div>
						<div class="post-op">
						ǩ����:<select class="post-select" name="signature">
						<{html_options options=$sigOption selected=$sigNow}>
						</select>   
						</div>
                        <div class="post-op"><input type="checkbox" name="backup" checked="true"/>���ݵ���������</div>
                    </li>
                </ul>
                <div class="post-su"><input type="submit" class="button b-submit" value="������Ϣ" /><input class="button b-submit" type="submit" value="��д" /></div>
			</form>
    	</div>
<{include file="footer.tpl"}>
