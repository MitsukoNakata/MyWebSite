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
 * @author m-takeuchi
 *
 */
@WebServlet("/MasterCustomEdit")
public class MasterCustomEdit extends HttpServlet {
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
				String customType = request.getParameter("customType");
				if(customType != null) {
					session.setAttribute("returnItem", customType);
					//編集後のページ以外からきた場合はメッセージのセッションを破棄
					session.removeAttribute("actionMessage");
				}else {
					customType = (String)session.getAttribute("returnItem");
				}
				//------パーツのリストを取得
				ArrayList<CustomDataBeans>customList= CustomDAO.getCustomTypeList();
				//リクエストスコープにセット
				request.setAttribute("customList", customList);

				//------パーツのリストを取得
				ArrayList<ItemDataBeans>typeList= ItemDAO.getTypeList();
				//リクエストスコープにセット
				request.setAttribute("typeList", typeList);

				//アイコン表示用
				ArrayList<CustomDataBeans>customMenuList= CustomDAO.getByCustomType(customType);
				request.setAttribute("customMenuList", customMenuList);

				//-------パーツリストからパーツ名を取得しパーツ別の商品リストを取得し
				//各パーツでリクエストスコープに格納を繰り返す。
				for (int i = 0; i < typeList.size(); i++) {
				String type = typeList.get(i).getItemType();
				ArrayList<ItemDataBeans>itemList= ItemDAO.getByItemType(type);
				request.setAttribute(type, itemList);
				}

				request.getRequestDispatcher(EcHelper.CUSTOM_EDIT_PAGE).forward(request, response);
				}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
