class BackgroundFacade
  class << self
    def background_image(location)
      image_data = UnsplashService.find_background_image(location)
      Background.new(location, image_data)
    end
  end
end
