<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%	
	String Project_Root2 = request.getContextPath();
%>
<script type="text/javascript">
// 사이드바 여는 코드
$(document)
    .ready(function() {
      $('.masthead')
        .visibility({
          once: false,
          onBottomPassed: function() {
            $('.fixed.menu').transition('fade in');
          },
          onBottomPassedReverse: function() {
            $('.fixed.menu').transition('fade out');
          }
        });
      $("#sidemenu_icon").click(function(){
    		$("#sidebar").sidebar('setting', 'transition', 'overlay')
    		.sidebar('toggle');
    	});
    });
</script>
<!-- 사이드메뉴 시작 -->
<div class="ui vertical inverted sidebar menu left" id="sidebar">
  <!-- 로고 시작 -->
  <div class="item">
    <img src="/E_BLOCK_plus/1_file/img/_common/logo_white_all.png" style="width: 50%; height: 50%">
  </div>
  <!-- 로고 끝 -->
  <!-- 메인페이지 시작 -->
  <a class="item" href="<%=Project_Root2 %>/front/main.jsp" id="sm_main">메인페이지</a>
  <!-- 메인페이지 끝 -->
  <!-- 마이페이지 시작 -->
  <div class="item" id="sm_mp">
 	<div class="header">마이페이지</div>
  	<div class="menu">
      <a class="item" href="<%=Project_Root2 %>/front/myPage/myPage.jsp" id="sm_mp_mp">
        내 정보
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/myPage/myCommute.jsp" id="sm_mp_com">
        내 출퇴근 내역
      </a>
    </div>
</div>
<!-- 마이페이지 끝 -->
<!-- 전자결재 시작 -->
  <div class="item" id="sm_ap">
  <div class="header">전자결재</div>
  <div class="menu">
  	  <a class="item" href="<%=Project_Root2 %>/front/approval/approvalMain.jsp" id="sm_ap_form">
        결재신청
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/approval/approvalFromMe.jsp" id="sm_ap_fromme">
        내 결재 신청목록
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/approval/approvalToMe.jsp" id="sm_ap_tome">
        내게온 결재목록
      </a>
  </div>
</div>
<!-- 전자결재 끝 -->
<a class="item" href="<%=Project_Root2 %>/front/search/search.jsp">사원검색</a>
<a class="item" href="<%=Project_Root2 %>/front/evaluation/insaList.jsp">인사평가</a>
<a class="item" href="<%=Project_Root2 %>/front/inventory/jaegoEmp.jsp">재고관리</a>
<!-- 인사관리 시작 -->
<div class="item" id="sm_persmanage">
  <div class="header">인사관리</div>
  <div class="menu">
      <a class="item" href="<%=Project_Root2 %>/front/persmanage/AllCmt.jsp" id="sm_persmanage_att">
        전체출결
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/persmanage/AllPev.jsp" id="sm_persmanage_Eval">
        인사평가결과
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/persmanage/cmtDeptList.jsp" id="sm_persmanage_aplist">
        근태결재내역
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/persmanage/cntrSetDept.jsp" id="sm_persmanage_dept">
        부서관리
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/persmanage/persList.jsp" id="sm_persmanage_emp">
        사원관리
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/persmanage/auth.jsp" id="sm_persmanage_auth">
        권한부여
      </a>
  </div>
</div>
<!-- 인사관리 끝 -->
<!-- 물품관리 시작 -->
<div class="item" id="sm_artcl">
  <div class="header">물품관리</div>
  <div class="menu">
      <a class="item" href="<%=Project_Root2 %>/front/article/paygoods.jsp" id="sm_artcl_ap">		
        물품결재내역
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/article/i_o.jsp" id="sm_artcl_sar">
        입출고관리
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/article/account.jsp" id="sm_artcl_acc">
        거래처
      </a>
  </div>
</div>
<!-- 물품관리 끝 -->
<!-- 회계관리 시작 -->
<div class="item" id="sm_acc">
  <div class="header">회계관리</div>
  <div class="menu">
      <a class="item" href="<%=Project_Root2 %>/front/account/com_Spending.jsp" id="sm_acc">
        사원지출관리
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/account/dept_Spending.jsp">
        부서지출관리
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/account/goods_Spending.jsp">
        비품지출관리
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/account/com_Spending.jsp">
        회사지출관리
      </a>
  </div>
</div>
<!-- 회계관리 끝 -->
</div>
<!-- 사이드메뉴 끝 -->
<!-- 사이드바 사용시 내용물은 pusher 속에 -->
<div class="pusher">
