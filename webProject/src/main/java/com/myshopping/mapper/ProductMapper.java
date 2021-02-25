package com.myshopping.mapper;

import java.util.List;

import com.myshopping.domain.ProductVO;

public interface ProductMapper {
	public List<ProductVO> getList();
	
	//pk값을 알필요 없는 경우와 알아야 하는 경우
	public void insert(ProductVO product);
	
	public void insertSelectKey(ProductVO product);
	
	//코드로 가져오기
	public ProductVO read(Long product_code);
	
	//카테고리로 가져오기
	public List<ProductVO> readCategori(String product_ctgr);
	
	//인기상품 조회
	public List<ProductVO> readBestProduct(String product_ctgr);
	
	public List<ProductVO> readBestProductHome();
	
	//삭제완료시 1, 없을시 0
	public int delete(Long product_code);
	
	public int update(ProductVO product);
}