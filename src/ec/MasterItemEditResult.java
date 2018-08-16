package ec;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ItemDataBeans;
import dao.ItemDAO;

/**
 * 編集内容受け取り
 * @author m-takeuchi
 *
 */
@WebServlet("/MasterItemEditResult")
public class MasterItemEditResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterItemEditResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 文字化け対策 */
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		/*チェックされた商品リストを取得*/
		String[] selectItemIdList = request.getParameterValues("select_item_id_list");

		try {
			String actionMessage = "";

			// 削除ボタンか追加ボタンが押されたのか確認
			String confirmed = request.getParameter("confirmButton");

			switch (confirmed) {

			// 選択された商品の削除処理
			case "delete":

				if (selectItemIdList !=null ) {
					for(String deleteItemId : selectItemIdList) {
						ItemDAO.deleteItem(Integer.parseInt(deleteItemId));
					}
				actionMessage = "選択された商品を削除しました";
				}else {
					actionMessage = "削除する商品が選択されていません";
				}break;

			// 選択された商品の更新処理
			case "update":

				if (selectItemIdList !=null ) {
					for(String updateItemId : selectItemIdList) {
						String[] updateItem = request.getParameterValues(updateItemId);
						ItemDataBeans idb = new ItemDataBeans();
						idb.setId(Integer.parseInt(updateItemId));
						idb.setName(updateItem[0]);
						idb.setPrice(Integer.parseInt(updateItem[1]));
						idb.setFileName(updateItem[2]);
						idb.setSoket(updateItem[3]);
						idb.setRamType(updateItem[4]);
						idb.setLink(updateItem[5]);

						ItemDAO.updateItem(idb);

					}
				actionMessage = "選択された商品の情報を更新しました";
				}else {
					actionMessage = "更新する商品が選択されていません";
				}break;

			// 新商品追加の処理
			case "add":

				int inputTypeId = Integer.parseInt(request.getParameter("type_category_id"));
				String inputName = request.getParameter("name_of_part");
				String  booleanPrice = request.getParameter("price");
				if(inputName.isEmpty() == false && booleanPrice.isEmpty() == false) {
					int inputPrice = Integer.parseInt(booleanPrice);
					String inputPicture = request.getParameter("picture");
					String inputSoket = request.getParameter("soket");
					String inputRamType = request.getParameter("ramType");
					String inputLink= request.getParameter("link");

					ItemDataBeans idb = new ItemDataBeans();
					idb.setTypeNum(inputTypeId);
					idb.setName(inputName);
					idb.setPrice(inputPrice);
					idb.setFileName(inputPicture);
					idb.setSoket(inputSoket);
					idb.setRamType(inputRamType);
					idb.setLink(inputLink);

					ItemDAO.insertItem(idb);
					actionMessage = "入力された商品を追加しました";
				}else {
					actionMessage = "追加する項目が入力されていません";
				}break;

			default:
				actionMessage = "不正な処理です";
			}
			//各メッセージを格納し直前のカテゴリーパーツの画面にリダイレクト
			session.setAttribute("actionMessage",actionMessage);
			response.sendRedirect("MasterItemEdit");

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}

}