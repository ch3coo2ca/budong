package com.budong.model;

import com.budong.model.dto.MemberDTO;
import com.budong.model.interfaces.MemberDAO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private final SqlSessionTemplate mybatis;

	@Autowired
	public MemberDAOImpl(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public MemberDTO login(MemberDTO dto) {
		return mybatis.selectOne("com.budong.model.interfaces.MemberDAO.login", dto);
	}

	public int insertMember(MemberDTO dto) {
		return mybatis.insert("com.budong.model.interfaces.MemberDAO.insertMember", dto);
	}
}
