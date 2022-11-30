package com.reservation.knpr2211.service;


import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.entity.User;
import com.reservation.knpr2211.repository.UserRepository;


@Service
public class UserService {

	@Autowired
	UserRepository userRepository;
	@Autowired
	HttpSession session;
	
	// 회원가입
	public String register(String id, String pw, String pwcon, String name, String email, String mobile,
			String member) {
	

		boolean resultPw = pw.matches("[a-zA-Z0-9@$!%*#?&]{4,20}");
		boolean resultPwCon = pwcon.matches("[a-zA-Z0-9@$!%*#?&]{4,20}");
		boolean resultName = name.matches("[가-힣]{2,5}");
		boolean resultEmail = email.matches("[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}");
		boolean resultMobile = mobile.matches("\\d{3}\\d{3,4}\\d{4}");
		
		if(resultPw==false) {
			
			return"비밀번호는 4~20자의 영문 소문자, 숫자와 특수문자만 사용 가능합니다.";
		}
		if(resultPwCon==false) {
						
			return"비밀번호는 4~20자의 영문,숫자와 특수문자만 사용 가능합니다.";
					}
		if(resultName==false) {
			
			return"이름은 한글만 사용 가능합니다.";
		}
		if(resultEmail==false) {
			
			return"이메일을 다시 입력바랍니다.";
		}
		if(resultMobile==false) {
			
			return"휴대폰 형식에 맞춰주시기 바랍니다.";
		}
		
		if (id == null || id.isEmpty()) {
			
			
			
			return "아이디를 입력하세요.";
		}
			

		if (pw == null || pw.isEmpty())
			return "비밀번호를 입력하세요.";
		
		if (pw.equals(pwcon)==false)
			return "비밀번호가 일치하지않습니다.";

	
		if (name == null || name.isEmpty())
			return "이름을 입력하세요.";

		if (email == null || email.isEmpty())
			return "이메일을 입력하세요.";
		
		if (mobile == null || mobile.isEmpty())
			return "연락처를 입력하세요.";

		if(session.getAttribute("REauthStatus").toString().equals("true")) {
			
			return "이메일을 인증해주세요.";
		};
			
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
//		String securePw = encoder.encode(pw);
		
		User entity = User.builder().id(id).pw(pw).name(name).email(email).mobile(mobile).member(member).build();
		userRepository.save(entity);
		session.setAttribute("msg", "");
		return "회원가입 성공";
	}
	
	// 카카오 회원가입
	public String kakaoRegister(String id, String pw, String name, String email, String mobile,
			String member) {
		if (id == null || id.isEmpty())
			return "아이디를 입력하세요.";

		if (pw == null || pw.isEmpty())
			return "비밀번호를 입력하세요.";
		
	
		if (name == null || name.isEmpty())
			return "이름을 입력하세요.";

		if (email == null || email.isEmpty())
			return "이메일을 입력하세요.";
		
		if (mobile == null || mobile.isEmpty())
			return "연락처를 입력하세요.";
		

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String securePw = encoder.encode(pw);
		
		User entity = User.builder().id(id).pw(securePw).name(name).email(email).mobile(mobile).member(member).build();
		userRepository.save(entity);

		return "회원가입 성공";
	}
	
	

	// 회원정보 수정 
		public String UserModify(String id, String pw, String pwcon, String name, String email, String mobile,
				String member) {
		
			if (pw == null || pw.isEmpty())
				return "비밀번호를 입력하세요.";
			
			if (pw.equals(pwcon)==false)
				return "비밀번호가 일치하지않습니다.";

		
			if (name == null || name.isEmpty())
				return "이름을 입력하세요.";

			if (email == null || email.isEmpty())
				return "이메일을 입력하세요.";
			
			if (mobile == null || mobile.isEmpty())
				return "연락처를 입력하세요.";
			
			boolean resultPw = pw.matches("[a-zA-Z0-9@$!%*#?&]{4,20}");
			boolean resultPwCon = pwcon.matches("[a-zA-Z0-9@$!%*#?&]{4,20}");
			boolean resultName = name.matches("[가-힣]{2,5}");
			boolean resultEmail = email.matches("[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}");
			boolean resultMobile = mobile.matches("\\d{3}-\\d{3,4}-\\d{4}");
		
			
			if(resultPw==false) {
				
				return"비밀번호는 4~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
			}
			if(resultPwCon==false) {
							
				return"비밀번호는 4~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
						}
			if(resultName==false) {
				
				return"이름은 한글만 사용 가능합니다.";
			}
			if(resultEmail==false) {
				
				return"이메일을 다시 입력바랍니다.";
			}
			if(resultMobile==false) {
				
				return"휴대폰 형식에 맞춰주시기 바랍니다.";
			}
			
			
			
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			String securePw = encoder.encode(pw);
			
			User entity = User.builder().id(id).pw(securePw).name(name).email(email).mobile(mobile).member(member).build();
			userRepository.save(entity);
			session.setAttribute("msg", "");
			return "회원정보 수정 성공";
		}
	
	// 로그인
	public String login(String id, String pw) {

		if (userRepository.findByid(id) == null) {
			System.out.println("찾았다?");
			return "아이디를 입력하세요";
		}

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if (encoder.matches(pw, userRepository.findByid(id ).getPw())) {
			
			session.setAttribute("name", userRepository.findByid(id).getName());
			session.setAttribute("id", userRepository.findByid(id).getId());
			session.setAttribute("email", userRepository.findByid(id).getEmail());
			session.setAttribute("mobile", userRepository.findByid(id).getMobile());
			
			return "로그인 성공";
		}

		return "아이디 또는 비밀번호를 확인하세요.";
	}

	// 아이디 중복체크
	public String IdConfirm(String id) {

		boolean result = id.matches("[a-z]{1}[a-z0-9_-]{5,16}");
		
		if(result==false) {
			
			return"아이디는 5~20자의 소문자,숫자,특수기호(_),(-)만 사용 가능합니다.";
		}
		
		if (userRepository.findByid(id) == null) {

			return "사용가능한 아이디입니다";
		}

		return "중복된 아이디 입니다.";
		

	}
	//이메일 체크
	public String Emailcheck(String email) {
	
	if(userRepository.findByEmail(email)==null) {
		
		return"사용가능한 이메일입니다. ";
	};
	
		
		
	return "중복된 이메일 입니다.";
	}

	
	//아이디 검색
	public String IdFind(String id) {
		
		if(id==null|| id=="") {
			
			return "아이디를 입력해주세요.";
			
		}
		
		if(userRepository.findByid(id)==null) {
		return "등록되지 않은 사용자입니다.";
		}
		
		
		return"성공";
	}
	
	public String FindById(String email) {
		
	String id = userRepository.findByEmail(email).getId();
		
		return id;
	}
	
	public String FindByEmail(String id) {
	
		String Email = userRepository.findByid(id).getEmail();
		session.setAttribute("FindName", userRepository.findByid(id).getName());
		session.setAttribute("FindId", userRepository.findByid(id).getId());
		session.setAttribute("FindEmail", userRepository.findByid(id).getEmail());
		session.setAttribute("FindMobile", userRepository.findByid(id).getMobile());
		return Email;
	}
	
	
	
}
