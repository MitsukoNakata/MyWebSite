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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session = request.getSession();
	BuyDataBeans bdb = (BuyDataBeans)session.getAttribute("bdb");

	bdb.setUserId((int) session.getAttribute("userId"));
	session.setAttribute("bdb", bdb);

	request.getRequestDispatcher(EcHelper.BUY_PAGE).forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			//選択された配送方法IDを取得


			int inputDeliveryMethodId = Integer.parseInt(request.getParameter("delivery_method_id"));
			//選択されたIDをもとに配送方法Beansを取得
			DeliveryMethodDataBeans userSelectDMB = DeliveryMethodDAO.getDeliveryMethodDataBeansByID(inputDeliveryMethodId);

			BuyDataBeans bdb = new BuyDataBeans();

			bdb.setCustomName((String) session.getAttribute("customName"));
			bdb.setTotalPrice(Integer.parseInt(request.getParameter("totalPrice")));
			bdb.setBase(Integer.parseInt(request.getParameter("base")));
			bdb.setCpu(Integer.parseInt(request.getParameter("cpu")));
			bdb.setRam(Integer.parseInt(request.getParameter("ram")));
			bdb.setGraphics(Integer.parseInt(request.getParameter("graphics")));
			bdb.setStorage(Integer.parseInt(request.getParameter("storage")));
			bdb.setOffice(Integer.parseInt(request.getParameter("office")));
			bdb.setOs(Integer.parseInt(request.getParameter("os")));
			bdb.setAssemble(Integer.parseInt(request.getParameter("assemble")));
			bdb.setDeliveryMethodId(userSelectDMB.getId());
			bdb.setDeliveryMethodPrice(userSelectDMB.getPrice());
			bdb.setDeliveryMethodName(userSelectDMB.getName());
			//購入確定で利用
			session.setAttribute("bdb", bdb);

			Boolean isLogin = session.getAttribute("isLogin") != null ? (Boolean) session.getAttribute("isLogin") : false;
			//ArrayList<ItemDataBeans> cart = (ArrayList<ItemDataBeans>) session.getAttribute("cart");

			if (!isLogin) {

				// Sessionにリターンページ情報を書き込む
				session.setAttribute("returnStrUrl", "Buy");
				// Login画面にリダイレクト
				response.sendRedirect("Login");
				return;
				}
			bdb.setUserId((int) session.getAttribute("userId"));
			session.setAttribute("bdb", bdb);

			request.getRequestDispatcher(EcHelper.BUY_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
