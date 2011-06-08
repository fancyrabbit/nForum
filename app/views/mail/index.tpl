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
			<form id="mail_clear" action="<{$base}>/mail/delete/<{$type}>" method="post">
			<input type="hidden" name="all" value="all" />
			</form>
			<form id="mail_form" action="<{$base}>/mail/delete/<{$type}>" method="post">
            <div class="mail-list">
                <div class="t-pre">
                    <div class="t-btn">
						<input type="checkbox" class="b-select" />ѡ������
						<input type="button" class="button b-del" value="ɾ��" />
						<input type="button" class="button b-clear" value="ȫ��ɾ��" />
                    </div>
                    <div class="page">
                        <ul class="pagination" title="��ҳ�б�">
                          <li class="page-pre">�ʼ�����:<i><{$totalNum}></i>&emsp;��ҳ:</li>
						  <li>
							  <ol title="��ҳ�б�" class="page-main">
								<{$pageBar}>
							  </ol>
						  </li>
						  <li class="page-suf"></li>	
                        </ul>
                    </div>
                </div>
                <table class="m-table">
<{if isset($info)}>
<{foreach from=$info item=item}>
                	<tr <{if !($item.read)}>class="no_read"<{/if}>>
                    	<td class="title_1"><input type="checkbox" name="m_<{$item.num}>" class="b-mail"/></td>
						<td class="title_2"><a href="<{$base}>/user/query/<{$item.sender}>"><{$item.sender}></a></td>
                        <td class="title_3"><a href="<{$base}>/mail/<{$type}>/<{$item.num}>"><{$item.title}></a></td>
                        <td class="title_4"><{$item.time}></td>
                    </tr>
<{/foreach}>
<{else}>
					<tr>
						<td colspan="4" style="text-align:center">��û���κ��ʼ�</td>
					</tr>
<{/if}>
                </table>
            <div class="t-pre-bottom">
            	<div class="t-btn">
					<input type="checkbox" class="b-select" />ѡ������
					<input type="button" class="button b-del" value="ɾ��" />
					<input type="button" class="button b-clear" value="ȫ��ɾ��" />
				</div>
				<div class="page">
					<ul class="pagination" title="��ҳ�б�">
					  <li class="page-pre">�ʼ�����:<i><{$totalNum}></i>&emsp;��ҳ:</li>
					  <li>
						  <ol title="��ҳ�б�" class="page-main">
							<{$pageBar}>
						  </ol>
					  </li>
					  <li class="page-suf"></li>	
					</ul>
				</div>
             </div>
            </div>
			</form>
    	</div>
<{include file="footer.tpl"}>
