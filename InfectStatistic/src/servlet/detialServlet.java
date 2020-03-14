package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProvinceDAO;
import pojo.Province;


/**
 * Servlet implementation class detialServlet
 */
@WebServlet("/detialServlet")
public class detialServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detialServlet() {
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
			setDataAttr("2020-03-13", request);;
		}
		else {
			setDataAttr(request.getParameter("dataDate"), request);
		}
		
		String name = request.getParameter("name");
		ProvinceDAO provinceDAO = new ProvinceDAO();
		request.setAttribute("dateStrings", provinceDAO.getDateStrings());
		request.setAttribute("cIpList", provinceDAO.getCIpList(name));
		request.setAttribute("ipList", provinceDAO.getIpList(name));
		request.setAttribute("cureList", provinceDAO.getCureList(name));
		request.setAttribute("deadList", provinceDAO.getDeadList(name));
		
		request.getRequestDispatcher("detial.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void setDataAttr(String date, HttpServletRequest request) {
		
		String name = request.getParameter("name");
		request.setAttribute("name", name);
		ProvinceDAO provinceDAO = new ProvinceDAO();
		Province province = provinceDAO.getProvince(name, date);
		
		if(province == null) return;
		
		request.setAttribute("ip", province.getIp());
		request.setAttribute("n_ip", province.getN_ip());
		request.setAttribute("c_ip", province.getC_ip());
		request.setAttribute("cure", province.getCure());
		request.setAttribute("n_cure", province.getN_cure());
		request.setAttribute("dead", province.getDead());
		request.setAttribute("n_dead", province.getN_dead());
	}
	
}
