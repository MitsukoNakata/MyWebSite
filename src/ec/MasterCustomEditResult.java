package ec;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.CustomDataBeans;
import dao.CustomDAO;

/**
 * 編集内容受け取り
 * @author m-takeuchi
 *
 */
@WebServlet("/MasterCustomEditResult")
public class MasterCustomEditResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterCustomEditResult() {
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
						CustomDAO.deleteItem(Integer.parseInt(deleteItemId));
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
						CustomDataBeans idb = new CustomDataBeans();

						idb.setId(Integer.parseInt(updateItemId));
						idb.setCustomTypeNum(Integer.parseInt(updateItem[0]));
						idb.setCustomName(updateItem[1]);
						idb.setBase(Integer.parseInt(updateItem[2]));
						idb.setCpu(Integer.parseInt(updateItem[3]));
						idb.setRam(Integer.parseInt(updateItem[4]));
						idb.setGraphics(Integer.parseInt(updateItem[5]));
						idb.setStorage(Integer.parseInt(updateItem[6]));
						idb.setOs(Integer.parseInt(updateItem[7]));
						idb.setOffice(Integer.parseInt(updateItem[8]));
						idb.setAssemble(Integer.parseInt(updateItem[9]));

						CustomDAO.updateItem(idb);
					}
				actionMessage = "選択された商品の情報を更新しました";
				}else {
					actionMessage = "更新する商品が選択されていません";
				}break;

			// 新商品追加の処理
			case "add":
				String[] customItemList = request.getParameterValues("newCustomMenu");
				boolean isEmpty = false;

				//追加項目の未選択チェック
				for(String customItem : customItemList) {
					isEmpty = customItem.isEmpty();
					if(isEmpty == true) {
						break;
					}
				}

				if(isEmpty == false) {

					CustomDataBeans idb = new CustomDataBeans();

					idb.setCustomTypeNum(Integer.parseInt(customItemList[0]));
					idb.setCustomName(customItemList[1]);
					idb.setBase(Integer.parseInt(customItemList[2]));
					idb.setCpu(Integer.parseInt(customItemList[3]));
					idb.setRam(Integer.parseInt(customItemList[4]));
					idb.setGraphics(Integer.parseInt(customItemList[5]));
					idb.setStorage(Integer.parseInt(customItemList[6]));
					idb.setOs(Integer.parseInt(customItemList[7]));
					idb.setOffice(Integer.parseInt(customItemList[8]));
					idb.setAssemble(Integer.parseInt(customItemList[9]));

					CustomDAO.insertItem(idb);
					actionMessage = "入力された商品を追加しました";
				}else {
					actionMessage = "追加する項目が不足してます";
				}break;

			default:
				actionMessage = "不正な処理です";
			}
			//各メッセージを格納し直前のカテゴリーパーツの画面にリダイレクト
			session.setAttribute("actionMessage",actionMessage);
			response.sendRedirect("MasterCustomEdit");

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}

}