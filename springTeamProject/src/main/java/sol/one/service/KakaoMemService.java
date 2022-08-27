package sol.one.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.KakaoDTO;
import sol.one.mapper.MemMapper;

@Service
@Log4j
@RequiredArgsConstructor
public class KakaoMemService {
	
	private final MemMapper kmapper;
	
    public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=e90605fb64b5ed5eeffcf586eb651d12");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8080/member/kakaoLogin");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser(); 
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
    
    
    public KakaoDTO getUserInfo (String access_Token) {
    	System.out.println("---- KS:getUerInfo -----");
        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            //String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();

            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
            //userInfo.put("profile_image", profile_image);
            System.out.println("KMS: 128 " + userInfo);

        } catch (IOException e) {
            e.printStackTrace();
        }
        
        // 코드 추가
        KakaoDTO result = kmapper.findKakao(userInfo);
        
        //저장된 정보가 있는지 확인하는 코드
        if(result == null) {
        	kmapper.kakaoInsert(userInfo);
        	System.out.println("KS 138: 없는 사용자 ");
        	//정보 저장 후 컨트롤러에 정보를 전달
        	return kmapper.findKakao(userInfo);
        } else {
        	System.out.println("KS 142: 있는 사용자 ?? ");
        	//저장된 정보가 있으면 result를 전송한다
        	return result;
        }

    }


	public KakaoDTO kakaoNumber(KakaoDTO userInfo) {
		// 카카오 번호 찾기
		System.out.println("KS 152: " + kmapper.kakaoNumber(userInfo));
		return kmapper.kakaoNumber(userInfo);
	} 
    

}
