<{include file="header.tpl"}>
	<div id="body" class="corner">
    <div class="t-pre">
        <div class="page">
            <ul class="pagination">
				<li class="page-pre">������:<i><{$totalNum}></i>&emsp;��ҳ:</li>
				<li>
                  <ol title="��ҳ�б�" class="page-main">
					<{$pageBar}>
                  </ol>
				</li>
				<li class="page-suf"></li>	
            </ul>
        </div>
		<div class="t-btn">
<{if !$tmpl}>
			<a href="<{$base}>/article/<{$bName}>/post" id="b_post" class="button">�»���</a>
<{/if}>
			<a href="<{$base}>/article/<{$bName}>/tmpl" class="button">ģ�淢��</a>
<{if $hasVote}>
			<a href="<{$base}>/board/<{$bName}>/vote" class="button">����ͶƱ</a>
<{/if}>
			<a href="<{$base}>/elite/path?v=<{$elitePath}>" class="button">������</a>
			<{if $islogin}><a href="javascript:favadd('<{$bName}>')" class="button">�ղ�</a><{/if}>
			<a href="<{$base}>/rss/board-<{$bName}>" class="rss"><img src="<{$static}><{$base}>/img/rss.gif" /></a>
		</div>
    </div>
	<{capture name=n_left}>���浱ǰ����<{$curNum}>������&emsp;��������<{$todayNum}><{/capture}>
	<{capture name=n_right}>
	����:
		<{foreach from=$bms item=bm}>
			&ensp;<{if $bm[1]}><a href="<{$base}>/user/query/<{$bm[0]}>"><{$bm[0]}></a><{else}><{$bm[0]}><{/if}>
		<{/foreach}>
	<{/capture}>

	<{include file="s_nav.tpl" nav_left=$smarty.capture.n_left nav_right=$smarty.capture.n_right}>
        <div class="b-content corner">
			<table class="board-title" cellpadding="0" cellspacing="0">
                <tr>
                    <th class="title_8">״̬</th>
                    <th class="title_9 middle">����</th>
                    <th class="title_10">����ʱ��&emsp;&ensp;|&ensp;����</th>
                    <th class="title_11 middle">�ظ�</th>
                    <th class="title_12">���»ظ�&emsp;&ensp;|&ensp;����</th>
            	</tr>
            </table>
            <table class="board-list tiz" cellpadding="0" cellspacing="0">
<{if ($info)}>
<{foreach from=$info item=item}>
				<tr <{if $item.tag == "T"}>class="top"<{/if}>>
					<td class="title_8"><a target="_blank" href="<{$base}>/article/<{$bName}>/<{$item.gid}>" title="���´��ڴ򿪴�����"><samp class="tag 
					<{if $item.tag == "N"}> ico-pos-article-normal
					<{elseif $item.tag == "L"}> ico-pos-article-light
					<{elseif $item.tag == "T"}> ico-pos-article-top
					<{elseif $item.tag == "M"}> ico-pos-article-m
					<{elseif $item.tag == "G"}> ico-pos-article-g
					<{else}> ico-pos-article-lock
					<{/if}>"></samp></a></td>
					<td class="title_9">
						<a href="<{$base}>/article/<{$bName}>/<{$item.gid}>"><{$item.title}></a>
		<{if $item.page>7}>
		<span class="threads-tab">[<{section name=temp loop=7 start=2}><a href="<{$base}>/article/<{$bName}>/<{$item.gid}>?p=<{$smarty.section.temp.index}>"><{$smarty.section.temp.index}></a><{/section}>..<a href="<{$base}>/article/<{$bName}>/<{$item.gid}>?p=<{$item.page}>"><{$item.page}></a>]</span>
		<{elseif $item.page>1}>
		<span class="threads-tab">[<{section name=temp loop=$item.page+1 start=2}><a href="<{$base}>/article/<{$bName}>/<{$item.gid}>?p=<{$smarty.section.temp.index}>"><{$smarty.section.temp.index}></a><{/section}>]</span>
		<{/if}>
					</td>
					<td class="title_10"><{$item.postTime}>&ensp;|&ensp;<a href="<{$base}>/user/query/<{$item.poster}>" class="c63f"><{$item.poster}></a></td>
					<td class="title_11 middle"><{$item.num}></td>
					<td class="title_12"><a href="<{$base}>/article/<{$bName}>/<{$item.gid}>?p=<{$item.page}>#a<{$item.num}>" title="��ת�����ظ�"><{$item.replyTime}></a>&ensp;|&ensp;<a href="<{$base}>/user/query/<{$item.last}>" class="c09f"><{$item.last}></a></td>
				</tr>
<{/foreach}>
			</table>
<{else}>
				<tr>
					<td colspan="5" style="text-align:center">�ð���û���κ�����</td>
				</tr>
			</table>
<{/if}>
    	</div>
    <div class="t-pre-bottom">
        <div class="page">
            <ul class="pagination">
				<li class="page-pre">������:<i><{$totalNum}></i>&emsp;��ҳ:</li>
				<li>
                  <ol title="��ҳ�б�" class="page-main">
					<{$pageBar}>
                  </ol>
				</li>
				<li class="page-suf"></li>	
            </ul>
        </div>
    	<div class="t-btn">
        	<form method="get" action="<{$base}>/s/article">
        		<input id="t_search" type="text" class="input-text input" name="t1" value="����ؼ���" />
                <input type="submit" class="button" value="����" />
				<input type="hidden" name="b" value="<{$bName}>" />
            </form>
        </div>
    </div>
    </div>  
<{include file="footer.tpl"}>
