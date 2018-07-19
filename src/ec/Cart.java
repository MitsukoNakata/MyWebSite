package ec;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 文字化け対策 */
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		try {
			String customName = request.getParameter("customName");
			request.setAttribute("customName", customName);

			// 配送方法をDBから取得
			ArrayList<DeliveryMethodDataBeans> dMDBList = DeliveryMethodDAO.getAllDeliveryMethodDataBeans();
			request.setAttribute("dmdbList", dMDBList);

			//選択されたパーツのIDを型変換し利用
//			int base = Integer.parseInt(request.getParameter("base"));
//			int cpu = Integer.parseInt(request.getParameter("cpu"));
//			int ram = Integer.parseInt(request.getParameter("ram"));
//			int graphics = Integer.parseInt(request.getParameter("graphics"));
//			int storage = Integer.parseInt(request.getParameter("storage"));
//			int os = Integer.parseInt(request.getParameter("os"));
//			int office= Integer.parseInt(request.getParameter("office"));

//			CustomDataBeans cItemList = new CustomDataBeans();
//			cItemList.setBase(base);
//			cItemList.setCpu(cpu);
//			cItemList.setRam(ram);
//			cItemList.setGraphics(graphics);
//			cItemList.setStorage(storage);
//			cItemList.setOs(os);
//			cItemList.setOffice(office);

			//カスタマイズ画面で選択されたパーツのIDをLIST化する
			List<Integer> selectList = new ArrayList<>();
			ArrayList<ItemDataBeans>typeList= ItemDAO.getTypeList();   //パーツ名のリスト取得用　順番ミス防止
			request.setAttribute("typeList", typeList);

			for (int i = 0; i < typeList.size(); i++) {           //パーツの順番通り選択したパーツIDをLISTに入れる
			String type = typeList.get(i).getItemType();
			selectList.add(Integer.parseInt(request.getParameter(type)));
			}

			for (int i = 0; i < selectList.size(); i++) {     //選択されたパーツの各情報をパーツ名でそれぞれ格納　　　
			String type = typeList.get(i).getItemType();
			System.out.println(selectList.get(i));
			ItemDataBeans item = ItemDAO.getItemByItemID(selectList.get(i));
			request.setAttribute(type, item);
			}
			request.getRequestDispatcher(EcHelper.CART_PAGE).forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
