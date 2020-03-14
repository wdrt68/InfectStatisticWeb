package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NationDAO;
import dao.ProvinceDAO;
import pojo.Nation;

/**
 * Servlet implementation class indexServlet
 */
@WebServlet("/indexServlet")
public class indexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public indexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		if(request.getParameter("dataDate") == null) {
			setDataAttr("2020-03-13", request);
			setIpMap("2020-03-13", request);
		}
		else {
			setDataAttr(request.getParameter("dataDate"), request);
			setIpMap(request.getParameter("dataDate"), request);
		}
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void setDataAttr(String date, HttpServletRequest request) {
		
		NationDAO nationDAO = new NationDAO();
		Nation nation = nationDAO.get(date);
		if(nation == null) return;
		
		request.setAttribute("ip", nation.getIp());
		request.setAttribute("n_ip", nation.getN_ip());
		request.setAttribute("c_ip", nation.getC_ip());
		request.setAttribute("sp", nation.getSp());
		request.setAttribute("n_sp", nation.getN_sp());
		request.setAttribute("cure", nation.getCure());
		request.setAttribute("n_cure", nation.getN_cure());
		request.setAttribute("dead", nation.getDead());
		request.setAttribute("n_dead", nation.getN_dead());
	}
	
	protected void setIpMap(String date, HttpServletRequest request) {
		
		ProvinceDAO provinceDAO = new ProvinceDAO();
		Map<String, Integer> ipMap = provinceDAO.getIpMap(date);
		
		request.setAttribute("ipMap", ipMap);
		
	}
	
}
