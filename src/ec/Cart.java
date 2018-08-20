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
import beans.DeliveryMethodDataBeans;
import beans.ItemDataBeans;
import dao.DeliveryMethodDAO;
import dao.ItemDAO;

/**
 * カート画面
 * @author m-takeuchi
 *
 */
@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			HttpSession session = request.getSession();
			try {
				//カテゴリーリストを取得
				ArrayList<ItemDataBeans>typeList= ItemDAO.getTypeList();
				request.setAttribute("typeList", typeList);

				// 配送方法をDBから取得
				ArrayList<DeliveryMethodDataBeans> dMDBList = DeliveryMethodDAO.getAllDeliveryMethodDataBeans();
				request.setAttribute("dmdbList", dMDBList);

				ArrayList<BuyDataBeans> cart = (ArrayList<BuyDataBeans>) session.getAttribute("cart");
				//セッションにカートがない場合カートを作成
				if (cart == null) {
					cart = new ArrayList<BuyDataBeans>();
					session.setAttribute("cart", cart);
				}

				String cartActionMessage = "";
				//カートに商品が入っていないなら
				if(cart.size() == 0) {
					cartActionMessage = "カートに商品がありません";
				}


				request.setAttribute("cartActionMessage", cartActionMessage);
				request.getRequestDispatcher(EcHelper.CART_PAGE).forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("errorMessage", e.toString());
				response.sendRedirect("Error");
			}
		}

}
