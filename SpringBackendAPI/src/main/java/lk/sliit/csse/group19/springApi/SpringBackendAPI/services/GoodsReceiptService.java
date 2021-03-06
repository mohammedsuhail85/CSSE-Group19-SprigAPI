package lk.sliit.csse.group19.springApi.SpringBackendAPI.services;

import java.util.Optional;

import lk.sliit.csse.group19.springApi.SpringBackendAPI.Model.GoodsReceipt;

/**
 * @author Dev
 *
 */
public interface GoodsReceiptService {

	public Iterable<GoodsReceipt> getAllGoodsReceipts();
	public Optional<GoodsReceipt> findGoodsReceipt(int id);
	public GoodsReceipt insertGoodsReceipt(int purchaseOrderId, GoodsReceipt goodsReceipt);
	public GoodsReceipt updateGoodsReceipt(int id, GoodsReceipt goodsReceiptDetails);
	public boolean deleteGoodsReceipt(int id);
	public Iterable<GoodsReceipt> getGoodsReciptsByPurchaseOrderIdAndStatus(int purchaseOrderId,String status);
}
