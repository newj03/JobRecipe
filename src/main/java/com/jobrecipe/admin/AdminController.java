package com.jobrecipe.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jobrecipe.admin.service.AdminService;
import com.jobrecipe.admin.vo.AdvertiseVO;
import com.jobrecipe.admin.vo.CompanyVO;

@RequestMapping("/admin/*")
@Controller
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@RequestMapping(value="/insertCompanyForm.do")
	public String insertCompanyForm() { //�쉶�궗 異붽� �럹�씠吏�濡� �씠�룞
		return "admin/insert_company";
	}
	
	@RequestMapping(value="/selectCompany.do")
	public String selectCompany(String c_name, Model m) { //�쉶�궗紐� 寃��깋
		CompanyVO vo = adminService.selectCompanyOne(c_name);
		
		m.addAttribute("vo", vo);
		return "admin/insert_company";
	}
	
	@RequestMapping(value="/insertCompany.do")
	public @ResponseBody String insertCompany(CompanyVO vo) { //�쉶�궗 異붽�
		String aa = "yes"; //�쉶�궗紐� 議댁옱�븯�뒗吏� �븳踰� �뜑 �솗�씤 �뿬遺�
		String cName = adminService.selectCompanyName(vo.getC_name());
	
		if(cName == null)
			adminService.insertCompany(vo);
		else if(vo.getC_name().equals(cName))
			aa = "no";
		return aa;
	}
	
	@RequestMapping(value="/updateCompany.do")
	public String updateCompany(CompanyVO vo) { //�쉶�궗 �닔�젙
		adminService.updateCompany(vo);
		
		return "admin/insert_company";
	}
	
	@RequestMapping(value="/deleteCompany.do")
	public String deleteCompany(String c_name) { //�쉶�궗 �궘�젣
		adminService.deleteCompany(c_name);
		
		return "admin/insert_company";
	}
	
	@RequestMapping(value="/insertAdvertiseForm.do")
	public String insertAdvertiseForm(String c_name, Model m) { //怨듦퀬 異붽� �럹�씠吏�濡� �씠�룞
		m.addAttribute("c_name", c_name);
		
		return "admin/insert_advertise";
	}
	
	@RequestMapping(value="/insertAdvertise.do")
	public String insertAdvertise(HttpServletRequest request, RedirectAttributes rttr, Model m) {
		String ad_title = request.getParameter("ad_title");
		String ad_name = request.getParameter("ad_name");
		String ad_date = request.getParameter("ad_date");
		String ad_job = request.getParameter("ad_job");
		String[] ad_carrBae = request.getParameterValues("ad_carrBae");
		String ad_carr = "";
		if(ad_carrBae.length == 1)
			ad_carr = ad_carrBae[0];
		else {
			for(int i=1; i<ad_carrBae.length; i++) {
				ad_carr = ad_carrBae[0];
				ad_carr = ad_carr + ", " + ad_carrBae[i];
			}
		}
		String ad_emp = request.getParameter("ad_emp");
		String ad_skill = request.getParameter("ad_skill");
		String ad_upmu = request.getParameter("ad_upmu");
		String ad_lien = "";
		for(int i=1; i<6; i++) {
			if(request.getParameter("lien"+i) != null)
				if(!request.getParameter("lien"+i).equals(""))
				ad_lien = ad_lien + request.getParameter("lien"+i) + "#";
		}
		String ad_deals = "";
		for(int i=1; i<6; i++) {
			if(request.getParameter("deal"+i) != null)
				if(!request.getParameter("deal"+i).equals(""))
				ad_deals = ad_deals + request.getParameter("deal"+i) + "#";
		}
		String ad_pro = request.getParameter("ad_pro");
		String ad_cp = "";
		for(int i=1; i<6; i++) {
			if(request.getParameter("cp"+i) != null)
				if(!request.getParameter("cp"+i).equals(""))
				ad_cp = ad_cp + request.getParameter("cp"+i) + "#";
		}
		String ad_ect = "";
		for(int i=1; i<6; i++) {
			if(request.getParameter("ect"+i) != null)
				if(!request.getParameter("ect"+i).equals(""))
				ad_ect = ad_ect + request.getParameter("ect"+i) + "#";
		}
		
		AdvertiseVO vo = new AdvertiseVO(ad_name, ad_title, ad_date, ad_job, ad_carr, ad_emp, ad_skill, ad_upmu, ad_lien, ad_deals, ad_pro, ad_cp, ad_ect);
		adminService.insertAdvertise(vo);
		
		rttr.addFlashAttribute("msg", "success");
		rttr.addAttribute("c_name", ad_name);
		
		return "redirect:/admin/insertAdvertiseForm.do";
	}
	


}
