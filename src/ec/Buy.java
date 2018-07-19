package ec;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BuyDataBeans;
import beans.DeliveryMethodDataBeans;
import dao.DeliveryMethodDAO;

/**
 * 商品購入画面
 *
 * @author t-takeuchi
 *
 */
@WebServlet("/Buy")
public class Buy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			Boolean isLogin = session.getAttribute("isLogin") != null ? (Boolean) session.getAttribute("isLogin") : false;
			//ArrayList<ItemDataBeans> cart = (ArrayList<ItemDataBeans>) session.getAttribute("cart");

			if (!isLogin) {
				// Sessionにリターンページ情報を書き込む
				session.setAttribute("returnStrUrl", "Cart");
				// Login画面にリダイレクト
				response.sendRedirect("Login");

				return;
			}

			//選択された配送方法IDを取得
			int inputDeliveryMethodId = Integer.parseInt(request.getParameter("delivery_method_id"));
			//選択されたIDをもとに配送方法Beansを取得
			DeliveryMethodDataBeans userSelectDMB = DeliveryMethodDAO.getDeliveryMethodDataBeansByID(inputDeliveryMethodId);
			//買い物かご
			//ArrayList<ItemDataBeans> cartIDBList = (ArrayList<ItemDataBeans>) session.getAttribute("cart");
			//合計金額
			//int totalPrice = EcHelper.getTotalItemPrice(cartIDBList);

			BuyDataBeans bdb = new BuyDataBeans();
			bdb.setUserId((int) session.getAttribute("userId"));
			//sbdb.setTotalPrice(totalPrice);
			bdb.setDeliveryMethodId(userSelectDMB.getId());
			bdb.setDeliveryMethodPrice(userSelectDMB.getPrice());
			bdb.setDeliveryMethodName(userSelectDMB.getName());



			//購入確定で利用
			session.setAttribute("bdb", bdb);
			request.getRequestDispatcher(EcHelper.BUY_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
