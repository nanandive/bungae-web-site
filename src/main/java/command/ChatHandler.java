package command;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChatDAO;
import dao.MemberDAO;
import dao.ProductDAO;

public class ChatHandler implements CommandHandler {

   private MemberDAO memberDAO;
   private ProductDAO productDAO;
   private ChatDAO chatDAO;
   
   public ChatHandler() {
      memberDAO = new MemberDAO();
      productDAO = new ProductDAO();
      chatDAO = new ChatDAO();
   }
   
   @Override
   public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
      req.setCharacterEncoding("UTF-8");
      res.setContentType("text/html;charset=UTF-8");
      
      HttpSession session = req.getSession(); // 세션 객체 가져오기
      
      String member_id = (String) session.getAttribute("member_id"); // 세션 변수인 member_id 가져오기
      int product_id = Integer.parseInt(req.getParameter("product_id"));
      String chatContent = req.getParameter("chatContent");
      
      System.out.println(member_id);
   
      String result = "0";
      if (member_id == null || member_id.equals("") || chatContent == null || chatContent.equals("")) {
         result = "0";
      } else {
         chatContent = URLDecoder.decode(chatContent, "UTF-8");
         result = new ChatDAO().submit(member_id, product_id, chatContent) + "";
      }
      
      return result;
   }
}
