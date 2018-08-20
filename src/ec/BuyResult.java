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
import dao.BuyDAO;

/**
 * 購入完了画面
 *
 * @author d-yamaguchi
 *
 */
@WebServlet("/BuyResult")
public class BuyResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		try {
			int userId = (int) session.getAttribute("userId");
			int buyTotalPrice = Integer.parseInt(request.getParameter("buy_total_price"));

			//セッションから購入情報に入れる情報を取得　同時にセッションの切断
			BuyDataBeans bdb =(BuyDataBeans)session.getAttribute("bdb");
			bdb.setUserId(userId);
			bdb.setTotalPrice(buyTotalPrice);
			bdb = (BuyDataBeans) EcHelper.cutSessionAttribute(session, "bdb");

			// セッションからカート情報を取得
			ArrayList<BuyDataBeans> cart = (ArrayList<BuyDataBeans>) EcHelper.cutSessionAttribute(session, "cart");

			// 購入情報を登録
			int buyId = BuyDAO.insertBuy(bdb);

			// 購入詳細情報を購入情報IDに紐づけして登録
			for (BuyDataBeans cartInItem : cart) {
				cartInItem.setBuyId(buyId);
				BuyDAO.insertBuyDetail(cartInItem);
			}


			/* ====購入完了ページ表示用==== */
			BuyDataBeans resultBDB = BuyDAO.getBuyInfoBuyId(buyId,userId);
			request.setAttribute("resultBDB", resultBDB);

			// 購入アイテム情報
			ArrayList<BuyDataBeans> buyIDBList = BuyDAO.getBuyDetailListByBuyId(buyId);
			request.setAttribute("buyIDBList", buyIDBList);

			// 購入完了ページ
			request.getRequestDispatcher(EcHelper.BUY_RESULT_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
