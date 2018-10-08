package eblock.c_dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSession;

//비품업무 DAO계층
public class EquipDao {
	SqlSession sqlSession = null;
	public EquipDao() {
		sqlSession = MybatisSession.getSqlSession();
	}
	

	List<Map<String, Object>> list;
	int result;
	String nameSpace = "eblock.mybatis.mapper.equip.";
	
	
	
	
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	

	/* 비품분류관리 */

	
	//─────[ 결재권 조회하기 | 테스트완료(10/04) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> emp_authList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"emp_authList", pMap);
		return list;
	}
	//─────[ 결재권자 조회하기 | 테스트완료(10/04) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> emp_authorList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"emp_authorList", pMap);
		return list;
	}
	//[결재권자]
	//─────[ 비품분류 등록하기 | 테스트완료(10/04) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int sort_add(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"sort_add",pMap);
		return result;
	}
	//[결재권자]
	//─────[ 등록된 비품분류 수정하기 | 테스트완료(10/04) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int sort_upd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"sort_upd",pMap);
		return result;
	}
	//[결재권자]
	//─────[ 등록된 비품분류 삭제하기 | 테스트완료(10/04) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int sort_del(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"sort_del",pMap);
		return result;
	}
	//─────[ 등록된 비품분류조회하기 | 테스트완료(10/04) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> sort_list(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"sort_list", pMap);
		return list;
	}
	
	
	
	
	
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	
	
	
	
	/* 구매가능비품내역추가 */
	
	
	//─────[ 비품추가신청내역에 새로운 비품내역추가 신청하기 | 테스트완료(10/05) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	//오류..Illegal mix of collations (utf8_unicode_ci,IMPLICIT) and (utf8_general_ci,IMPLICIT) for operation '='
	public int add_ask(Map<String, Object> pMap) {
		result = sqlSession.insert(nameSpace+"add_ask", pMap);
		return result;
	}
	//─────[ 대기중인 비품내역추가신청 수정하기 | 테스트완료(10/05) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int add_askUpd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"add_askUpd",pMap);
		return result;
	}
	//─────[ 비품추가신청내역 조회하기 | 테스트완료(10/05) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> add_askList(Map<String, Object> pMap) {
		//사원조건 2가지 ( 신청사원 | 결재사원 )
		//상태조건 4가지 ( 취소|대기|기각|승인 )
		list = sqlSession.selectList(nameSpace+"add_askList", pMap);
		return list;
	}
	//다중조건 검토문 예제 구현하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
	//[결재권자]
	//─────[ 비품추가신청내역신청 결재하기 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int add_sign(Map<String, Object> pMap) {
		List<Map<String, Object>> list_forMultiDynamict = new ArrayList<>();
		list_forMultiDynamict.add(pMap);;
		//다중업데이트 동작쿼리 : List<Map<String,Object>> 를 파라미터로 이용
		result = sqlSession.update(nameSpace+"add_sign",pMap);
		return result;
	}
///////////////////// 상위 코드 단위테스트 완료 [ 10/04 ] //////////////////////////////////////////
	//─────[ (신청가능)비품테이블에서 비품 조회하기 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> add_equipList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"add_equipList", pMap);
		return list;
	}
	//[결재권자]
	//─────[ (신청가능)비품테이블에 비품가격 수정하기 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int add_equipCost(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"add_equipCost",pMap);
		return result;
	}
	
	
	
	
	
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	
	
	
	/* 거래처관리 */
	
	
	//[결재권자]
	//─────[ 거래처 등록하기 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int mk_add(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"mk_add",pMap);
		return result;
	}
	//[결재권자]
	//─────[ 등록된 거래처 수정하기 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int mk_upd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"mk_upd",pMap);
		return result;
	}
	//─────[ 등록된 거래처 조회하기 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> mk_list(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"mk_list", pMap);
		return list;
	}
	
	
	
	
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	
	
	
	/* 비품구매 */
	
	
	//─────[ 구매가능내역에서 비품구매 신청하기 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> purc_ask(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"purc_ask", pMap);
		return list;
	}
	//─────[ 구매가능내역에서 비품구매 신청 수정하기 (취소포함) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int purc_askUpd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"purc_askUpd",pMap);
		return result;
	}
	//─────[ 비품구매신청내역 조회하기 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int purc_askList(Map<String, Object> pMap) {
		result = sqlSession.delete(nameSpace+"purc_askList",pMap);
		return result;
	}
	//[결재권자]
	//─────[ 비품구매신청내역 결재하기 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int purc_sign(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"purc_sign",pMap);
		return result;
	}
	
	
	
	
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	
	


	/* 비품입고처리 및 입고비품관리 */
	
	
	//─────[ 입고비품내역에서 입출가능한 비품 조회하기 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> inb_eqList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"inb_eqList", pMap);
		return list;
	}
	//─────[ 비품입출신청내역에 비품입출 신청하기 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int inb_ask(Map<String, Object> pMap) {
		result = sqlSession.insert(nameSpace+"inb_ask",pMap);
		return result;
	}
	//─────[ 비품입출신청내역에서 신청 수정하기(취소포함) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int inb_askUpd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"inb_askUpd",pMap);
		return result;
	}
	//[결재권자]
	//─────[ 비품입출신청내역의 신청 결재하기 (기각|승인) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int inb_sign(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"inb_sign",pMap);
		return result;
	}
	//[결재권자]
	//─────[ 입고비품상태관리 프로시저로 처리하기 (수리반출|반입완료|폐기) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int inb_change(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"inb_change",pMap);
		return result;
	}
	
	
	
	
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	
	
	/* 조회 */
	// 모든 조회업무 쿼리가 개별쿼리로 준비되어있으므로 아래 두 작업은 의미가 없을 것.
	
	//─────[ 내가 신청한 결재내역 조회하기 (비품구매) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> ask_list(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"ask_list", pMap);
		return list;
	}
	//─────[ 내가 신청받은 결재요청 조회하기 (조건: 대기|승인|기각) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> sign_list(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"sign_list",pMap);
		return list;
	}
	
}
