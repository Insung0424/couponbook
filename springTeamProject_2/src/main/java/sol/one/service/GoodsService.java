package sol.one.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import sol.one.controller.Goods;



public interface GoodsService {

	    public Page<Goods> findByCategoryId(Integer categoryId, Pageable pageable);

	    public Goods findOne(String goodsId);
	}

