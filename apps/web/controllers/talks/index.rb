module Web::Controllers::Talks
  class Index
    include Web::Action

    expose :talks
    def call(params)
      @talks = TalkRepository.all
    end
  end
end
