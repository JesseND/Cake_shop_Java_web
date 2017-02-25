package mypack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(true);	
         System.out.println(session.getAttribute("un"));
         request.setCharacterEncoding("utf-8");
         response.setCharacterEncoding("utf-8");
         String cakename=request.getParameter("cakename");
         String image=request.getParameter("image");
         int id=Integer.parseInt(request.getParameter("id"));
         int price=Integer.parseInt(request.getParameter("price"));
         String em=session.getAttribute("un").toString();	     
         if(em.equals("zz")){
        		response.sendRedirect("LoginPage.jsp");
         }
         else{
        	 request.setAttribute("image",image); 
        	 request.setAttribute("id",id); 
        	 request.setAttribute("price",price); 
        	 request.setAttribute("cakename",cakename); 
             request.getRequestDispatcher("buy.jsp").forward(request,response); 
         	
         }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
