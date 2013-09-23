

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

public class LoadDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoadDataServlet() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
    System.out.println("servlet is called");
		
     MyClass myClass = new MyClass();
	 myClass.setFirstName("Narendra");
	 myClass.setLastName("soni");
	 myClass.setFavoriteHobby("Programming");
	 String[] activities = new String[]{"play","enjoy","skate","study","work"};
	 myClass.setActivities(activities);	 
	 response.setContentType("application/json");  
     response.setCharacterEncoding("UTF-8"); 
     String jsonString =  new Gson().toJson(myClass);
     System.out.println("JSON String:"+jsonString);
     response.getOutputStream().write(jsonString.getBytes("UTF-8"));  
     response.getOutputStream().flush();
	}

}
