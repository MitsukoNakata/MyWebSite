package ec;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ItemDataBeans;
import dao.ItemDAO;

/**
 * スタート画面
 * @author m-takeuchi
 *
 */
@WebServlet("/MasterPage")
public class MasterPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			//不正アクセスの確認
			int userId = (int) session.getAttribute("userId");
			if(userId == 1) {
				//------パーツのリストを取得
				ArrayList<ItemDataBeans>typeList= ItemDAO.getTypeList();
				//リクエストスコープにセット
				request.setAttribute("typeList", typeList);
				request.getRequestDispatcher(EcHelper.MASTER_PAGE).forward(request, response);
			}request.getRequestDispatcher("Error").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
