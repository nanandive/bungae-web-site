package command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Large_classDAO;
import dao.Medium_classDAO;
import dao.MemberDAO;
import dao.ProductDAO;
import dao.Small_classDAO;
import dto.Large_classDTO;
import dto.Medium_classDTO;
import dto.ProductDTO;
import dto.Small_classDTO;
import command.CommandHandler;

public class RegisterPageHandler implements CommandHandler {

   private MemberDAO memberDAO;
   private ProductDAO productDAO;
   private Large_classDAO Large_classDAO;
   private Medium_classDAO Medium_classDAO;
   private Small_classDAO Small_classDAO;

   public RegisterPageHandler() {
      memberDAO = new MemberDAO();
      productDAO = new ProductDAO();
      Large_classDAO = new Large_classDAO();
      Medium_classDAO = new Medium_classDAO();
      Small_classDAO = new Small_classDAO();
   }

   @Override
   public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
	   
      HttpSession session = req.getSession();
      String data = (String) session.getAttribute("member_id");
      String member_id = data;
      
      ArrayList<ProductDTO> loveProduct = memberDAO.getLoveListForMember(member_id);
      List<Large_classDTO> largeClasses = Large_classDAO.getAllLargeClasses();
      List<Medium_classDTO> mediumClasses = Medium_classDAO.getAllMediumClasses();
      List<Small_classDTO> smallClasses = Small_classDAO.getAllSmallClasses();
      req.setAttribute("member_id", member_id);
      req.setAttribute("largeClasses", largeClasses);
      req.setAttribute("mediumClasses", mediumClasses);
      req.setAttribute("smallClasses", smallClasses);
      req.setAttribute("loveProduct", loveProduct);
      System.out.println("레지스터페이지핸들러 호출?");
      return "/WEB-INF/views/goods_selling_form.jsp";
   }
}