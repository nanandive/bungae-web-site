package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.FrequentlyDTO;
import command.CommandHandler;
import service.FrequentlyDetailService;
import service.ListFrequentlyService;

public class FrequentlyHandler implements CommandHandler {
    private ListFrequentlyService listFrequentlyService = new ListFrequentlyService();
    private FrequentlyDetailService frequentlyDetailService = new FrequentlyDetailService();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String frequentlyIdParam = request.getParameter("id");

        if (frequentlyIdParam == null) {
            List<FrequentlyDTO> askedList = listFrequentlyService.getAllFrequentlyAsked();
            List<FrequentlyDTO> conflictList = listFrequentlyService.selectPolicy();
            List<FrequentlyDTO> safetyList = listFrequentlyService.selectSafety();
            List<FrequentlyDTO> careList = listFrequentlyService.selectCare();
            List<FrequentlyDTO> adList = listFrequentlyService.selectAd();
            List<FrequentlyDTO> etcList = listFrequentlyService.selectEtc();
            request.setAttribute("askedList", askedList);
            request.setAttribute("conflictList", conflictList);
            request.setAttribute("safetyList", safetyList);
            request.setAttribute("careList", careList);
            request.setAttribute("adList", adList);
            request.setAttribute("etcList", etcList);
            
            System.out.println(askedList.toString());

            return "/WEB-INF/views/customer_frequently_asked_questions.jsp";
        } else {
        
            int frequentlyId = Integer.parseInt(frequentlyIdParam);
            FrequentlyDTO frequentlyDetail = frequentlyDetailService.getFrequentlyDetail(frequentlyId);
            request.setAttribute("frequentlyDetail", frequentlyDetail);
            return "/WEB-INF/views/customer_frequently_detail.jsp";
        }
    }
}
