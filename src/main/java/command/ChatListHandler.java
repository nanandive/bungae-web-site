package command;

import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChatDAO;
import dao.MemberDAO;
import dao.ProductDAO;
import dto.ChatDTO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ChatListHandler implements CommandHandler {

   private MemberDAO memberDAO;
   private ProductDAO productDAO;
   private ChatDAO chatDAO;

   public ChatListHandler() {
      memberDAO = new MemberDAO();
      productDAO = new ProductDAO();
      chatDAO = new ChatDAO();
   }

   @Override
   public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
      req.setCharacterEncoding("UTF-8");
      res.setContentType("text/html; charset=UTF-8");

      String chatID = req.getParameter("chatID");

      HttpSession session = req.getSession();
      String member_id = (String) session.getAttribute("member_id");

      int product_id = Integer.parseInt(req.getParameter("product_id"));
      String listType = req.getParameter("listType");

      String result = "";
      if (member_id == null || member_id.equals("") || listType == null || listType.equals("")) {
         result = "";
      } else if (listType.equals("ten")) {
         result = getTen(member_id, product_id);
      } else {
         try {
            result = getID(member_id, product_id, listType);
         } catch (Exception e) {
            result = "0";
         }
      }
      return result;
   }

   private String getTen(String member_id, int product_id) {
      StringBuffer result = new StringBuffer("");
      result.append("{\"result\":[");
      ChatDAO chatDAO = new ChatDAO();
      ArrayList<ChatDTO> chatList = chatDAO.getChatListByRecent(member_id, product_id, 10);
      if (chatList.size() == 0)
         return "";

      JSONArray jsonData = JSONArray.fromObject(chatList);
      System.out.println(jsonData.toString());
      return jsonData.toString();
   }

   private String getID(String member_id, int product_id, String chatID) {
      StringBuffer result = new StringBuffer("");
      result.append("{\"result\":[");
      ChatDAO chatDAO = new ChatDAO();
      ArrayList<ChatDTO> chatList = chatDAO.getChatListByID(member_id, product_id, chatID);
      if (chatList.size() == 0)
         return "";
      for (int i = 0; i < chatList.size(); i++) {
         result.append("[{\"value\": \"" + chatList.get(i).getMember_id() + "\"},");
         result.append("{\"value\": \"" + chatList.get(i).getProduct_id() + "\"},");
         result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
         result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
         if (i != chatList.size() - 1) {
            result.append(",");
         }
         result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatID() + "\"}");

      }
      return result.toString();
   }
}
