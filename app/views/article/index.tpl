<{include file="header.tpl"}>
    <div class="t-pre">
        <div class="page">
            <ul class="pagination">
			  <li class="page-pre">������:<i><{$totalNum}></i>&emsp;��ҳ:</li>
              <li><ol title="��ҳ�б�" class="page-main"><{$pageBar}></ol></li>
			  <li class="page-suf"></li>	
            </ul>
        </div>
		<div class="t-btn">
<{if !$tmpl}>
        	<a href="<{$base}>/article/<{$bName}>/post" id="b_post" class="button">�»���</a>
<{/if}>
        	<a href="<{$base}>/article/<{$bName}>/tmpl" class="button">ģ�淢��</a>
            <a href="javascript:void(0)" id="goToReply" class="button">��ݻظ�</a>
        </div>
    </div>
	<{capture name=n_left}>��������:&ensp;<{$title}><{/capture}>
	<{capture name=n_right}><span style="color:#eee;display:inline-block;vertical-align:bottom" id="a_share" _u='<{$domain}><{$base}>/article/<{$bName}>/<{$gid}>' _c='<{$title}>'>����:</span><{/capture}>
	<{include file="s_nav.tpl" nav_left=$smarty.capture.n_left nav_right=$smarty.capture.n_right}>
    	<div class="b-content corner">
<{foreach from=$info item=item}>
	<a name="a<{$item.pos}>"></a>
	<div class="a-wrap">
	<table class="article">
		<tr class="a-head">
			<td class="a-left a-no-bottom a-no-top">
<{if !($item.owner)}>
				<span class="u-name"><{$item.poster}></span>
				<span class="u-sex" > <samp title="����" class="ico-pos-offline-hide" ></samp>
				</span>
<{else}>
				<span class="u-name"><a href="<{$base}>/user/query/<{$item.owner.id}>"><{$item.owner.id}></a></span>
				<span class="u-sex" >
				<samp
				<{if ($item.owner.gender == -1)}>
					<{if ($item.owner.online)}> title="�Ա���Ŷ ����" class="ico-pos-online-hide" <{else}> title="�Ա���Ŷ ����" class="ico-pos-offline-hide" <{/if}>
				<{elseif $item.owner.gender == 0}>
					<{if ($item.owner.online)}> title="����Ŷ ����" class="ico-pos-online-man" <{else}> title="����Ŷ ����" class="ico-pos-offline-man" <{/if}>
				<{else}>
					<{if ($item.owner.online)}> title="Ů��Ŷ ����" class="ico-pos-online-woman" <{else}> title="Ů��Ŷ ����" class="ico-pos-offline-woman" <{/if}>
				<{/if}>
				></samp>
				</span>
<{/if}>
			</td>
			<td class="a-no-bottom a-no-top">
				<ul class="a-func">
					<li class="a-reply"><samp class="ico-pos-reply"></samp><a href="<{$base}>/article/<{$bName}>/post/<{$item.id}>" class="a-post">�ظ�</a></li>
					<li class="a-message"><samp class="ico-pos-mess"></samp><a href="<{$base}>/article/forward/<{$bName}>/<{$item.id}>" class="a-post">ת��</a></li>
					<li class="a-search"><samp class="ico-pos-smile"></samp><a href="<{$base}>/s/article?b=<{$bName}>&au=<{$item.poster}>">����</a></li>
				<{if $item.op == "1"}>
					<li class="a-edit"><samp class="ico-pos-edit"></samp><a href="<{$base}>/article/<{$bName}>/edit/<{$item.id}>">�༭</a></li>
					<li class="a-del"><samp class="ico-pos-del"></samp><a href="<{$base}>/article/<{$bName}>/delete/<{$item.id}>" onclick="return confirm('ȷ��ɾ����')">ɾ��</a></li>
				<{/if}>
				</ul>
				<span class="a-pos">
					<{if $item.pos == "0"}>
					¥��
					<{else}>
					��<{$item.pos}>¥
					<{/if}>
				</span>
			</td>
		</tr>
		<tr class="a-body">
			<td class="a-left a-info a-no-bottom a-no-top">
<{if !($item.owner)}>
				&nbsp;
<{else}>
				<div class="u-img">
					<img src="<{$static}><{$base}><{$item.owner.furl}>" <{if $item.owner.width != ""}>width="<{$item.owner.width}>px"<{/if}> <{if $item.owner.height != ""}>height="<{$item.owner.height}>px"<{/if}> />
				</div>
				<div class="u-uid"><{$item.owner.name}></div>
				<dl class="u-info">
					<dt>�ȼ�</dt>
					<dd><{$item.owner.level}></dd>
					<dt>����</dt>
					<dd><{$item.owner.post}></dd>
<{if !($item.owner.hide)}>
					<dt>����</dt>
					<dd><{$item.owner.astro}></dd>
<{/if}>
				</dl>
<{/if}>
			</td>
			<td class="a-content a-no-bottom a-no-top">
				<p><{$item.content}></p>
			</td>
		</tr>
		<tr class="a-bottom">
			<td class="a-left a-no-top a-no-bottom">
<{if !($item.owner)}>
				&nbsp;
<{else}>
				<ul class="a-func a-func-info">
					<li class="a-reply"><samp class="ico-pos-reply"></samp><a href="<{$base}>/user/query/<{$item.owner.id}>">�鿴</a></li>
					<li class="a-message"><samp class="ico-pos-mess"></samp><a href="<{$base}>/mail/reply/<{$bName}>/<{$item.id}>?id=<{$item.owner.id}>" class="a-post">����</a></li>
					<li class="a-search"><samp class="ico-pos-smile"></samp><a href="<{$base}>/friend/add?id=<{$item.owner.id}>" class="a-post">�Ӻ���</a></li>
				</ul>
<{/if}>
			</td>
			<td class="a-no-top a-no-bottom"><a href="#" class="c63f a-back">���ض���</a></td>
		</tr>
	</table>
	</div>
<{/foreach}>
        </div>
    <div class="t-pre-bottom">
        <div class="page">
            <ul class="pagination">
			  <li class="page-pre">������:<i><{$totalNum}></i>&emsp;��ҳ:</li>
              <li><ol title="��ҳ�б�" class="page-main"><{$pageBar}></ol></li>
			  <li class="page-suf"></li>	
            </ul>
        </div>
    	<div class="t-btn">
        	<form id="f_search" method="get" action="<{$base}>/s/article">
        		<input id="t_search" type="text" class="input-text input" name="t1" value="����ؼ���" />
                <input type="submit" class="button" value="����" />
				<!--<input type="hidden" name="d" value="<{$searchDay}>" />-->
				<input type="hidden" name="b" value="<{$bName}>" />
            </form>
        </div>
    </div>
    <!--quick_reply start-->
	<form id="f_post" method="post" action="<{$base}>/article/<{$bName}>/post" >
    <table id="quick_reply" class="corner">
        <tr>
            <td><textarea id="text_a" name="content"></textarea></td>
            <td id="quick_submit"><input type="submit" class="button" value="��ݻظ�" /></td>
        </tr>
        <tr>
			<td colspan="2"><div id="em_img"></div></td>
        </tr>
    </table>
	<input type="hidden" name="reid" value="<{$reid}>" />
	<input type="hidden" name="subject" value="<{$reTitle}>" />
	<{if $anony}>
	<input type="hidden" name="anony" value="1" />
	<{/if}>
    </form>
    <!--quick_reply end-->
<{include file="footer.tpl"}>
