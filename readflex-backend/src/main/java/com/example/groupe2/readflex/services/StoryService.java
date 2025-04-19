package com.example.groupe2.readflex.services;

import com.example.groupe2.readflex.models.entities.Story;
import com.example.groupe2.readflex.repositories.StoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StoryService {

    @Autowired
    private StoryRepository storyRepository;


    public List<Story> getAllStories(){
        return storyRepository.findAll();
    }

    public Story updateStory(long id, Story story){

        Optional<Story> dataStory = storyRepository.findById(id);

        if(dataStory.isPresent()){
            Story _story = dataStory.get();
            if(story.getStoryName()!=null) { _story.setStoryName(story.getStoryName());}
            if(story.getStoryContent()!=null) { _story.setStoryContent(story.getStoryContent());}
            if(story.getStoryImage()!=null) {_story.setStoryImage(story.getStoryImage());}
            if(story.getStoryDescription()!=null) {_story.setStoryDescription(story.getStoryDescription());}

            return storyRepository.save(_story);
        }
        return null;
    }

    public void deleteStory(long id){
        storyRepository.deleteById(id);
    }

    public Story createStory(Story story){
        return storyRepository.save(story);
    }

    public Optional<Story> getStoryById(long id){
        return storyRepository.findById(id);
    }

}
