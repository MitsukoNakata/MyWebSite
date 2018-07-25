package ec;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserDataBeans;
import dao.UserDAO;
/**
 *
 * @author d-yamaguchi
 *
 */
@WebServlet("/LoginResult")
public class LoginResult extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*文字化け対策*/
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		try {
			//パラメーターから取得
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			//ユーザーIDを取得
			int userId = UserDAO.getUserId(email, password);

			//ユーザーIDが取得できたなら
			if (userId != 0) {
		        UserDataBeans udb = UserDAO.getUserDataBeansByUserId(userId);
		 		session.setAttribute("udb", udb);
				session.setAttribute("isLogin", true);
				session.setAttribute("userId", userId);
				//ログイン前のページを取得
				String returnStrUrl = (String) EcHelper.cutSessionAttribute(session, "returnStrUrl");

				//ログイン前ページにリダイレクト。指定がない場合Index
				response.sendRedirect(returnStrUrl!=null?returnStrUrl:"Index");
			} else {
				session.setAttribute("email", email);
				session.setAttribute("loginErrorMessage", "入力内容が正しくありません");
				response.sendRedirect("Login");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}

}
