package ec;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.CustomDataBeans;
import beans.ItemDataBeans;
import dao.CustomDAO;
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
			//不正アクセス対策
			if(session.getAttribute("userId") == null || (int)session.getAttribute("userId")!= 1) {
				response.sendRedirect("Login");
				 return;
			}else {
				//------パーツのリストを取得
				ArrayList<ItemDataBeans>typeList= ItemDAO.getTypeList();
				ArrayList<CustomDataBeans>customList= CustomDAO.getCustomTypeList();

				//リクエストスコープにセット
				request.setAttribute("typeList", typeList);
				request.setAttribute("customList", customList);
				request.getRequestDispatcher(EcHelper.MASTER_PAGE).forward(request, response);

			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString()+"不正なアクセス");
			response.sendRedirect("Error");
		}
	}
}
