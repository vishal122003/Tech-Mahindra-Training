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
    	String username = "user";
		String password = "123";
		System.out.println("username: " + username);
		System.out.println("password: " + password);
		PrintWriter writer = resp.getWriter();
		String htmlRespone = "<html>";
		        htmlRespone += "<h2>Your username is: " + username + "<br/>";      
		        htmlRespone += "Your password is: " + password + "</h2></html>";    
		          writer.println(htmlRespone);
    }}
