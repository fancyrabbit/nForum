<{include file="header.tpl"}>
    	<div class="mbar">
        	<ul>
                <li class="selected"><a href="<{$base}>/user/info">���������޸�</a></li>
                <li><a href="<{$base}>/user/passwd">�ǳ������޸�</a></li>
                <li><a href="<{$base}>/user/custom">�û��Զ������</a></li>
                <li><a href="<{$base}>/mail">�û��ż�����</a></li>
                <li><a href="<{$base}>/friend">�����б�</a></li>
                <li><a href="<{$base}>/fav">�ղذ������</a></li>
            </ul>					
        </div>
        <div class="b-content corner">
        	<div id="c_content" class="corner">
				<form method="post" action="">
                <h6>������Ϣ</h6>
                <ul>
                    <li>
						<span class="b-left-m">�Ա�:&ensp;</span>
						<input type="radio" name="gender" <{if $gender=="1"}>checked="true"<{/if}> value="1" />&ensp;��&emsp;
						<input type="radio" name="gender" <{if $gender=="2"}>checked="true"<{/if}> value="2" />&ensp;Ů
					</li>
                    <li>
						<span class="b-left-m">��������:&ensp;</span>
						<input class="input-text" size="3" type="text" name="year" value="<{$year}>" />��
						<input size="2" class="input-text" type="text" name="month" value="<{$month}>" />��
						<input size="2" class="input-text" size="2" type="text" name="day" value="<{$day}>" />��
						<span class="b-right-m">����������ȫ������</span></li>
                </ul>
                <h6>ͷ������</h6>
                <ul>
                    <li class="def">
						<span class="b-left-m">�Զ���ͷ��:&ensp;</span>
						<iframe src="<{$base}>/user/face" width="420px" frameborder="0" id="upload"></iframe>
					</li>
                    <li class="def">
                    	<div class="u-img-d">
                    		<div><span>ͷ��λ��:</span><input type="text" class="input-text" value="<{$myface_url}>" id="furl" name="furl"/></div>
							<div><span>��&emsp;&emsp;��:</span><input type="text" class="input-text" value="<{$myface_w}>" id="fwidth" name="fwidth"/></div>
							<div><span>��&emsp;&emsp;��:</span><input type="text" class="input-text" value="<{$myface_h}>" id="fheight" name="fheight"/></div>
                    	</div>
                        <div class="u-img-show">
							<div class="imgss">
								<img src="<{$static}><{$base}><{$myface}>" id="fpreview" <{if $myface_w != ""}>width="<{$myface_w}>px"<{/if}> <{if $myface_h != ""}>height="<{$myface_h}>px"<{/if}> />
							</div>
							<div class="maxDiv"></div>
                        </div>
                    </li>
                </ul>
                <h6>��ϵ��Ϣ</h6>
                <ul>
                    <li><span class="b-left-m">OICQ����:&ensp;</span><input class="input-text" type="text" name="qq" value="<{$qq}>" /><span class="b-right-m">��д����QQ��ַ�����������˵���ϵ</span></li>
                    <li><span class="b-left-m">MSN:&ensp;</span><input class="input-text" type="text" name="msn" value="<{$msn}>" /><span class="b-right-m">��д����MSN��ַ�����������˵���ϵ</span></li>
                    <li><span class="b-left-m">��ҳ:&ensp;</span><input class="input-text" type="text" name="homepage" value="<{$homepage}>" /><span class="b-right-m">��д���ĸ�����ҳ��ַ��չʾ�������Ϸ��</span></li>
                    <li><span class="b-left-m">Email:&ensp;</span><input class="input-text" type="text" name="email" value="<{$email}>"/><span class="b-right-m">������Ч�����ʼ���ַ</span></li>
                    <li><span class="b-left-m">ǩ����:&ensp;</span><textarea class="input-text b-textarea" name="signature"><{$sig}></textarea></li>
                </ul>
                <div class="b-op"><input type="submit" class="button" value="�ύ�޸�" /><input class="button" type="reset" value="��д" /></div>
                </form>
            </div>
    	</div>
<{include file="footer.tpl"}>
