<{include file="header.tpl"}>
    	<div class="mbar">
        	<ul>
                <li class="selected"><a href="javascript:void(0)">��дע�ᵥ</a></li>
            </ul>					
        </div>
        <div class="b-content corner">
        	<div id="c_content" class="corner">
                <form action="" method="post" id="f_reg">
                <table id="r_table" width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                    	<td class="r_cell_1"><span>��ʵ����</span>��������, ����2������</td>
                        <td class="r_cell_2"><input type="text" class="input-text" name="tname" id="t_tname"/></td>
                    </tr>
                    <tr>
                    	<td class="r_cell_1"><span>�Ա�</span>��ѡ�������Ա�</td>
                        <td class="r_cell_2"><input type="radio" name="gender" checked value="1"/><samp class="ico-pos-online-man"></samp>��&emsp;&emsp;<input type="radio" name="gender" value="2"/><samp class="ico-pos-online-woman" ></samp>Ů</td>
                    </tr>
                    <tr>
                    	<td class="r_cell_1"><span>ѧУϵ��������λ</span>�ڶ�������дѧУ\�꼶\רҵ\�༶<br />�����ʿ����д��λȫ��\����</td>
                        <td class="r_cell_2"><input type="text" class="input-text" name="dept" id="t_dept"/></td>
                    </tr>
                    <tr>
                    	<td class="r_cell_1"><span>��ϸסַ</span>�ڶ�������д�����ַ���嵽�����<br />�����ʿ����д��ס��ַ���嵽���ź�</td>
                        <td class="r_cell_2"><input type="text" class="input-text" name="address" id="t_address"/></td>
                    </tr>
                    <tr>
                    	<td class="r_cell_1"><span>����</span>���ո�ʽΪXXXX-XX-XX</td>
                        <td class="r_cell_2"><input type="text" class="input-text" name="year" id="t_year" size="4"/>��&emsp;<input type="text" class="input-text" name="month" id="t_month" size="2"/>��&emsp;<input type="text" class="input-text" name="day" id="t_day" size="2"/>��</td>
                    </tr>
                    <tr>
                    	<td class="r_cell_1"><span>��ϵ�绰</span>����д���ķ�ʽ</td>
                        <td class="r_cell_2"><input type="text" class="input-text" name="phone" id="t_phone"/></td>
                    </tr>
                    <tr>
                    	<td class="r_cell_1"><span>�����ʼ�</span>����д��Ч�ĵ����ʼ�</td>
                        <td class="r_cell_2"><input type="text" class="input-text" name="email" id="t_email"/></td>
                    </tr>
                    <tr>
                    	<td class="r_cell_1"><span>��֤��</span><font color="red">�������ұ�ͼƬ�еĵ�ʽ�Ľ��(�����ֻ����'+','-')</font></td>
                        <td class="r_cell_2"><input type="text" class="input-text" name="auth" id="t_auth"/><img id="authimg" src="<{$base}>/authimg" alt="auth code"/></td>
                    </tr>
                </table>
                <div class="r_su"><input type="submit" class="button r_submit" value="��Ҫע��" /></div>
                </form>
			</div>
		</div>  
<{include file="footer.tpl"}>
