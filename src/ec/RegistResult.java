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
 * ユーザー登録完了画面
 *
 * @author d-yamaguchi
 *
 */
@WebServlet("/RegistResult")
public class RegistResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		try {

			String inputUserName = request.getParameter("user_name");
			String inputUserAddress = request.getParameter("user_address");
			String inputEmail = request.getParameter("email");
			String inputPassword = request.getParameter("password");
			String inputZipcode = request.getParameter("zipcode");
			String inputPhonenumber= request.getParameter("phonenumber");

			UserDataBeans udb = new UserDataBeans();

			udb.setName(inputUserName);
			udb.setEmail(inputEmail);
			udb.setPassword(inputPassword);
			udb.setAddress(inputUserAddress);
			udb.setZipcode(inputZipcode);
			udb.setPhonenumber(inputPhonenumber);

			// 登録が確定されたかどうか確認するための変数
			String confirmed = request.getParameter("confirm_button");

			switch (confirmed) {
			case "cancel":
				session.setAttribute("udb", udb);
				response.sendRedirect("Regist");
				break;

			case "regist":
				UserDAO.insertUser(udb);
				request.setAttribute("udb", udb);
				request.getRequestDispatcher(EcHelper.REGIST_RESULT_PAGE).forward(request, response);
				break;
			}

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}