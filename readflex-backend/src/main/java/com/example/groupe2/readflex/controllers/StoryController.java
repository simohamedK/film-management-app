package com.example.groupe2.readflex.controllers;

import com.example.groupe2.readflex.models.entities.Story;
import com.example.groupe2.readflex.services.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("http://localhost:4200")
@Controller
@RequestMapping("/api/story")
public class StoryController {

    @Autowired
    private StoryService storyService;

    @GetMapping("/get/all")
    public ResponseEntity<List<Story>> getAllStories(){
        List<Story> stories = storyService.getAllStories();
        if(stories.isEmpty()){
            return new ResponseEntity<>(null, HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(stories, HttpStatus.OK);
    }

    @GetMapping("/get/by/id/{id}")
    public ResponseEntity<Story> getStoryById(@PathVariable(name = "id")  long id){
        Story story = storyService.getStoryById(id).orElse(null);
        if(story == null){
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(story, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Story> deleteStory(@PathVariable(name = "id")  long id ){
        Story story = storyService.getStoryById(id).orElse(null);
        if(story == null){
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        storyService.deleteStory(id);
        return new ResponseEntity<>(story, HttpStatus.OK);
    }

    @PostMapping("/create")
    public ResponseEntity<Story> createStory(@RequestBody Story story){
        Story newStory = storyService.createStory(story);
        if(newStory == null){
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(newStory, HttpStatus.CREATED);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<Story> updateStory(@PathVariable(name = "id")  long id, @RequestBody Story story){
        Story updatedStory = storyService.updateStory(id, story);
        if(updatedStory == null){
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(updatedStory, HttpStatus.OK);
    }

}
