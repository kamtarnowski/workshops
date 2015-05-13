class AvatarsController < ApplicationController

  def random_avatar
    array = ['angelina.jpg', 'dicaprio.jpg', 'eva.jpg',
             'justin.jpg', 'monica.jpg', 'obama.jpg', 'penelope.jpg', 'peter.jpg']
    @sample = array.sample
    respond_to do |format|
      format.js { render layout: false }
    end
  end

end