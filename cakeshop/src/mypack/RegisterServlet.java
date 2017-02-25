package mypack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBean user = new UserBean();
		 if(request.getParameter("pw1").equals(request.getParameter("pw2")))
		 {
			   HttpSession session = request.getSession(true);	    
	           session.setAttribute("un",request.getParameter("em").toString());
			   user.setEmail(request.getParameter("em").toString());
			   user.setPassword(request.getParameter("pw1").toString());
		       user.setUsername(request.getParameter("username").toString());
		       user.setTelephone(request.getParameter("tel").toString());  
		       UserDAO.register(user);
		       response.sendRedirect("main.jsp");
		 }else{
			 response.sendRedirect("RegisterPage.jsp"); //error page 
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
