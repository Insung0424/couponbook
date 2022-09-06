package sol.one.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@AllArgsConstructor
public class WriteController {

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(HttpServletRequest req, HttpServletResponse resp, @RequestParam("file") MultipartFile file) throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String fileRealName = file.getOriginalFilename(); //�뙆�씪紐낆쓣 �뼸�뼱�궪 �닔 �엳�뒗 硫붿꽌�뱶!
		long size = file.getSize(); //�뙆�씪 �궗�씠利�
//		System.out.println(file.getOriginalFilename());
//		System.out.println(file.getContentType());
//		System.out.println(file.getSize());
		//System.out.println("�뙆�씪紐� : "  + fileRealName);
		//System.out.println("�슜�웾�겕湲�(byte) : " + size);
		//�꽌踰꾩뿉 ���옣�븷 �뙆�씪�씠由� fileextension�쑝濡� .jsp�씠�윴�떇�쓽  �솗�옣�옄 紐낆쓣 援ы븿
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = req.getSession().getServletContext().getRealPath("/resources/images/src");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		
		File uploadPath = new File(uploadFolder, datePath);
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/*
		  �뙆�씪 �뾽濡쒕뱶�떆 �뙆�씪紐낆씠 �룞�씪�븳 �뙆�씪�씠 �씠誘� 議댁옱�븷 �닔�룄 �엳怨� �궗�슜�옄媛� 
		  �뾽濡쒕뱶 �븯�뒗 �뙆�씪紐낆씠 �뼵�뼱 �씠�쇅�쓽 �뼵�뼱濡� �릺�뼱�엳�쓣 �닔 �엳�뒿�땲�떎. 
		  ���씤�뼱瑜� 吏��썝�븯吏� �븡�뒗 �솚寃쎌뿉�꽌�뒗 �젙�긽 �룞�옉�씠 �릺吏� �븡�뒿�땲�떎.(由щ늼�뒪媛� ���몴�쟻�씤 �삁�떆)
		  怨좎쑀�븳 �옖�뜕 臾몄옄瑜� �넻�빐 db�� �꽌踰꾩뿉 ���옣�븷 �뙆�씪紐낆쓣 �깉濡�寃� 留뚮뱾�뼱 以��떎.
		 */
		
		UUID uuid = UUID.randomUUID();
		//System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		//System.out.println("�깮�꽦�맂 怨좎쑀臾몄옄�뿴" + uniqueName);
		//System.out.println("�솗�옣�옄紐�" + fileExtension);
		
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid �쟻�슜 �쟾
		String uploadFileName = uniqueName + fileExtension ;
		
		File saveFile = new File(uploadPath + File.separator + uniqueName + fileExtension);  // �쟻�슜 �썑
		//System.out.println(saveFile);
		try {
			file.transferTo(saveFile); // �떎�젣 �뙆�씪 ���옣硫붿꽌�뱶(filewriter �옉�뾽�쓣 �넀�돺寃� �븳諛⑹뿉 泥섎━�빐以��떎.)
			
			File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	
			BufferedImage bo_image = ImageIO.read(saveFile);
			//비율 
			double ratio = 4;
			//넓이 높이
			int width = (int) (bo_image.getWidth() / ratio);
			int height = (int) (bo_image.getHeight() / ratio);					
			Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);
			
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "main";
	}
	
	/*
	 * �떎以� �뙆�씪 �뾽濡쒕뱶�떆 援ы쁽
	@PostMapping("upload2")
	public void upload2() {
		
	}*/
}
