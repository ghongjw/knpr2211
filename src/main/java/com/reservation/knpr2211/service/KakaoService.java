package com.reservation.knpr2211.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoService {

	
		public String getAccessToken(String code) {
			
			String accessToken ="";
			String reqURL = "https://kauth.kakao.com/oauth/token";
			
			try {
				String sendMessage = "grant_type=authorization_code" + 
							"&client_id=e5fa46a8c18f4ae8b3ac752e87f63927"
						+ "&redirect_uri=http://localhost/KakaoLogin" + "&code=" + code;

				URL url = new URL(reqURL); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST"); // POST 요청을 위해 기본값 false에서 setDoOutput을 true로 변경
				conn.setDoOutput(true); // POST 메소드를 이용해서 데이터를 전달하기 위한 설정

				// 기본 outputStream을 통해 문자열로 처리할 수 있는 OutPutStreamWriter 변환 후 처리속도를 빠르게 하기위한
				// BufferedWriter로 변환해서 사용한다.
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				bw.write(sendMessage);
				bw.flush();

				int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
				System.out.println("responseCode : " + responseCode);

				// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "", result = "";
				while ((line = br.readLine()) != null) {
					result += line;
				}

			
				System.out.println("response body : " + result);
//				System.out.println("result.split : " + result.split(","));

				// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
				JsonElement element = JsonParser.parseString(result);
				
				accessToken = element.getAsJsonObject().get("access_token").getAsString();
				System.out.println("access_token : " + accessToken);

//				responseCode : 200
//				response body : {"access_token":"gfRKUMfjiD2LVY5goY9gb39OD8wzDHjuGqf65cdhCj11mwAAAYQNtGhg","token_type":"bearer","refresh_token":"TYlOktaG8ROPWAO_eWZ520niqVEELOr3iUgzCt1sCj11mwAAAYQNtGhe","expires_in":21599,"scope":"account_email profile_image profile_nickname","refresh_token_expires_in":5183999}
//				access_token : gfRKUMfjiD2LVY5goY9gb39OD8wzDHjuGqf65cdhCj11mwAAAYQNtGhg
				
				br.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
				
			
			return accessToken;
		}
		@Autowired HttpSession session;
		public HashMap<String, String> getUserInfo(String accessToken) {
			HashMap<String, String> userInfo = new HashMap<String, String>();
			String reqURL = "https://kapi.kakao.com/v2/user/me";

			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");

				// 요청에 필요한 Header에 포함될 내용
				conn.setRequestProperty("Authorization", "Bearer " + accessToken);

				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);

				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body : " + result);
				/*
				 * { "id":2346534020, "connected_at":"2022-07-18T10:58:52Z",
				 * "properties":{"nickname":"김연수"}, "kakao_account":{
				 * "profile_nickname_needs_agreement":false, "profile":{"nickname":"김연수"},
				 * "has_email":true, "email_needs_agreement":false, "is_email_valid":true,
				 * "is_email_verified":true, "email":"kyes0222@gmail.com" } }
				 */
				JsonElement element = JsonParser.parseString(result);
//		        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//		        String nickname = properties.getAsJsonObject().get("nickname").getAsString();

				JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
				JsonObject profile = kakao_account.get("profile").getAsJsonObject();
				String nickname = profile.get("nickname").getAsString();
				String email = kakao_account.get("email").getAsString();
				String birth = kakao_account.get("birthday").getAsString();
				String gender = kakao_account.get("gender").getAsString();
				
				
				
				
				userInfo.put("nickname", nickname);
				userInfo.put("email", email);
				userInfo.put("birthday", birth);
				userInfo.put("gender", gender);
				

		
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			return userInfo;
		}
		/*
		  	연결 끊기를 하면 로그아웃까지 진행됨.(동의항목 철회)
			https://developers.kakao.com/docs/latest/ko/kakaologin/common#link-and-unlink
			연결끊기
			https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#logout
		*/
		public void unlink(String accessToken) {
			String reqURL = "https://kapi.kakao.com/v1/user/unlink";
			URL url;
			try {
				url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");
				// 요청에 필요한 Header에 포함될 내용
				conn.setRequestProperty("Authorization", "Bearer " + accessToken);
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

}
