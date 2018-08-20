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
import beans.CustomDataBeans;
import beans.DeliveryMethodDataBeans;
import beans.ItemDataBeans;
import dao.DeliveryMethodDAO;
import dao.ItemDAO;

/**
 * 商品追加画面
 * @author m-takeuchi
 *
 */
@WebServlet("/ItemAdd")
public class ItemAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 文字化け対策 */
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		try {
			// 配送方法をDBから取得
			ArrayList<DeliveryMethodDataBeans> dMDBList = DeliveryMethodDAO.getAllDeliveryMethodDataBeans();
			request.setAttribute("dmdbList", dMDBList);

			String customName = request.getParameter("customName");
			session.setAttribute("customName", customName);
			int i = 0;
			int getId = 0;

			//カートを取得
			ArrayList<BuyDataBeans> cart = (ArrayList<BuyDataBeans>) session.getAttribute("cart");
			//セッションにカートがない場合カートを作成
			if (cart == null) {
				cart = new ArrayList<BuyDataBeans>();
			}else if(cart.size() != 0) {
				i = (cart.size()) -1 ;
				getId = cart.get(i).getId();
			}
			ArrayList<ItemDataBeans>typeList= ItemDAO.getTypeList();

			ArrayList<String> list = new ArrayList<String>();
			for (int y = 0; y < typeList.size(); y++) {
			String type = typeList.get(y).getItemType();
			String value = request.getParameter(type);
			String []values = value.split(",",0);
			list.add(values[0]);
			list.add(values[1]);
			}

			BuyDataBeans idb = BuyDataBeans.settingInfo(list);
			idb.setCustomName(customName);
			idb.setId(getId + 1);
			idb.setTotalPrice(ItemDAO.getTotalPrice((CustomDataBeans)idb));
			//カートに商品を追加。
			cart.add(idb);

			session.setAttribute("cart", cart);
			request.setAttribute("typeList", typeList);

			request.setAttribute("cartActionMessage", "商品を追加しました");
			request.getRequestDispatcher(EcHelper.CART_PAGE).forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
