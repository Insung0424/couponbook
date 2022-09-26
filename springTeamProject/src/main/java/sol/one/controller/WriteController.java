package sol.one.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import net.coobird.thumbnailator.Thumbnails;
import sol.one.VO.BoardVO;
import sol.one.VO.ImageVO;
import sol.one.VO.ProductVO;
import sol.one.service.BoardServiceImpl;
import sol.one.service.CategoryService;
import sol.one.service.ProductServiceImpl;

@Controller
@AllArgsConstructor
public class WriteController {
	
	private ProductServiceImpl productservice;
	
	private BoardServiceImpl boardservice;
	
	private final CategoryService categoryservice;
	
	//등록버튼을 눌렀을때 
	@PostMapping("/product_add")
	public String add(String pd_name,String pd_img,String pd_desc,String company_name,String pd_price,
			int category_id,int location_id,int pd_discount,String pd_date,long user_id,String pd_price0) {
		ProductVO vo = new ProductVO();
		vo.setPd_desc(pd_desc);
		vo.setPd_img(pd_img);
		vo.setPd_name(pd_name);
		vo.setCategory_id(category_id);
		vo.setLocation_id(location_id);
		vo.setPd_discount(pd_discount);
		vo.setCompany_name(company_name);
		vo.setPd_price(pd_price);
		vo.setPd_date(pd_date);
		vo.setPd_price0(pd_price0);
		productservice.add(vo);
		
		BoardVO bvo = new BoardVO();
		bvo.setUser_id(user_id);
		bvo.setBoard_title(pd_name);
		bvo.setBoard_content(pd_desc);
		bvo.setPd_discount(pd_discount);
		bvo.setPd_date(pd_date);
		boardservice.insertBoard(bvo);
		
		int n = productservice.getI(pd_img);
		
		//등록하고 상세페이지로 바로 이동해서 작성된 글을 보여줄시
		return "redirect:/category/detail?product_id="+n;
		
		
		//return "/product/mainTest";
	}

	// 파일 및 이미지 한글 깨지면 produces = MediaType.APPLICATION_JSON_UTF8_VALUE 추가
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ResponseEntity<ImageVO> upload(HttpServletRequest req, HttpServletResponse resp,
			@RequestParam("file") MultipartFile file) throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		System.out.println(file.getSize());
		// 이미지 파일인지 체크
		File checkfile = new File(file.getOriginalFilename());
		String type = null;
		try {
			
			type = Files.probeContentType(checkfile.toPath());
			
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		if (!type.startsWith("image")) {
			ImageVO vo = null;
			return new ResponseEntity<ImageVO>(vo, HttpStatus.OK);
		}

		String fileRealName = file.getOriginalFilename();
		long size = file.getSize();
//		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		String fileExtension = ".PNG";
		String uploadFolder = req.getSession().getServletContext().getRealPath("/resources/images/src");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		// 날마다 새로운 경로에 폴더생성 후 해당폴더에 이미지 저장
		File uploadPath = new File(uploadFolder, datePath);
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// 각 이미지마다 다른 이름을 주기 위해사용한다고 함
		UUID uuid = UUID.randomUUID();
		// System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];

		// File saveFile = new File(uploadFolder+"\\"+fileRealName);
		String uploadFileName = uniqueName + fileExtension; // 파일 이름

		File saveFile = new File(uploadPath + File.separator + uniqueName + fileExtension);
		System.out.println(saveFile);
		
		ImageVO vo = new ImageVO(); // 이미지파일의 경로를 String 으로 저장하기위한 객체 db에는 존재 하지 않음
		vo.setImg(saveFile.toString()); // 이미지 파일 경로 저장 다중 파일 및 이미지 업로드시 for문으로 변경해야함
		
		String sfile = null;
		try {
			file.transferTo(saveFile);

			// 썸네일용 파일
			File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
			BufferedImage bo_image = ImageIO.read(saveFile);
			// 비율
			double ratio = 2;
			// 넓이 높이
			int width = (int) (bo_image.getWidth() / ratio);
			int height = (int) (bo_image.getHeight() / ratio);
			Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);
			
			sfile = thumbnailFile.toString();
			

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		vo.setSimg(sfile); 
		
		// for문이용시 리스트에 vo 객체 담고 반환도 <List<ImageVO>> 로 변경
		ResponseEntity<ImageVO> data = new ResponseEntity<ImageVO>(vo, HttpStatus.OK);

		return data;
	}

	/*
	 * 파일 및 이미지 다중 업로드시 구현
	 * 
	 * @PostMapping("upload2") public void upload2() {
	 * 
	 * }
	 */

	
	// 이미지 첨부시 미리보기 이미지생성해주는 부분
	@RequestMapping(value = "/getImg", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getImg(String fileNameNPath) {
		// 테이블에서 열 값에 저장할때 이미지경로와 이름이 전체가 저장되므로 그 값을 받아서 파일을 생성함
		// ex)
		// C:\Users\agdis\Documents\workspace-sts-3.9.11.RELEASE\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\springTeamProject\resources\images\src\2022\09\07\c5ad886f.png
		File file = new File(fileNameNPath);

		ResponseEntity<byte[]> img = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			img = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return img;
	}

	@RequestMapping(value = "/deleteImg", method = RequestMethod.POST)
	public ResponseEntity<String> deleteImg(String fileNameNPath) {

		File file = null;

		try {
			
			file = new File(URLDecoder.decode(fileNameNPath, "UTF-8"));
			file.delete(); // 원본 파일 삭제
			
			String sFileName = file.getAbsolutePath().replace("s_", "");
			file = new File(sFileName);
			file.delete(); // 이미지 파일 삭제
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	@GetMapping("/modifyPostView")
	public String modifyPostView(@RequestParam("product_id")int product_id,Model model)throws Exception{
		model.addAttribute("detail",categoryservice.detail(product_id));
		return "category/modifyPost";
	}
	@PostMapping("/modify")
	public String modify(ProductVO product,String pd_name,String pd_desc,String pd_date,
			int pd_discount,int product_id,long user_id,int board_no,HttpSession session)throws Exception{

		productservice.modifyProduct(product);
		BoardVO board=new BoardVO();
		board.setBoard_title(pd_name);
		board.setBoard_content(pd_desc);
		board.setPd_discount(pd_discount);
		board.setBoard_no(board_no);
		board.setPd_date(pd_date);
		board.setProduct_id(product_id);
		board.setUser_id(user_id);
		boardservice.modifyBoard(board);
		return "redirect:/";
	}
	@PostMapping("/deleteBoard")
	public String deleteBoard(int product_id,int board_no,
			Model model)throws Exception{
		boardservice.deleteBoard(board_no);
		productservice.deleteP(product_id);
		return "redirect:/";
	}
	

}
