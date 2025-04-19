package com.example.groupe2.readflex.controllers;

import com.example.groupe2.readflex.models.entities.Actor;
import com.example.groupe2.readflex.services.ActorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("http://localhost:4200")
@Controller
@RequestMapping("/api/actor")
public class ActorController {

    @Autowired
    private ActorService actorService;

    @GetMapping("/get/all")
    public ResponseEntity<List<Actor>> getAllActors(){
        List<Actor> actors = actorService.getAllActors();
        if(actors.isEmpty()){
            return new ResponseEntity<>(null, HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(actors, HttpStatus.OK);
    }

    @GetMapping("/get/by/id/{id}")
    public ResponseEntity<Actor> getActorById(@PathVariable(name = "id") long id){
        Actor actor = actorService.findActorById(id).orElse(null);
        if(actor == null){
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(actor, HttpStatus.OK);
    }


    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Actor> deleteActor(@PathVariable(name = "id")  long id ){
        Actor actor = actorService.findActorById(id).orElse(null);
        if(actor == null){
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        actorService.deleteActor(id);
        return new ResponseEntity<>(actor, HttpStatus.OK);
    }

    @PostMapping("/create")
    public ResponseEntity<Actor> createActor(@RequestBody Actor actor){
        Actor newActor = actorService.createActor(actor);
        if(newActor == null){
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(newActor, HttpStatus.CREATED);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<Actor> updateActor(@PathVariable(name = "id")  long id, @RequestBody Actor actor){
        Actor updatedActor = actorService.updateActor(id, actor);
        if(updatedActor == null){
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(updatedActor, HttpStatus.OK);
    }
}
