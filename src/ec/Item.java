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
 * 商品画面
 * @author
 * t-takeuchi
 *
 */
@WebServlet("/Item")
public class Item extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 商品カスタマイズ画面
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {

			//------パーツのリストを取得
			ArrayList<ItemDataBeans>typeList= ItemDAO.getTypeList();
			//リクエストスコープにセット
			request.setAttribute("typeList", typeList);
			//-----カスタムメニューの基本パーツを取得
			int id = Integer.parseInt(request.getParameter("item_id"));
			CustomDataBeans customItemList= CustomDAO.getCustomItemList(id);
			//リクエストスコープにセット
			request.setAttribute("customitem", customItemList);

			//-------パーツリストからパーツ名を取得しパーツ別の商品リストを取得
			for (int i = 0; i < typeList.size(); i++) {
			String type = typeList.get(i).getItemType();
			ArrayList<ItemDataBeans>itemList= ItemDAO.getByItemType(type);
			request.setAttribute(type, itemList);

			}
			request.getRequestDispatcher(EcHelper.ITEM_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
