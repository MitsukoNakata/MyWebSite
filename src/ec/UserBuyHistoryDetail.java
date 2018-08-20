package ec;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BuyDataBeans;
import beans.ItemDataBeans;
import dao.BuyDAO;
import dao.ItemDAO;

/**
 * 購入履歴画面
 * @author m-takeuchi
 *
 */
@WebServlet("/UserBuyHistoryDetail")
public class UserBuyHistoryDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		// セッション開始
		HttpSession session = request.getSession();
		try {
			//不正アクセス対策
			if(session.getAttribute("userId") == null) {
				response.sendRedirect("Login");
				 return;
			}
			// ログイン時に取得したユーザーIDをセッションから取得
			int userId = (int) session.getAttribute("userId");
		    int buyId = Integer.parseInt(request.getParameter("buy_id"));

			//合計用購入情報
			BuyDataBeans resultBDB = BuyDAO.getBuyInfoBuyId(buyId,userId);
			request.setAttribute("resultBDB", resultBDB);

			// 購入アイテム情報
			ArrayList<BuyDataBeans> buyDetailList = BuyDAO.getBuyDetailListByBuyId(buyId);
			request.setAttribute("buyDetailList", buyDetailList);

			//------パーツのリストを取得
			ArrayList<ItemDataBeans>typeList= ItemDAO.getTypeList();
			//リクエストスコープにセット
			request.setAttribute("typeList", typeList);

		request.getRequestDispatcher(EcHelper.USER_BUY_HISTORY_DETAIL_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}

}
