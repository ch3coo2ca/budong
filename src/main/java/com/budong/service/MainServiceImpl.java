package com.budong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.budong.model.dto.MemberDTO;
import com.budong.model.interfaces.MemberDAO;
import com.budong.service.interfaces.MainService;

@Service
public class MainServiceImpl implements MainService {
	private final MemberDAO memberDAO;

	@Autowired
	public MainServiceImpl(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	//아이디 중복 확인 
	@Override
	public boolean isAvailableId(String id) {
		// TODO Auto-generated method stub
		return false;
	}
	
	//회원 가입
	@Override
	public int insertMember(MemberDTO dto) {
		return memberDAO.insertMember(dto);
	}

	//로그인 
	@Override
	public MemberDTO login(String mem_id, String mem_pw) {
		MemberDTO dto = memberDAO.login(new MemberDTO(mem_id, mem_pw));

		if (mem_id.equals(dto.getMem_id()) && mem_pw.equals(dto.getMem_pw())) {
			return dto;
		} else {
			return null;
		}

	}
}
