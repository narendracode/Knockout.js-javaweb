

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class SaveDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SaveDataServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  process(request,response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String methodName = request.getParameter("method");
		System.out.println("Method name:"+methodName);
		if(methodName.equals("save")){
			String dataText = request.getParameter("userData");
			System.out.println(dataText);
			String jsonString = "result is success";
			response.getOutputStream().write(jsonString.getBytes("UTF-8"));  
		     response.getOutputStream().flush();
		}
	}

}
