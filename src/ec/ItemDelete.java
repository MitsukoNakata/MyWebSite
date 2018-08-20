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
 * 買い物かごから商品削除画面
 * @author t-takeuchi
 *
 */
@WebServlet("/ItemDelete")
public class ItemDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			ArrayList<ItemDataBeans>typeList= ItemDAO.getTypeList();
			// 配送方法をDBから取得
			ArrayList<DeliveryMethodDataBeans> dMDBList = DeliveryMethodDAO.getAllDeliveryMethodDataBeans();

			String[] deleteItemIdList = request.getParameterValues("delete_item_id_list");
			ArrayList<BuyDataBeans> cart = (ArrayList<BuyDataBeans>)session.getAttribute("cart");

			String cartActionMessage = "";
			if (deleteItemIdList != null) {
				//削除対象の商品を削除
				for (String deleteItemId : deleteItemIdList) {
					for (BuyDataBeans cartInItem : cart) {
						if (cartInItem.getId() == Integer.parseInt(deleteItemId)) {
							cart.remove(cartInItem);
							break;
						}
					}
				}
				cartActionMessage = "削除しました";
			} else {
				cartActionMessage = "削除する商品が選択されていません";
			}
			request.setAttribute("dmdbList", dMDBList);
			request.setAttribute("typeList", typeList);
			request.setAttribute("cartActionMessage", cartActionMessage);
			request.getRequestDispatcher(EcHelper.CART_PAGE).forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
