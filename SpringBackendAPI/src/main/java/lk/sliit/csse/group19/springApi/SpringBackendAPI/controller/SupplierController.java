package lk.sliit.csse.group19.springApi.SpringBackendAPI.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lk.sliit.csse.group19.springApi.SpringBackendAPI.Model.Supplier;
import lk.sliit.csse.group19.springApi.SpringBackendAPI.Model.Supplier;
import lk.sliit.csse.group19.springApi.SpringBackendAPI.services.SupplierService;

/**
 * 
 * @author Dev
 *
 */
@RestController
@RequestMapping("/supplier")
public class SupplierController {

	@Autowired
	private SupplierService supplierService;
	
	@GetMapping
	public @ResponseBody Iterable<Supplier> getAllSuppliers(){
		return this.supplierService.getAllSuppliers();
	}
	
	@PostMapping
	public Supplier insertSupplier(@Valid @RequestBody Supplier supplier) {
		return this.supplierService.insertSupplier(supplier);
	}
	
	@DeleteMapping("/{id}")
	public void deleteSupplier(@PathVariable(value="id") int id) {
		supplierService.deleteSupplier(id);
	}
}
