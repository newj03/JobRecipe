package com.jobrecipe.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jobrecipe.user.service.UserServiceImpl;
import com.jobrecipe.user.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private JavaMailSender mailSender;

	@Resource(name = "UserService")
	private UserServiceImpl userService;
	
	/*
	 *** 회원가입 ***
	 */
	
	//회원가입 버튼을 누르면 회원가입 페이지로 이동
	@RequestMapping(value = "/sign_up.do")
	public String signUpForm() {
		return "users/sign_up";
	}
	
	
	//이메일 중복 체크
	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public int emailCheck(@RequestParam("u_email") String u_email) {
		return userService.userEmailCheck(u_email);
	}
	
	/* 
	 * 회원가입 메인에서 다음을 누르면 설문조사 페이지로 이동하며,
	 * red_users 테이블에 회원 정보 저장
	 * 다음 프로필 정보 입력 관련 페이지는 ProfileController에서 처리
	 */
	@RequestMapping(value = "/signupMember.do")
	public String signupMember(UserVO userVO, Model model) {
		userService.signupMember(userVO);
		model.addAttribute("u_no", userVO.getU_no());
		//model.addAttribute("userVO", userVO);
		return "wizard/signup_questionnaire";
	}
	

	/*
	 * 이메일 인증에 성공하면 로그인이 된 상태로 메인 페이지로 넘어간다.
	 * 실패시 js로 실패 메시지 안내
	 * 유저 구분을 위해 토큰 필요
	 */
	@RequestMapping(value = "/authEmail.do")
	public String authEmail() {
		return "main";
	}
	
	// 로그인 페이지로 이동
	@RequestMapping(value = "/sign_in.do")
	public String signinForm() {
		return "users/sign_in";
	}

	// 로그인
	@RequestMapping(value = "/signinCheck.do")
	public String login(UserVO vo, HttpServletRequest request, RedirectAttributes rttr, HttpSession session)
			throws Exception {
		
		session = request.getSession();
		
		UserVO login = userService.signinCheck(vo);
		
		if (login == null) {
			session.setAttribute("login", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/sign_in.do";
		} else {
			
			if(login.getU_email().equals("admin@jobrecipe.com")) {
				return "admin/insert_company";
			} else {
				session.setAttribute("login", login);
				session.setAttribute("u_email", login.getU_email());
				return "redirect:/";
			}
		}			
	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session) throws ClassNotFoundException, SQLException {
		userService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("msg", "logout");
		return "redirect:/hire/Search_Job.do";
	}

	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "/findPw.do")
	public String newPwForm(UserVO vo1) {
		return "users/password/new";
	}

	/*
	 * 비밀번호 찾기 페이지에서 이메일 입력 후 비밀번호 찾기 버튼 눌렀을시 성공하면 메일을 보낸 후 로그인 페이지로 이동, 실패하면 js로 실패
	 * 메시지 안내
	 */
	@RequestMapping(value = "sendNewPwMail.do")
	public String sendNewPwMail() {
		return "users/sign_in";
	}

	// 회원의 이메일로 보내진 새 비밀번호 설정 페이지의 링크를 눌렀을시 아래 메소드를 통해 이동
	@RequestMapping(value = "editPw.do")
	public String editPwForm() {
		return "users/password/edit";
	}

	//비밀번호 찾기 처리 (1) 이메일 발송
    @RequestMapping(value = "find_pass.do", method = RequestMethod.POST)
    public ModelAndView find_pass(HttpServletRequest request, String u_email,
            HttpServletResponse response_email) throws IOException{
        
        //랜덤한 난수 (인증번호)를 생성해서 이메일로 보내고 그 인증번호를 입력하면 비밀번호를 변경할 수 있는 페이지로 이동시킴
    	response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		
    	String tomail = request.getParameter("u_email");    //받는 사람의 이메일
        int checkNum = userService.findEmail(tomail);
    	
    	if(checkNum == 1) {
    		Random r = new Random();
    		int dice = r.nextInt(157211)+48271;
    		
    		String setfrom = "wjdrndkel@gmail.com";
    		String title = "비밀번호 찾기 인증 이메일 입니다.";    //제목
    		String content =
    				
    				System.getProperty("line.separator")+
    				
    				System.getProperty("line.separator")+
    				
    				"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
    				
                +System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
                
                "비밀번호 찾기 인증번호는 " +dice+ " 입니다. "
                
                +System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
                
                "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
    		
    		try {
    			MimeMessage message = mailSender.createMimeMessage();
    			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    			
    			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
    			messageHelper.setTo(tomail); // 받는사람 이메일
    			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
    			messageHelper.setText(content); // 메일 내용
    			
    			mailSender.send(message);
    			
    		} catch (Exception e) {
    			System.out.println(e);
    		}
    		
    		mv.setViewName("/users/pass_email");     //뷰의이름
    		mv.addObject("dice", dice);
    		mv.addObject("u_email", u_email);
    		
    		System.out.println("mv : "+mv);
    		
    		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
    		out_email.flush();
    			
    		return mv;
    		
    	} else {
    		mv.setViewName("/users/password/new");
    		
    		out_email.println("<script>alert('등록되지 않은 이메일입니다. 이메일을 다시 입력해주세요.');</script>");
    		out_email.flush();
    		
    		return mv;
    	}
    }

    //인증번호를 입력한 후에 확인 버튼을 누르면 자료가 넘어오는 컨트롤러
    @RequestMapping(value = "pass_injeung.do{dice},{u_email}", method = RequestMethod.POST)
        public ModelAndView pass_injeung(String pass_injeung, @PathVariable String dice, @PathVariable String u_email, 
                HttpServletResponse response_equals) throws IOException{
        
        System.out.println("마지막 : pass_injeung : "+pass_injeung);
        
        System.out.println("마지막 : dice : "+dice);
        
        ModelAndView mv = new ModelAndView();
      
        mv.setViewName("/users/pass_change");
        
        mv.addObject("u_email",u_email);
        
        if (pass_injeung.equals(dice)) {
            
            //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 비밀번호 변경창으로 이동시킨다
        
            mv.setViewName("users/pass_change");
            
            mv.addObject("u_email",u_email);
            
            //만약 인증번호가 같다면 이메일을 비밀번호 변경 페이지로 넘기고, 활용할 수 있도록 한다.
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
            out_equals.flush();
    
            return mv;
  
        }else if (pass_injeung != dice) {

            ModelAndView mv2 = new ModelAndView(); 
            
            mv2.setViewName("users/pass_email");
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
            out_equals.flush();

            return mv2;
        }    
        return mv;  
    }
    
    //변경할 비밀번호를 입력한 후에 확인 버튼을 누르면 넘어오는 컨트롤러
    @RequestMapping(value = "pass_change.do{u_email}", method = RequestMethod.POST)
    public ModelAndView pass_change(UserVO vo, HttpServletResponse pass) throws Exception{
    	
    System.out.println(vo);

    userService.pass_change(vo);
    
    ModelAndView mv = new ModelAndView();
    
    mv.setViewName("users/sign_in");
    
    return mv;
                
    }
    
	// 회원 탈퇴 get
	@RequestMapping(value="/memberDelete.do", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		return "/users/memberDeleteView";
	}
    
    //회원탈퇴
	@RequestMapping(value = "/memberDelete.do")
	public String memberDelete(UserVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		UserVO user = (UserVO) session.getAttribute("login");
		String sessionPw = user.getU_pw();
		String voPw = vo.getU_pw();
		
		if(!(sessionPw.equals(voPw))) {
			rttr.addFlashAttribute("msg",false);
			return "/users/memberDelteView";
		}
		userService.memberDelete(user);
		session.invalidate(); 
		return "redirect:/hire/Search_Job.do";
	}
	
}
