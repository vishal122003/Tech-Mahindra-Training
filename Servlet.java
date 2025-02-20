package net.codejava;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
//    	super.doPost(req, resp);
    	String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println("username: " + username);
		System.out.println("password: " + password);
		PrintWriter writer = resp.getWriter();
		String htmlRespone = "<html>";
		        htmlRespone += "<h2>Your username is: " + username + "<br/>";      
		        htmlRespone += "Your password is: " + password + "</h2></html>";    
		          writer.println(htmlRespone);
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
       // response.getWriter().println("Hello friend!");
      /*  response.setContentType("text/html");      
	       PrintWriter pwriter = response.getWriter();    
	       pwriter.println("<html><body>");
	       pwriter.println("<h2>Html file from Servlet!</h2>");
	       pwriter.println("</body></html>");*/
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("username: " + username);
		System.out.println("password: " + password);
		PrintWriter writer = response.getWriter();
		String htmlRespone = "<html>";
		        htmlRespone += "<h2>Your username is: " + username + "<br/>";      
		        htmlRespone += "Your password is: " + password + "</h2></html>";    
		          writer.println(htmlRespone);
  }
}
