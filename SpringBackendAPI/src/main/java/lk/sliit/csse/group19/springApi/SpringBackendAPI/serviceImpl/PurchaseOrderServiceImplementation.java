package lk.sliit.csse.group19.springApi.SpringBackendAPI.serviceImpl;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lk.sliit.csse.group19.springApi.SpringBackendAPI.Model.PurchaseOrder;
import lk.sliit.csse.group19.springApi.SpringBackendAPI.Model.PurchaseOrderItem;
import lk.sliit.csse.group19.springApi.SpringBackendAPI.Model.PurchaseOrderItemId;
import lk.sliit.csse.group19.springApi.SpringBackendAPI.repositories.PurchaseOrderItemRepository;
import lk.sliit.csse.group19.springApi.SpringBackendAPI.repositories.PurchaseOrderRepository;
import lk.sliit.csse.group19.springApi.SpringBackendAPI.services.PurchaseOrderService;

@Service
public class PurchaseOrderServiceImplementation implements PurchaseOrderService {

	@Autowired
	private PurchaseOrderRepository purchaseOrderRepository;
	@Autowired
	private PurchaseOrderItemRepository purchaseOrderItemRepository;
	
	@Override
	public Iterable<PurchaseOrder> getAllPurchaseOrders() {
		return this.purchaseOrderRepository.findAll();
	}
	
	private java.sql.Date DateFromString(String textDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("MMMM-dd-yyyy");
		try {
				java.util.Date parsedDate = sdf.parse(textDate.replaceAll(",", "").replaceAll(" ","-"));
				return new java.sql.Date(parsedDate.getTime());
		}catch(ParseException pe) {}
		return null;
	}
	@Override
	public PurchaseOrder insertPurchaseOrder(Map<String,Object> purchaseOrder) {
		
		PurchaseOrder po = new PurchaseOrder();
		po.setExpectedDate(DateFromString(purchaseOrder.get("expectedDate").toString()));
		po.setInitiatedDate(DateFromString(purchaseOrder.get("initiatedDate").toString()));	
		po.setSiteManagerId(purchaseOrder.get("siteManagerId").toString());
		po.setStatus(purchaseOrder.get("status").toString());
		
		ArrayList<LinkedHashMap<String, Object>> items = (ArrayList<LinkedHashMap<String, Object>>) purchaseOrder.get("items");
		PurchaseOrder savedOrder = (PurchaseOrder) this.purchaseOrderRepository.save(po);
		
		List<PurchaseOrderItem> list = new ArrayList<>();
		for(LinkedHashMap<String, Object> i : items) {
			PurchaseOrderItem temp = new PurchaseOrderItem();
			temp.setPurchaseOrderItemId(new PurchaseOrderItemId(savedOrder.getId(),Integer.parseInt(i.get("id").toString())));
			temp.setQuantity(Integer.parseInt(i.get("quantity").toString()));
			list.add(temp);
		}
		purchaseOrderItemRepository.saveAll(list);
		return savedOrder;
	}

	@Override
	public void deletePurchaseOrder(int id) {
		purchaseOrderRepository.deleteById(id);	
	}

	@Override
	public Iterable<PurchaseOrder> getPurchaseOrdersBySiteMangerIdAndStatus(String siteManagerId, String status) {
		
		if(status.compareToIgnoreCase("ALL") == 0) 
			return purchaseOrderRepository.findBySiteManagerId(siteManagerId);
		return purchaseOrderRepository.findBySiteManagerIdAndStatus(siteManagerId, status);
	}

	



}
