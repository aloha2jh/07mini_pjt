package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest; 

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
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService; 
 
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	 
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
 		
	public PurchaseController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit; 
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	

	// addPurchase View
	@RequestMapping  ( value="addProduct", method=RequestMethod.GET )
	public String addPurchase() throws Exception { 
		return "redirect:/product/addProductView.jsp";
	}
	
	// addPurchase
	@RequestMapping  ( value="addProduct", method=RequestMethod.POST )
	public String addPurchase( @ModelAttribute("purchase") Purchase purchase , Model model ) throws Exception {
		
		Purchase psvo = purchase;
		
		psvo.setTranCode("000"); 
		purchaseService.addPurchase(psvo); 
		
		model.addAttribute("psvo", psvo);
		
		return "forward:/product/addedView.jsp";
	}
 
	
	// getProduct)
	@RequestMapping("/getProduct.do")
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model, @RequestParam("menu") String menu ) throws Exception {
		  
		Product prod = purchaseService.getProduct(prodNo); 
		
		model.addAttribute("menu",menu);
		model.addAttribute("pvo", prod); // Model �� View ����
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping("/updateProductView.do")
	public String updateUserView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{ 
		Product prod = purchaseService.getProduct(prodNo); 
		model.addAttribute("pvo", prod);   
		return "forward:/product/updateProduct.jsp";
	}
	
	//(O) �ٵ� ��¥���� ^^ ��Ե��͵� �ǰ� �����ؾ���~~
	
	@RequestMapping("/updateProduct.do")
	public String updateUser( @ModelAttribute("pvo") Product product , Model model ) throws Exception{
		
		Product prod = product;
		prod.setManuDay(prod.getManuDay().replace("-",""));
		
		purchaseService.updateProduct(product);
		 
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
		Map<String , Object> map = purchaseService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		// Model �� View ����
		model.addAttribute("map", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		return "forward:/product/listProduct.jsp";
	}



}