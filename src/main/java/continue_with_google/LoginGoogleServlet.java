package continue_with_google;
import java.io.IOException;  
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.interact_with_user;
import continue_with_google.GooglePojo;
import continue_with_google.GoogleUtils;
import utils.encrypt_password;
@WebServlet("/login_google")
public class LoginGoogleServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
//  public LoginGoogleServlet() {
  //  super();
  //}
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
	  String code = request.getParameter("code");
		if (code == null || code.isEmpty()) {
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
		} else {
			String accessToken = GoogleUtils.getToken(code);
			GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
			System.out.println(googlePojo.getEmail());
			handle_email(googlePojo.getEmail(), request, response);
		}
  }
  public void handle_email(String email, HttpServletRequest req, HttpServletResponse resp) {
	  if (interact_with_user.check_email_exist_in_database(email) == 0) {
		  interact_with_user.insert_user(email, encrypt_password.ecrypt_to_SHA1("adfasdfasdfds"));
	  }
	  int id_user = interact_with_user.get_id_user(email);
		HttpSession session = req.getSession();
		session.setAttribute("id_user", id_user);
		System.out.println(id_user);
		try {
			resp.sendRedirect("http://localhost:8080/Jewelry_web/product");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  }
}
