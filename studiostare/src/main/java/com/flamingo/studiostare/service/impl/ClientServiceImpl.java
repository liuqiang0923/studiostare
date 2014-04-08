package com.flamingo.studiostare.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flamingo.studiostare.dao.IClientDao;
import com.flamingo.studiostare.entity.ClientEntity;
import com.flamingo.studiostare.service.IClientService;

@Service("clientService")
public class ClientServiceImpl implements IClientService {

	@Autowired
	private IClientDao clientDao;
	
	@Override
	public ClientEntity getById(int id){
		return clientDao.selectClientById(id);
	}
	
	@Override
	public List<ClientEntity> getAll(){
		return clientDao.selectClient(new ClientEntity());
	}

	@Override
	public void delById(int id){
		clientDao.deleteClientById(id);
	}

	@Override
	public void save(ClientEntity clientEntity){
		int id = clientEntity.getId();
		Date now = new Date();
		clientEntity.setUpdateTime(now);
		if(id == 0 || getById(id) == null)
			clientDao.insertClient(clientEntity);
		else
			clientDao.updateClient(clientEntity);
	}

}
