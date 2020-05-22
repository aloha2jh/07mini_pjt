package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;
 
@Controller
@RequestMapping("/product/*")
public class ProductController {
	 
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
 		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit; 
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	//addProductView
	@RequestMapping( method=RequestMethod.GET )
	public String addUProduct() throws Exception {
  
		return "redirect:/product/addProductView.jsp";
	}
	
	
	//addProduct
	@RequestMapping( method=RequestMethod.POST )
	public String addProduct( @ModelAttribute("product") Product product , Model model ) throws Exception {
		
		Product prod = product; 
		prod.setProdTranCode("000");
		prod.setManuDay(prod.getManuDay().substring(2,10));
		productService.addProduct(product); 
		
		model.addAttribute("pvo", prod);
		return "forward:/product/addedView.jsp";
	}
	
	
	// getProduct
	@RequestMapping(method=RequestMethod.GET )
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model, @RequestParam("menu") String menu ) throws Exception {
		  
		Product prod = productService.getProduct(prodNo); 
		
		model.addAttribute("menu",menu);
		model.addAttribute("pvo", prod); // Model �� View ����
		
		return "forward:/product/getProduct.jsp";
	}
	
	// updateProduct
	@RequestMapping 
	public String updateProductView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{ 
		Product prod = productService.getProduct(prodNo); 
		model.addAttribute("pvo", prod);   
		return "forward:/product/updateProduct.jsp";
	}
	 
	// updateProduct
	@RequestMapping 
	public String updateProduct( @ModelAttribute("pvo") Product product , Model model ) throws Exception{
		
		Product prod = product;
		prod.setManuDay(prod.getManuDay().replace("-",""));
		
		productService.updateProduct(product);
		 
		//return "redirect:/getProduct.do?prodNo="+product.getProdNo();

		model.addAttribute("pvo", prod);
		return "forward:/product/addedView.jsp";
	}
 
 
	
	
	//(O) 
	public String listProduct( @ModelAttribute("search") Search search , Model model , 
							@RequestParam("menu") String menu,
							HttpServletRequest request) throws Exception{
		
		//�޾ƿ��� �޴���.  
		System.out.println("[]�޴���:"+menu);
		
		// ���� ������
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// ����Ʈ�޾ƿ���
		Map<String , Object> map = productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		// Model �� View ����
		model.addAttribute("map", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		return "forward:/product/listProduct.jsp";
	}
}