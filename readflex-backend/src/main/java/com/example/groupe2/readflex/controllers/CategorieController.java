package com.example.groupe2.readflex.controllers;

import com.example.groupe2.readflex.services.CategorieService;
import com.example.groupe2.readflex.models.entities.Categorie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@Controller
@RequestMapping("/api/categorie")
public class CategorieController {

    @Autowired
    CategorieService categorieService;

    @GetMapping("/get/all")
    public ResponseEntity<List<Categorie>> getAllCategories(){
        List<Categorie> _categories = categorieService.getAllCategories();
        if(_categories.isEmpty()) {
            return new ResponseEntity<>(null, HttpStatus.NO_CONTENT);
        }
        return ResponseEntity.ok(_categories);
    }

    @GetMapping("/get/by/id/{id}")
    public ResponseEntity<Categorie> getCategorieById(@PathVariable("id") Long id){
        Categorie _categorie = categorieService.getCategorieById(id);
        if(_categorie != null) {
            return ResponseEntity.ok(categorieService.getCategorieById(id));
        }
        return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
    }

    @PostMapping("/create")
    public ResponseEntity<Categorie> createCategorie(@RequestBody Categorie categorie){
        if(categorie == null) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        return ResponseEntity.ok(categorieService.saveCategorie(categorie));
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Categorie> deleteCategorie(@PathVariable("id") Long id){
        if(id == null) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        Categorie _categorie = categorieService.deleteCategorie(id);
        return new ResponseEntity<>(_categorie, HttpStatus.OK);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<Categorie> updateCategorie(@PathVariable("id") Long id, @RequestBody Categorie categorie){
        if (categorie == null || id == null ) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        Categorie _categorie = categorieService.updateCategorie(id, categorie);
        return ResponseEntity.ok(_categorie);
    }


}
