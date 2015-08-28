module Web::Controllers::Talks
  class Create
    include Web::Action

    params do
      param :talk do
        param :title, presence: true
        param :author, presence: true
        param :link
      end
    end

    def call(params)
      if params.valid?
        talk = Talk.new(params[:talk])
        TalkRepository.create(talk)
        redirect_to '/talks'
      end
    end
  end
end
