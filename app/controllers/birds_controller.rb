class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
  #   #render json: bird
  #   #render json: bird.slice(:id, :name, :species)
  #   #render json: {
  #     #id: bird.id,
  #     #name: bird.name,
  #     #species: bird.species
  #   #}
  #   render json: bird, except: [:created_at, :updated_at]
  
    if bird
      render json: {id: bird.id, name: bird.name, species: bird.species}
    else
      render json: {message: "Bird not found"}
    end


  end
end



# The only and except keywords are actually parameters of the to_json method, obscured by that magic. The last code snippet can be rewritten in full to show what is actually happening:


# When using find_by, if the record is not found, nil is returned. As we have it set up, if params[:id] does not match a valid id, nil will be assigned to the bird variable.

# As nil is a false-y value in Ruby, this gives us the ability to write our own error messaging in the event that a request is made for a record that doesn't exist: