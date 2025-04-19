package com.example.groupe2.readflex.services;

import com.example.groupe2.readflex.models.entities.Categorie;
import com.example.groupe2.readflex.repositories.CategorieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategorieService {

    @Autowired
    private CategorieRepository categorieRepository;

    public List<Categorie> getAllCategories(){
        List<Categorie> _categories = categorieRepository.findAll();
        if(_categories.isEmpty()) return null;
        return _categories;
    }
    public Categorie getCategorieById(Long id){
        if(id == null) return null;
        Optional<Categorie> _categorie = categorieRepository.findById(id);
        if(_categorie.isEmpty()) return null;
        return _categorie.get();
    }
    public Categorie saveCategorie(Categorie categorie){
        if(categorie == null) return null;
        return categorieRepository.save(categorie);
    }
    public Categorie deleteCategorie(Long id){
        if(id == null) return null;
        Optional<Categorie> _categorie = categorieRepository.findById(id);
        if(_categorie.isEmpty()) return null;
        categorieRepository.deleteById(id);
        return _categorie.get();
    }
    public Categorie updateCategorie(Long id , Categorie categorie){
        if(id == null || categorie == null) return null;

        Optional<Categorie> _categorie = categorieRepository.findById(id);
        if(_categorie.isEmpty()) return null;
        if(categorie.getName() != null ) _categorie.get().setName(categorie.getName());
        return categorieRepository.save(_categorie.get());
    }

}
