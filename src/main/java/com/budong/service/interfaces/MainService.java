package com.budong.service.interfaces;

import com.budong.model.dto.MemberDTO;

public interface MainService {
    public MemberDTO login(String id, String password);  //로그인 
    
    public boolean isAvailableId(String id); // 아이디 중복 확인

	public int insertMember(MemberDTO dto); // 회원 등록 
}