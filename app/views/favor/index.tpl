<{include file="header.tpl"}>
    	<div class="mbar corner">
        	<ul>
                <li><a href="<{$base}>/user/info">���������޸�</a></li>
                <li><a href="<{$base}>/user/passwd">�ǳ������޸�</a></li>
                <li><a href="<{$base}>/user/custom">�û��Զ������</a></li>
                <li><a href="<{$base}>/mail">�û��ż�����</a></li>
                <li><a href="<{$base}>/friend">�����б�</a></li>
                <li class="selected"><a href="<{$base}>/fav">�ղذ������</a></li>
            </ul>					
        </div>
        <div class="b-content corner">
			<div id="f_op">
				<input id="update" type="button" class="button" value="ˢ��" />
				<input id="pLevel" type="button" class="button" value="��һ��" />
			</div>
			<div id="f_add">
				��Ӱ���:&ensp;<input type="text" id="ab_txt"  class="input-text" /><input type="button" id="board_btn"  class="button"value="����" />&emsp;&emsp;���Ŀ¼:&ensp;<input type="text" id="ad_txt" class="input-text"/><input type="button" id="dir_btn"  class="button" value="����" />
			</div>
			<table class="board-title" cellpadding="0" cellspacing="0">
                <tr>
                    <th class="title_1">��������</th>
                    <th class="title_2">����</th>
                    <th class="title_3">��������</th>
                    <th class="title_4 middle">��������</th>
                    <th class="title_5 middle">��������</th>
                    <th class="title_6 middle">������</th>
                    <th class="title_7 middle">������</th>
                    <th class="title_8 middle">����</th>
            	</tr>
            </table>
            <table class="board-list" cellpadding="0" cellspacing="0">
				<tbody id="ajaxArea" style="display:none">
                <tr>
                    <td class="title_1">
						<a href="<{$base}>/board/%0%">%1%</a>
						<br />%0%
					</td>
                    <td class="title_2">
						%2%
					</td>
                    <td class="title_3">
						<a href="<{$base}>/article/%0%/%3%">%4%</a><br />  
						�ظ�:&ensp;%5% ����:&ensp;%6%
					</td>
                    <td class="title_4 middle">%7%</td>
                    <td class="title_5 middle">%8%</td>
                    <td class="title_6 middle">%9%</td>
                    <td class="title_7 middle">%10%</td>
                    <td class="title_8 middle"><a href="%11%">ɾ��</a></td>
            	</tr>
				</tbody>
            </table>
    	</div>
<{include file="footer.tpl"}>
