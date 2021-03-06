package com.myshopping.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myshopping.domain.CommentVO;
import com.myshopping.domain.Criteria;
import com.myshopping.domain.OrderProductVO;
import com.myshopping.domain.ProductCommentVO;
import com.myshopping.domain.ProductVO;

public interface ProductService {
	
	public void Register(ProductVO product);
	
	public ProductVO get(Long product_code);
	
	public boolean modify(ProductVO product);
	
	public boolean remove(Long product_code);
	
	public List<ProductVO> getCtgrList(String product_ctgr, Criteria cri);
	
	public List<ProductVO> getBestListHome();
	
	public List<ProductVO> getBestList(String product_ctgr);
	
	public List<ProductVO> getList();
	
	public int updateProductStock(OrderProductVO op);	

	public int updateProductSales(OrderProductVO op);
	
	public List<CommentVO> getCommentByProduct(Long product_code);
	
	public int getTotalCount(String product_ctgr, Criteria cri);
	
	public List<ProductVO> search(String product_name, @Param("cri") Criteria cri);
	
	public int getSearchCount(String product_name, Criteria cri);
}
