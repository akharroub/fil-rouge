package com.afpa.cda.service;

import java.util.List;
import java.util.Optional;

import com.afpa.cda.dto.VipDto;
import com.afpa.cda.entity.User;


public interface IVipService {

	List<VipDto> findAll();

	VipDto add(VipDto vip);

	boolean updateVip(VipDto vip, int id);

	VipDto findById(int id);

	boolean deleteVip(int id);
	
}
