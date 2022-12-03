package com.reservation.knpr2211.service;



import javax.servlet.http.HttpSession;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;



import com.reservation.knpr2211.entity.Favorite;

import com.reservation.knpr2211.entity.User;
import com.reservation.knpr2211.repository.FavoriteRepository;
import com.reservation.knpr2211.repository.UserRepository;


@Service
public class UserService {

	@Autowired
	UserRepository userRepository;
	@Autowired 
	FavoriteRepository fr;
	@Autowired
	HttpSession session;
	@Autowired
	MountainCodeService mcs;
	 

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

		if(session.getAttribute("REauthStatus").toString().equals("false")) {
			
			return "이메일을 인증해주세요.";
		};
		
		boolean kakao = false;
			
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String securePw = encoder.encode(pw);
		
		User entity = User.builder().id(id).pw(securePw).name(name).email(email).mobile(mobile).member(member).deleted(false).kakao(kakao).build();
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
		
		boolean kakao = true;
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String securePw = encoder.encode(pw);
		
		User entity = User.builder().id(id).pw(securePw).name(name).email(email).mobile(mobile).member(member).deleted(false).kakao(kakao).build();
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
			boolean resultMobile = mobile.matches("\\d{3}\\d{3,4}\\d{4}");
		
			
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
			
			if(session.getAttribute("ModiAuthStatus").toString().equals("false")) {
				
				return "이메일을 인증해주세요.";
			};
			
			
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			String securePw = encoder.encode(pw);
			
			User entity = ur.findByid(id); 
			
			entity.setPw(securePw);
			entity.setName(name);
			entity.setMobile(mobile);
			entity.setEmail(email);
			
			ur.save(entity);
			
			userRepository.save(entity);
			session.setAttribute("msg", "");
			return "회원정보 수정 성공";
		}
		
		@Autowired UserRepository ur;
		//비밀번호 찾기 비밀번호 수정 
			public String idFindPwChange(String id, String pw, String pwcon, String name, String email, String mobile,
					String member) {
			
				if (pw == null || pw.isEmpty())
					return "비밀번호를 입력하세요.";
				
				if (pw.equals(pwcon)==false)
					return "비밀번호가 일치하지않습니다.";

			
				
				boolean resultPw = pw.matches("[a-zA-Z0-9@$!%*#?&]{4,20}");
				boolean resultPwCon = pwcon.matches("[a-zA-Z0-9@$!%*#?&]{4,20}");
			
				
				if(resultPw==false) {
					
					return"비밀번호는 4~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
				}
				if(resultPwCon==false) {
								
					return"비밀번호는 4~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
							}
				
				
				BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
				
				String securePw = encoder.encode(pw);
				
				User entity = ur.findByid(id); 
						
				entity.setPw(securePw);
				
				 System.out.println(entity.getPw());
				
				ur.save(entity);
				session.setAttribute("msg", "");
				return "비밀번호 수정 성공";
			}
	
	// 로그인
	public String login(String id, String pw) {
		String msg = "";
		
		
		
		if(id == null || id== "") {
			msg = "아이디를 입력해 주세요.";	
			return msg;
		}
		
		if( pw==null || pw== "") {
			msg = "비밀번호를 입력해 주세요.";	
			
			return msg ;
		}
		User user = userRepository.findByid(id);
		
		if (user == null) {
			
			msg = "없는 계정입니다.";
			
			return msg;
			
		}if(user.getDeleted() == true) {
			
			msg = "삭제된 아이디 입니다";
			
			return msg;
		}

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if (encoder.matches(pw, user.getPw())) {
			
			session.setAttribute("id", user.getId());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("mobile", user.getMobile());
			session.setAttribute("name", user.getName());
			session.setAttribute("member", user.getMember());
			session.setAttribute("kakao", user.getKakao());
			if(user.getMember().equals("admin")) {
				
				msg = "어드민 계정 로그인 성공";
				
			}else if(user.getMember().equals("normal")) {
			
				msg = "회원 로그인 성공";
				
			}
			return msg;
			
			
		}

		return "아이디 또는 비밀번호를 확인하세요.";
	}

	// 아이디 중복체크
	public String IdConfirm(String id) {


		boolean result = id.matches("[a-z]{1}[a-z0-9_-]{4,16}");
		
		if(result==false) {
			
			return"아이디는 5~20자의 소문자,숫자,특수기호(_),(-)만 사용 가능합니다.";
		}
		
		System.out.println("아이디 : "+ userRepository.findById(id));
		
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
	// 비밀번호 찾기 이메일 찾
	public String FindByEmail(String id) {
	
		User Email = userRepository.findByid(id);
		
		if(Email.getEmail() == null) {
			
			return "이메일이 없습니다.";
		}
	
		return Email.getEmail();
	}
	// 아이디 찾기 카카오 멤버찾기
	public String FindKakaoMember(String id) {
	
		User member = userRepository.findByid(id);
		System.out.println("멤버를 받아? " + member.getMember());
		boolean kakao = member.getKakao();
			if(kakao == true) {
				
				return "카카오";
			}
			else
		
		return "normal";
	}
	
	//아이디 찾기 이메일 찾기
	public String FindByEmail2(String email) {
			
		User FindEmail = userRepository.findByEmail(email);
		
		if(FindEmail == null) {
			
			
			return "이메일 등록안됨";
			
		}
		
			return email;
		}
	
	
	
	// 아이디 중복체크
		public String PwConfirm(String pw , String pwcon) {
			System.out.println(pw);
			System.out.println(pwcon);
			if (pw.equals(pwcon))
				return "비밀번호가 일치합니다.";

			

			return "비밀번호가 일치하지 않습니다.";
		}
		// (시작)작성자:공주원 ==============================================
		//즐겨찾기 리스트
		public String favoriteList(Model model) {
			
			if(session.getAttribute("id")==null) return "redirect:login";
			
			User entity = userRepository.findByid((String)session.getAttribute("id"));
			List<Favorite> list = fr.findByFavoriteAndChecked(entity,true);
			
			
			ArrayList<String> strTypes = new ArrayList<String>();
			ArrayList<String> strFavorites= new ArrayList<String>();
			ArrayList<String> parkDetails= new ArrayList<String>();
			
			for(Favorite f : list) {
				String type = mcs.findCategory(f.getPlace().substring(0,1));
				String cat2 = mcs.findCategory(f.getPlace().substring(0,3));
				String cat3 = "";
				String parkDetail = f.getPlace();
				if(f.getPlace().substring(0,1).equals("C")) {
					cat3 = cat2+"  "+type;
				}
				else { cat3 = "[ "+cat2+" ]  "+mcs.findCategory(f.getPlace())+type; }
				
				strTypes.add(type);				
				strFavorites.add(cat3);	
				parkDetails.add(parkDetail);	
			}
			
			model.addAttribute("types",strTypes);
			model.addAttribute("favorites",strFavorites);
			model.addAttribute("parkDetails",parkDetails);
			return "user/favorite";
			
		}
		
		
		// (끝)작성자:공주원 ==============================================		
		

	
}
