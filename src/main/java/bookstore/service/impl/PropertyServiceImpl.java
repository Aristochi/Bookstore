package bookstore.service.impl;

import org.springframework.stereotype.Service;

import bookstore.mapper.PropertyMapper;
import bookstore.pojo.PropertyExample;
import bookstore.service.PropertyService;

@Service
public class PropertyServiceImpl extends BaseServiceImpl<PropertyMapper,PropertyExample> implements PropertyService {
 
}