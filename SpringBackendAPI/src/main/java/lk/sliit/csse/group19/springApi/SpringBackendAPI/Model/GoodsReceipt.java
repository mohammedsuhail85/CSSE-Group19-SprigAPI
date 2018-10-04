/**
 * GoodsReceipt Table Model
 */
package lk.sliit.csse.group19.springApi.SpringBackendAPI.Model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * @author Dev
 *
 */
@Entity
public class GoodsReceipt {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int purchaseOrderId;
	private int supplierId;
	private String status;
	private String goodsReceiptComment;
	private Date issueDate;
	
	public int getId() {
		return id;
	}
	public int getPurchaseOrderId() {
		return purchaseOrderId;
	}
	public int getSupplierId() {
		
		return supplierId;
	}
	public String getStatus() {
		return status;
	}
	public String getGoodsReceiptComment() {
		return goodsReceiptComment;
	}
	public Date getIssueDate() {
		return issueDate;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setPurchaseOrderId(int purchaseOrderId) {
		this.purchaseOrderId = purchaseOrderId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setGoodsReceiptComment(String goodsReceiptComment) {
		this.goodsReceiptComment = goodsReceiptComment;
	}
	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}
	
}
