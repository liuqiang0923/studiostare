package com.flamingo.studiostare.service;

import java.util.List;

import com.flamingo.studiostare.entity.ClientEntity;

public interface IClientService {
	
	ClientEntity getById(int id);
	
	List<ClientEntity> getAll();
	
	void delById(int id);
	
	void save(ClientEntity clientEntity);
	
}
