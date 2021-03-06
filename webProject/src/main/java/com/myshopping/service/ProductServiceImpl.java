package com.myshopping.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myshopping.domain.CommentVO;
import com.myshopping.domain.Criteria;
import com.myshopping.domain.OrderProductVO;
import com.myshopping.domain.ProductCommentVO;
import com.myshopping.domain.ProductVO;
import com.myshopping.mapper.CommentMapper;
import com.myshopping.mapper.ProductImageMapper;
import com.myshopping.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {
	
	
	@Setter(onMethod_ = {@Autowired})
	private ProductMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private CommentMapper commentMapper;
	
	@Setter(onMethod_ = {@Autowired})
	private ProductImageMapper imageMapper;
	
	@Transactional
	@Override
	public void Register(ProductVO product) {
		mapper.insertSelectKey(product);
		
		if(product.getImageList() == null || product.getImageList().size() <= 0) {
			return;
		}
		
		product.getImageList().forEach(image -> {
			image.setProduct_code(product.getProduct_code());
			imageMapper.insert(image);
		});
	}

	@Override
	public ProductVO get(Long product_code) {
		return mapper.read(product_code);
	}

	@Override
	public boolean modify(ProductVO product) {
		return mapper.update(product) == 1;
	}

	@Override
	public boolean remove(Long product_code) {
		return mapper.delete(product_code) == 1;
	}
	
	@Override
	public List<ProductVO> getBestListHome() {
		return mapper.readBestProductHome();
	}
	
	@Override
	public List<ProductVO> getCtgrList(String product_ctgr, Criteria cri) {
		return mapper.readCategori(product_ctgr, cri);
	}

	@Override
	public List<ProductVO> getBestList(String product_ctgr) {
		return mapper.readBestProduct(product_ctgr);
	}

	@Override
	public List<ProductVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public int updateProductStock(OrderProductVO op) {
		return mapper.updateProductStock(op);
	}

	@Override
	public int updateProductSales(OrderProductVO op) {
		return mapper.updateProductSales(op);
	}

	@Override
	public List<CommentVO> getCommentByProduct(Long product_code) {
		return commentMapper.getCommentByProduct(product_code);
	}

	@Override
	public int getTotalCount(String product_ctgr, Criteria cri) {
		return mapper.getTotalCount(product_ctgr, cri);
	}

	@Override
	public List<ProductVO> search(String product_name, @Param("cri") Criteria cri) {
		return mapper.search(product_name, cri);
	}

	@Override
	public int getSearchCount(String product_name, Criteria cri) {
		return mapper.getSearchCount(product_name, cri);
	}
	

}
