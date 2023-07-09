package com.herbmall.zipcode.model;

import java.sql.SQLException;
import java.util.List;

import com.herbmall.member.model.MemberDAO;

public class ZipcodeService {

		private ZipcodeDAO zipcoDao; //종속객체=의존객체
		
		public ZipcodeService() {
			zipcoDao = new ZipcodeDAO();
		}
		
		public List<ZipcodeVO> selectZipcode(String dong) throws SQLException {
			return zipcoDao.selectZipcode(dong);
		}
}
