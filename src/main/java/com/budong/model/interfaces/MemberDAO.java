package com.budong.model.interfaces;

import com.budong.model.dto.MemberDTO;

public interface MemberDAO {
	public MemberDTO login(MemberDTO dto);

	public int insertMember(MemberDTO dto);
}
