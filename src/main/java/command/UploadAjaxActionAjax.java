package command;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.jsp.PageContext;

import org.apache.catalina.core.ApplicationContext;

import dto.AttachFileDTO;
import net.coobird.thumbnailator.Thumbnailator;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/uploadAjaxAction.ajax")
@MultipartConfig(
   location = "C:\\\\Class\\workspace\\JSPClass\\bungae\\src\\main\\webapp\\images",   
   fileSizeThreshold =  -1,   
   maxFileSize = 1024*1024*50,
   maxRequestSize = 1024*1024*50*5
)/*"C:\\upload"*/
public class UploadAjaxActionAjax extends HttpServlet  implements CommandHandler{
   private static final long serialVersionUID = 1L;
     

    public UploadAjaxActionAjax() {
    	
    	
   
    	
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
   }

   // 날짜별 파일 저장하기 위한 폴더명 생성함수
   private String getFolder() {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      Date date = new Date();
      String folderName = sdf.format(date);
      return folderName.replace("-", File.separator);
   }
   
   // 이미지 여부 체크 함수 
   public boolean checkImageType(File file) {
      try {
         String contentType = Files.probeContentType(file.toPath());
         System.out.println( "> contentType : " + contentType);
         return contentType.startsWith("image");
      } catch (Exception e) {
         //System.out.println( "[ 1  ] : ");
         //e.printStackTrace();
      } // try
      return false;
   }
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      
      // json 으로 첨부파일 정보를 반환하는  ArrayList
      List<AttachFileDTO> list = new ArrayList<>();

      PrintWriter out = response.getWriter();
      String contentType = request.getContentType();
      
      JSONObject jsonData = new JSONObject();
      int fileLength = 0;
      
      //String uploadFolder = "C:\\upload";
      String uploadFolder = request.getSession().getServletContext().getRealPath("upload");
      System.out.println( uploadFolder );
      
      File upLoadPath = new File(uploadFolder, getFolder());
      if( !upLoadPath.exists()) {upLoadPath.mkdirs();}
      
      if ( contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
         // 첨부된 파일을 getPart()메서드로  컬렉션으로 얻어오기 
         Collection<Part> parts = request.getParts();
         for (Part part : parts) {
            
            AttachFileDTO attachDTO = new AttachFileDTO();
            
            String paramName = part.getName();  // input type=file의  파라미터명(name속성)
            contentType = part.getContentType();
            //System.out.printf("paramName=%s,contentType=%s\n", paramName,contentType );
            if( part.getHeader("Content-Disposition").contains("filename=") ) {
               String fileName = part.getSubmittedFileName();
               long size = part.getSize();
               // System.out.printf("fileName=%s, size=%d\n", fileName, size);
               attachDTO.setFileName(fileName);  // ㄱ
               if (size > 0) {
            	   UUID uuid = UUID.randomUUID();
                  String filePath = String.format("%s\\%s_%s" ,upLoadPath, uuid.toString(), fileName);
                  part.write( filePath );
                  part.delete();
                  fileLength++;
                  
                  attachDTO.setUuid(uuid.toString()) ;  // ㄴ
                  
                  // 이미지파일인 경우에는 섬네일 생성
                  File f = new File(filePath);
                  if( checkImageType(f)) { 
                     FileInputStream fis = new FileInputStream(f);
                     filePath =  String.format("%s\\s_%s_%s",upLoadPath, uuid.toString(), fileName);
                     
                     attachDTO.setUploadPath(filePath.substring( filePath.indexOf("\\bungae") ))  ;  // ㄷ
                     
                     FileOutputStream thumbnail = new FileOutputStream(filePath);
                     Thumbnailator.createThumbnail( fis  , thumbnail, 100, 100);
                     thumbnail.close();
                     fis.close();
                     
                     attachDTO.setImage(true); // ㄹ
                  } // if
               } // if
            }  // if
            list.add(attachDTO); // ㅁ
         } // for
      }  
      
//      jsonData.put("result", fileLength);
      //out.append(jsonData.toString());
      
      JSONArray jsonArray = JSONArray.fromObject(list);
      System.out.println(jsonArray.toString());
      
      
      
      
      
      
//      out.append(jsonArray.getJSONObject(0).toString());
      out.append(jsonArray.toString());
      
  
      
//      String uuid = jsonArray.getJSONObject(0).getString("uuid");
//      System.out.println(uuid);
      
      
   } // doPost

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		return null;
	}

}