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
 * 商品画面
 * @author m-takeuchi
 *
 */
@WebServlet("/MasterItemEdit")
public class MasterItemEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 商品詳細画面
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			//不正アクセス対策
			if(session.getAttribute("userId") == null || (int)session.getAttribute("userId")!= 1) {
				response.sendRedirect("Login");
				 return;
			}else {
			//選択された商品のIDを型変換し利用
				String itemType = request.getParameter("itemType");
				if(itemType != null) {
					session.setAttribute("returnItem", itemType);
				}else {
					itemType = (String)session.getAttribute("returnItem");
				}
				//------パーツのリストを取得
				ArrayList<ItemDataBeans>typeList= ItemDAO.getTypeList();
				//リクエストスコープにセット
				request.setAttribute("typeList", typeList);

				//アイコン表示用
				ArrayList<ItemDataBeans>itemList= ItemDAO.getByItemType(itemType);
				request.setAttribute("itemList", itemList);

				request.getRequestDispatcher(EcHelper.ITEM_EDIT_PAGE).forward(request, response);
				}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
